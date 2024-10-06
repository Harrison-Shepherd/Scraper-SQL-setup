# Core/Full_scrape.py
import os
import sys
import logging  # Import logging
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import pandas as pd
import json
import Fixture as ft
import Match as mt
import Period_data as pd_data
import League_information as li
from Utils.sport_category import determine_sport_category
from DatabaseUtils.SqlConnector import connect
from Utils.logger import setup_logging  # Import setup_logging from logger

# Set up logging to file
log_file = setup_logging('full_scrape.log')
logging.info("Starting Full Scrape")

# Load JSON files for field mappings
with open("Assets/jsons/unique fields/matchFields.json", "r") as file:
    match_fields = json.load(file)

with open("Assets/jsons/unique fields/fixtureFields.json", "r") as file:
    fixture_fields = json.load(file)

with open("Assets/jsons/unique fields/periodFields.json", "r") as file:
    period_fields = json.load(file)

with open("Assets/jsons/unique fields/scoreFlowFields.json", "r") as file:
    score_flow_fields = json.load(file)

def get_table_columns(connection, table_name):
    """Fetch column names from a given database table."""
    cursor = connection.cursor()
    query = f"SHOW COLUMNS FROM {table_name}"
    cursor.execute(query)
    columns = [column[0] for column in cursor.fetchall()]
    cursor.close()
    return columns

def insert_data_dynamically(connection, table_name, data_dict, json_fields):
    """Insert data dynamically into the table by matching fields between data and table."""
    # Extract the sub-object from the JSON (e.g., 'fixture_fields', 'match_fields')
    if 'fixture_fields' in json_fields:
        json_fields = json_fields['fixture_fields']
    elif 'match_fields' in json_fields:
        json_fields = json_fields['match_fields']
    elif 'period_fields' in json_fields:
        json_fields = json_fields['period_fields']
    elif 'score_flow_fields' in json_fields:
        json_fields = json_fields['score_flow_fields']
    else:
        logging.error(f"Unknown JSON field structure in {json_fields}")
        return

    required_fields = json_fields.get('required_fields', [])
    optional_fields = json_fields.get('optional_fields', [])

    # Combine required and optional fields
    available_fields = required_fields + optional_fields

    # Get the actual table columns from the database
    columns = get_table_columns(connection, table_name)

    # Find which fields from the data_dict can be inserted into the table (matching columns)
    matched_fields = [field for field in available_fields if field in columns]

    # Remove duplicates (especially for cases like 'positionCode')
    matched_fields = list(dict.fromkeys(matched_fields))  # Removes duplicates while maintaining order

    # Log matched fields for debugging
    logging.info(f"Inserting into {table_name}, Matched fields: {matched_fields}")

    # Extract the values for the matched fields, ensuring missing fields are set to None (NULL in SQL)
    values = [data_dict.get(field, None) for field in matched_fields]

    # Prepare SQL placeholders and the query
    placeholders = ', '.join(['%s'] * len(matched_fields))
    query = f"INSERT INTO {table_name} ({', '.join(matched_fields)}) VALUES ({placeholders})"

    cursor = connection.cursor()
    try:
        cursor.execute(query, values)
        connection.commit()
        logging.info(f"Successfully inserted data into {table_name}")
    except Exception as e:
        logging.error(f"Error executing query for {table_name}: {e}")
    finally:
        cursor.close()

def scrape_entire_database():
    connection = connect()  # Connect to the database
    if connection is None:
        logging.error("Failed to connect to the database.")
        return

    # Step 1: Fetch all leagues
    leagues_df, _ = li.fetch_leagues()

    # Step 2: Iterate through each league
    for _, league in leagues_df.iterrows():
        league_id = league['id']
        league_name = league['league_season']  # Use raw league name for filtering
        regulation_periods = league['regulationPeriods']
        fixture_title = league['name']
        fixture_year = league['season']
        fixture_id = league['id']

        # Step 3: Fetch the fixture for the league
        fixture = ft.fetch_fixture(league_id, '', fixture_id, regulation_periods)
        if fixture.empty:
            logging.warning(f"No fixture data found for league {league_id}.")
            continue

        # Add sportId (initialized to None)
        fixture['sportId'] = None

        # Step 4: Iterate through each match in the fixture
        for index, match in fixture.iterrows():
            if match['matchStatus'] in ['scheduled', 'incomplete']:
                logging.info(f"Skipping match {match['matchId']} due to status {match['matchStatus']}")
                continue

            match_id = match['matchId']
            sport_category, sport_id = determine_sport_category(
                regulation_periods,
                [match['homeSquadId'], match['awaySquadId']],
                league_name,
                league_id
            )
            logging.info(f"Identified sport: {sport_category} for league {league_name} with sport ID: {sport_id}")

            # Assign sport_id to the fixture row
            fixture.at[index, 'sportId'] = sport_id

            # Determine table names dynamically based on the sport category
            fixture_table = f"{sport_category.lower().replace(' ', '_')}_fixture"
            match_table = f"{sport_category.lower().replace(' ', '_')}_match"
            period_table = f"{sport_category.lower().replace(' ', '_')}_period"
            score_flow_table = f"{sport_category.lower().replace(' ', '_')}_score_flow"

            # Insert fixture data
            fixture_data = {
                **match,
                'fixtureId': fixture_id,
                'sportId': sport_id,
                'matchId': match_id
            }

            try:
                insert_data_dynamically(connection, fixture_table, fixture_data, fixture_fields)
            except Exception as e:
                logging.error(f"Error inserting fixture data into {fixture_table}: {e}")

            # Now fetch and insert match data
            try:
                match_data = mt.fetch_data(league_id, match_id, fixture_id, sport_id)

                # Loop through each row (player's stats) in the match_data DataFrame and insert into the match table
                for index, row in match_data.iterrows():
                    if not row.get('playerId'):
                        logging.warning(f"Missing playerId for row: {row}")
                    insert_data_dynamically(connection, match_table, row.to_dict(), match_fields)
            except Exception as e:
                logging.error(f"Error inserting match data into {match_table}: {e}")

            # Fetch and insert period data for each match
            try:
                period_data = pd_data.fetch_period_stats(league_id, match_id)

                if period_data is not None and not period_data.empty:
                    # Ensure that the matchId is present in each row of the period data
                    period_data['matchId'] = match_id  # Set matchId for all rows in the period data

                    # Generate periodId in the format matchId_period (e.g., 80050101_1)
                    period_counter = {}
                    for index, row in period_data.iterrows():
                        period_num = row.get('period', 1)
                        if match_id not in period_counter:
                            period_counter[match_id] = {}
                        if period_num not in period_counter[match_id]:
                            period_counter[match_id][period_num] = f"{match_id}_{period_num}"
                        period_data.at[index, 'periodId'] = period_counter[match_id][period_num]

                    # Loop through each row (player's stats in each period) in the period_data DataFrame
                    for index, row in period_data.iterrows():
                        insert_data_dynamically(connection, period_table, row.to_dict(), period_fields)
                else:
                    logging.warning(f"No period data found for match {match_id}.")
            except Exception as e:
                logging.error(f"Error inserting period data into {period_table}: {e}")

            # Fetch and insert score flow data for each match
            try:
                score_flow_data = mt.fetch_score_flow_data(league_id, match_id)

                if score_flow_data is not None and not score_flow_data.empty:
                    # Generate unique scoreFlowId for each row within the match
                    score_flow_counter = 1
                    for index, row in score_flow_data.iterrows():
                        score_flow_id = f"{match_id}_flow_{score_flow_counter}"  # Modify to include flow counter
                        score_flow_data.at[index, 'scoreFlowId'] = score_flow_id
                        score_flow_counter += 1

                    # Loop through each row in the score_flow_data DataFrame
                    for index, row in score_flow_data.iterrows():
                        insert_data_dynamically(connection, score_flow_table, row.to_dict(), score_flow_fields)
                else:
                    logging.warning(f"No score flow data found for match {match_id}.")
            except Exception as e:
                logging.error(f"Error inserting score flow data into {score_flow_table}: {e}")

    connection.close()

if __name__ == "__main__":
    scrape_entire_database()
