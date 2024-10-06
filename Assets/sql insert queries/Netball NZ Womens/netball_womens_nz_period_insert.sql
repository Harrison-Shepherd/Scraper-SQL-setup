INSERT INTO netball_womens_nz_period (
  rebounds,
  turnoverHeld,
  centrePassToGoalPerc,
  penalties,
  deflectionWithNoGain,
  generalPlayTurnovers,
  interceptPassThrown,
  gain,
  points,
  netPoints,
  goalMisses,
  blocked,
  deflectionWithGain,
  deflections,
  defensiveRebounds,
  offensiveRebounds,
  goalAssists,
  tossUpWin,
  centrePassReceives,
  obstructionPenalties,
  feeds,
  passes,
  playerId,
  squadId,
  startingPositionCode,
  currentPositionCode,
  goals,
  offsides,
  secondPhaseReceive,
  badPasses,
  period,
  breaks,
  blocks,
  badHands,
  missedGoalTurnover,
  turnovers,
  possessionChanges,
  deflectionPossessionGain,
  goalAttempts,
  contactPenalties,
  quartersPlayed,
  minutesPlayed,
  feedWithAttempt,
  unforcedTurnovers,
  pickups,
  gainToGoalPerc,
  intercepts,
  matchId,
  periodId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
