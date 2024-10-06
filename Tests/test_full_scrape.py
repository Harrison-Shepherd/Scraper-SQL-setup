# test_full_scrape.py
import unittest
from unittest.mock import patch, MagicMock
import pandas as pd
from Core.Full_scrape import scrape_entire_database

class TestFullScrape(unittest.TestCase):

    @patch('Core.Full_scrape.li.fetch_leagues')
    @patch('Core.Full_scrape.ft.fetch_fixture')
    @patch('Core.Full_scrape.mt.fetch_data')
    @patch('Core.Full_scrape.save_period_stats_to_csv')
    @patch('Core.Full_scrape.sf.save_score_flow_to_csv')
    @patch('Core.Full_scrape.cs.save_squad_info_to_csv')
    def test_scrape_entire_database(
        self, mock_save_squad_info, mock_save_score_flow, mock_save_period_stats, 
        mock_fetch_data, mock_fetch_fixture, mock_fetch_leagues
    ):
        # Mock league data
        mock_league_data = [
            {'id': 1, 'league_season': 'Test League (2023)', 'regulationPeriods': 4, 'name': 'Test League', 'season': 2023}
        ]
        mock_leagues_df = pd.DataFrame(mock_league_data)
        mock_fetch_leagues.return_value = (mock_leagues_df, mock_leagues_df[['id', 'league_season', 'season']])

        # Mock fixture data with required columns
        mock_fixture_data = [
            {
                'matchId': 101, 
                'homeSquadId': 1, 
                'awaySquadId': 2, 
                'matchStatus': 'completed', 
                'homeSquadName': 'Team A', 
                'awaySquadName': 'Team B'
            }
        ]
        mock_fixture_df = pd.DataFrame(mock_fixture_data)
        mock_fetch_fixture.return_value = mock_fixture_df

        # Mock match data
        mock_match_data = pd.DataFrame({'field1': [], 'field2': []})
        mock_fetch_data.return_value = mock_match_data

        # Call the function
        scrape_entire_database()

        # Assert that the key methods were called
        mock_fetch_leagues.assert_called_once()
        mock_fetch_fixture.assert_called()
        mock_fetch_data.assert_called()
        mock_save_squad_info.assert_called()
        mock_save_score_flow.assert_called()
        mock_save_period_stats.assert_called()

if __name__ == '__main__':
    unittest.main()
