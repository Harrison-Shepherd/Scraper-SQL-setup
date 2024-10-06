INSERT INTO netball_womens_international_score_flow (
  period, distanceCode, scorepoints, periodSeconds, positionCode, squadId, playerId, scoreName, matchId, scoreFlowId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
