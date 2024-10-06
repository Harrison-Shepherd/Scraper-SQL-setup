INSERT INTO netball_womens_aus_score_flow (
  period, distanceCode, scorepoints, periodSeconds, positionCode, squadId, playerId, scoreName, matchId, scoreFlowId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
