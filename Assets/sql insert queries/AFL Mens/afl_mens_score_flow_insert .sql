INSERT INTO afl_mens_score_flow (
  period, distanceCode, scorePoints, periodSeconds, positionCode, squadId, playerId, scoreName, matchId, scoreFlowId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
