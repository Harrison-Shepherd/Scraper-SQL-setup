INSERT INTO nrl_womens_score_flow (
  scoreFlowId, period, scorepoints, periodSeconds, squadId, playerId, scoreName, matchId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s
);
