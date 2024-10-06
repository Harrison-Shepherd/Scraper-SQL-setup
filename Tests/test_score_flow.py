# test_score_flow.py
import unittest
from unittest.mock import patch, MagicMock
from Core.ScoreFlow import save_score_flow_to_csv


class TestScoreFlow(unittest.TestCase):

    @patch('Core.ScoreFlow.requests.get')
    @patch('Core.ScoreFlow.os.path.exists')
    def test_save_score_flow_to_csv(self, mock_exists, mock_get):
        # Mocking a successful response
        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_response.json.return_value = {
            'scoreFlow': {
                'flowData': []
            }
        }
        mock_get.return_value = mock_response
        mock_exists.return_value = False

        # Run function
        save_score_flow_to_csv(1, 101, 'test_dir')

        # Check if file saving methods were called
        mock_get.assert_called_once()

    @patch('Core.ScoreFlow.requests.get')
    def test_save_score_flow_to_csv_failure(self, mock_get):
        # Mock a failed response
        mock_response = MagicMock()
        mock_response.status_code = 404
        mock_get.return_value = mock_response

        # Call the function and ensure it handles the failure gracefully
        save_score_flow_to_csv(1, 101, 'test_dir')
        mock_get.assert_called_once()

if __name__ == '__main__':
    unittest.main()
