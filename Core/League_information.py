import re
import os
import pandas as pd
import requests
from Utils.sanitize_filename import sanitize_filename  

# Global dictionary to store league information
league_info = {}

def fetch_leagues():
    """
    Fetches league data from a remote source, processes it, and saves it to a CSV file.

    Returns:
    tuple: A tuple containing the full DataFrame of leagues and a DataFrame with unique league seasons.
    """
    global league_info
    url = 'http://mc.championdata.com/data/competitions.json'
    response = requests.get(url)

    # Check if the request was successful
    if response.status_code == 200:
        leagues = response.json()
    else:
        print(f"Failed to retrieve data: {response.status_code}")
        return pd.DataFrame(), pd.DataFrame()
    
    # Normalize the JSON data to a DataFrame
    leagues_df = pd.json_normalize(leagues['competitionDetails']['competition'])
    
    # Clean the league names and seasons, use the sanitize_filename function from Utils
    leagues_df['cleaned_name'] = leagues_df['name'].apply(lambda x: sanitize_filename(re.sub(r'\b\d{4}\b', '', x).strip()))
    leagues_df['league_season'] = leagues_df['cleaned_name'] + ' (' + leagues_df['season'].astype(str) + ')'
    
    # Update the global league_info dictionary
    league_info = leagues_df.set_index('id')['league_season'].to_dict()

    # Save leagues information in the Data folder
    folder_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), "Data", "Leagues")
    os.makedirs(folder_path, exist_ok=True)

    # Define the path where the CSV will be saved
    output_csv_path = os.path.join(folder_path, 'leagues_information.csv')
    leagues_df.to_csv(output_csv_path, index=False)
    print(f"League information saved to {output_csv_path}")

    return leagues_df, leagues_df[['id', 'league_season', 'season']].drop_duplicates()

def get_league_name_and_season(league_id):
    """
    Retrieves the league name and season based on the league ID.

    Parameters:
    league_id (int): The ID of the league.

    Returns:
    str: The league name and season, or 'Unknown League' if not found.
    """
    return league_info.get(league_id, 'Unknown League')
