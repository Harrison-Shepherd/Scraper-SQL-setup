INSERT INTO NRL_mens_score_flow (
  period,
  periodSeconds,
  scorepoints,
  scoreName,
  squadId,
  playerId,
  matchId,
  scoreFlowId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s
);
