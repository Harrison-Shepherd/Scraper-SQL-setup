#Core/match.py
import requests
import pandas as pd
import numpy as np
import logging
import Core.League_information as li
from Utils.logger import setup_logging
from Utils.sanitize_filename import sanitize_filename  # Import from the new sanitize_filename.py file

# Set up logging for match processing
setup_logging('match_log.log')  # Log filename, saved in the Logs directory

def fetch_data(league_id, match_id, fixture_id, sport_id):
    """
    Fetches match data for a given league and match, processes the data.
    
    Parameters:
    league_id (int): The ID of the league.
    match_id (int): The ID of the match.
    fixture_id (int): The ID of the fixture.
    sport_id (int): The ID of the sport.

    Returns:
    pd.DataFrame: Processed DataFrame containing match data.
    """
    logging.info(f"Fetching data for league {league_id} and match {match_id}.")

    # Get and sanitize the league name and season
    league_name_and_season = li.get_league_name_and_season(league_id)
    league_name_and_season = sanitize_filename(league_name_and_season)

    url = f'https://mc.championdata.com/data/{league_id}/{match_id}.json'
    response = requests.get(url)
    
    if response.status_code != 200:
        logging.error(f"Failed to retrieve data for match {match_id} in league {league_id}: {response.status_code}")
        print(f"Failed to retrieve data for match {match_id} in league {league_id}: {response.status_code}")
        return pd.DataFrame()

    data = response.json()
    
    if ('matchStats' in data and isinstance(data['matchStats'], dict) and
        'playerStats' in data['matchStats'] and isinstance(data['matchStats']['playerStats'], dict) and
        'player' in data['matchStats']['playerStats']):
        
        # Extract player, team, and player information
        box = pd.DataFrame(data['matchStats']['playerStats']['player'])
        teams = pd.DataFrame(data['matchStats']['teamInfo']['team'])
        players = pd.DataFrame(data['matchStats']['playerInfo']['player'])

        # Merge player and team information into the main data
        box = pd.merge(box, players, how='outer')
        box = pd.merge(box, teams, how='outer')

        # Get team IDs and names
        home_id = data['matchStats']['matchInfo']['homeSquadId']
        away_id = data['matchStats']['matchInfo']['awaySquadId']
        home = teams.loc[teams['squadId'] == home_id, 'squadName'].iloc[0] if not teams.empty else "Unknown Home Team"
        away = teams.loc[teams['squadId'] == away_id, 'squadName'].iloc[0] if not teams.empty else "Unknown Away Team"

        # Add additional match-specific columns to the data
        box['homeId'] = home_id
        box['awayId'] = away_id
        box['opponent'] = np.where(box['squadId'] == home_id, away, home)
        box['round'] = data['matchStats']['matchInfo']['roundNumber']
        box['fixtureId'] = fixture_id  # Add the fixtureId to the match details
        box['sportId'] = sport_id      # Add the sportId to the match details
        box['matchId'] = match_id      # Add the matchId to the match details

        # Drop unnecessary columns
        box = box.drop(columns=['squadNickname', 'squadCode'], errors='ignore')

        # Inspect the match data before returning it
        print("Match data:")
        print(box.head())  # Display the first few rows of the match data for inspection

        logging.info(f"Successfully processed data for match {match_id} in league {league_id}.")
        return box
    else:
        logging.warning(f"Player stats not found or incomplete for match {match_id} in league {league_id}.")
        print(f"Player stats not found or incomplete for match {match_id} in league {league_id}. Skipping this match.")
        return pd.DataFrame()

def fetch_score_flow_data(league_id, match_id):
    """
    Fetches the score flow data for a given match in a specific league.
    
    Parameters:
    league_id (int): The ID of the league.
    match_id (int): The ID of the match.

    Returns:
    pd.DataFrame: The DataFrame containing the score flow data with a static primary key.
    """
    url = f'https://mc.championdata.com/data/{league_id}/{match_id}.json'
    response = requests.get(url)

    if response.status_code != 200:
        logging.error(f"Failed to retrieve score flow data for match {match_id} in league {league_id}: {response.status_code}")
        print(f"Failed to retrieve data: {response.status_code}")
        return None

    match_data = response.json()
    score_flow = match_data.get('matchStats', {}).get('scoreFlow', {}).get('score', [])

    if not score_flow:
        logging.warning(f"No score flow data found for match {match_id} in league {league_id}.")
        print(f"No score flow data found for match {match_id} in league {league_id}.")
        return None

    # Normalize the score flow data into a DataFrame
    df = pd.json_normalize(score_flow)
    
    # Add match_id and a static score_flow_id for the entire match
    df['matchId'] = match_id
    df['scoreFlowId'] = df['matchId'].astype(str) + "_1"  # The same score_flow_id for all rows

    return df
