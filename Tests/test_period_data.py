# test_period_data.py
import unittest
from unittest.mock import patch, MagicMock
from Core.Period_data import save_period_stats_to_csv
import os

class TestPeriodData(unittest.TestCase):

    @patch('Core.Period_data.requests.get')
    @patch('Core.Period_data.os.path.exists')
    @patch('Core.Period_data.pd.json_normalize')
    def test_save_period_stats_to_csv(self, mock_normalize, mock_exists, mock_get):
        # Mocking a successful response
        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_response.json.return_value = {
            'matchStats': {
                'playerPeriodStats': {
                    'player': [{'period': 1}, {'period': 2}]
                }
            }
        }
        mock_get.return_value = mock_response
        mock_exists.return_value = False
        mock_normalize.return_value = MagicMock()

        # Run function
        save_period_stats_to_csv(1, 101, 'test_dir', 'Test_League')

        # Check if file saving methods were called
        mock_get.assert_called_once()
        mock_normalize.assert_called_once()

    @patch('Core.Period_data.requests.get')
    def test_save_period_stats_to_csv_failure(self, mock_get):
        # Mock a failed response
        mock_response = MagicMock()
        mock_response.status_code = 404
        mock_get.return_value = mock_response

        # Call the function and ensure it handles the failure gracefully
        save_period_stats_to_csv(1, 101, 'test_dir', 'Test_League')
        mock_get.assert_called_once()

if __name__ == '__main__':
    unittest.main()
