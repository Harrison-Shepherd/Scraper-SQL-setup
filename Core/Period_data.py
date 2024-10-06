# Core/Period_data.py
import requests
import logging
from Utils.logger import setup_logging
import pandas as pd
from Utils.sanitize_filename import sanitize_filename  # Import sanitize_filename
import Utils.csv_save as cs  # Import centralized CSV save functionality

# Ensure the logging is set up to track period data specifically
setup_logging('period_data.log')

def fetch_period_stats(league_id, match_id):
    """
    Fetch and return period stats data for a given match.

    Parameters:
    league_id (int): The ID of the league.
    match_id (int): The ID of the match.

    Returns:
    pd.DataFrame: DataFrame containing the period stats, or None if not found.
    """
    logging.info(f"Fetching period stats for match {match_id} in league {league_id}")

    url = f'https://mc.championdata.com/data/{league_id}/{match_id}.json'
    response = requests.get(url)

    if response.status_code != 200:
        logging.error(f"Failed to retrieve data for match {match_id} in league {league_id}: {response.status_code}")
        return None

    json_data = response.json()

    if ('matchStats' in json_data and
        'playerPeriodStats' in json_data['matchStats'] and
        'player' in json_data['matchStats']['playerPeriodStats']):

        player_period_stats = json_data['matchStats']['playerPeriodStats']['player']
        df = pd.json_normalize(player_period_stats)
        return df

    logging.error(f"Player period stats not found or incomplete for match {match_id} in league {league_id}.")
    return None
