# # Core/ScoreFlow.py

# import requests
# import logging
# import pandas as pd
# import Core.League_information as li
# from Utils.logger import setup_logging
# import Utils.csv_save as cs  # Use the centralized CSV-saving module

# # Set up logging for score flow processing
# setup_logging('score_flow_log.log')  # Specify the log filename, saved in the Logs directory

# def fetch_score_flow_data(league_id, match_id):
#     """
#     Fetches the score flow data for a given match in a specific league.

#     Parameters:
#     league_id (int): The ID of the league.
#     match_id (int): The ID of the match.

#     Returns:
#     pd.DataFrame: DataFrame containing the score flow data, or None if not found.
#     """
#     # Get the league name and season based on the league ID
#     league_name_and_season = li.get_league_name_and_season(league_id)
#     logging.info(f"Fetching score flow data for match {match_id} in league {league_id}")

#     # Construct the URL for fetching match data
#     url = f'https://mc.championdata.com/data/{league_id}/{match_id}.json'
#     response = requests.get(url)

#     # Check if the request was successful
#     if response.status_code != 200:
#         logging.error(f"Failed to retrieve score flow data for match {match_id} in league {league_id}: {response.status_code}")
#         print(f"Failed to retrieve data: {response.status_code}")
#         return None

#     # Extract the relevant part of the JSON for score flow
#     match_data = response.json()
#     score_flow = match_data.get('matchStats', {}).get('scoreFlow', {}).get('score', [])

#     # Log and return if no score flow data is found
#     if not score_flow:
#         logging.warning(f"No score flow data found for match {match_id} in league {league_id}.")
#         print(f"No score flow data found for match {match_id} in league {league_id}.")
#         return None

#     # Normalize the score flow data into a DataFrame
#     df = pd.json_normalize(score_flow)

#     # Validate the extracted DataFrame to ensure it contains expected columns for score flow
#     expected_columns = {'period', 'distanceCode', 'scorepoints', 'periodSeconds', 'positionCode', 'squadId', 'playerId', 'scoreName'}
#     if not expected_columns.issubset(df.columns):
#         logging.error(f"Unexpected data structure for score flow in match {match_id}.")
#         print("Unexpected data structure detected, aborting save.")
#         return None

#     # Add match_id column for context
#     df['match_id'] = match_id

#     # Log the first few rows of the DataFrame for verification
#     logging.info(f"Score flow data extracted: {df.head()}")

#     return df

# def save_score_flow_to_csv(league_id, match_id, additional_data_dir):
#     """
#     Fetches and saves the score flow data to a CSV file.
#     """
#     # Fetch the score flow data
#     df = fetch_score_flow_data(league_id, match_id)
#     if df is not None:
#         # Save the data using the centralized CSV save function
#         league_name_and_season = li.get_league_name_and_season(league_id)
#         cs.save_score_flow_to_csv(df, league_name_and_season, match_id, additional_data_dir)
#     else:
#         print(f"Could not fetch score flow data for match {match_id} in league {league_id}.")
