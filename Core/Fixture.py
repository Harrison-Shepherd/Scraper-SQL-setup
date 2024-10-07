import requests
import os
import pandas as pd
import League_information as li
from Utils.sport_category import determine_sport_category
import Utils.csv_save as cs
from Utils.sanitize_filename import sanitize_filename  

def fetch_fixture(league_id, save_directory, fixture_id, regulation_periods):
    """
    Fetches fixture data for a given league and processes the matches.
    """
    print(f"Fetching fixture data for league {league_id}.")
    
    # Get the raw league name and season first
    league_name_and_season = li.get_league_name_and_season(league_id)

    url = f'http://mc.championdata.com/data/{league_id}/fixture.json?/'
    response = requests.get(url)
    
    if response.status_code != 200:
        print(f"Failed to retrieve fixture data for league {league_id}: {response.status_code}")
        return pd.DataFrame()

    data = response.json()
    
    if 'fixture' in data and 'match' in data['fixture']:
        matches = data['fixture']['match']
        if not isinstance(matches, list):
            matches = [matches]
        
        if matches:
            matches_df = pd.DataFrame(matches)
            matches_df = matches_df[~matches_df['matchStatus'].isin(['incomplete', 'scheduled'])]

            # Determine sport category based on the raw league name
            sport_category = determine_sport_category(
                regulation_periods, 
                matches_df['homeSquadId'].tolist(), 
                league_name_and_season,  # Pass the raw league name here for filtering
                league_id
            )
            
            # Now sanitize the league name for file/folder purposes
            sanitized_league_name = sanitize_filename(league_name_and_season)
            
            sport_id_map = {
                'AFL Mens': 1, 'AFL Womens': 2, 'NRL Mens': 3, 'NRL Womens': 4,
                'FAST5 Mens': 5, 'FAST5 Womens': 6, 'International & NZ Netball Mens': 7,
                'International & NZ Netball Womens': 8, 'Australian Netball Mens': 9,
                'Australian Netball Womens': 10
            }
            sport_id = sport_id_map.get(sport_category, None)
            matches_df['sportId'] = sport_id
            matches_df['fixtureId'] = fixture_id

            # Save fixture data if save directory is provided
            if save_directory:
                cs.ensure_directory_exists(save_directory)
                fixture_csv_path = os.path.join(save_directory, f'{sanitized_league_name} Fixture.csv')
                cs.save_dataframe_to_csv(matches_df, fixture_csv_path)
                print(f"Filtered fixture data saved to {fixture_csv_path}")
            
            return matches_df
        else:
            print(f"No match data found for league {league_id}.")
            return pd.DataFrame()
    else:
        print(f"Fixture data for league {league_id} is not in the expected format.")
        return pd.DataFrame()
