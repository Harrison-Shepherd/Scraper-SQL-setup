INSERT INTO fast5_womens_period (
  playerId,
  matchId,
  periodId,
  squadId,
  currentPositionCode,
  startingPositionCode,
  powerPlayPeriod,
  quartersPlayed,
  minutesPlayed,
  period,
  goals,
  goals1,
  goals2,
  goals3,
  goalAttempts,
  goalAttempts1,
  goalAttempts2,
  goalAttempts3,
  goalMisses,
  points,
  rebounds,
  defensiveRebounds,
  offensiveRebounds,
  deflections,
  deflectionWithGain,
  deflectionWithNoGain,
  deflectionPossessionGain,
  intercepts,
  interceptPassThrown,
  gain,
  gainToGoalPerc,
  pickups,
  blocked,
  blocks,
  turnovers,
  generalPlayTurnovers,
  missedGoalTurnover,
  unforcedTurnovers,
  turnoverHeld,
  possessionChanges,
  passes,
  feeds,
  feedWithAttempt,
  goalAssists,
  centrePassToGoalPerc,
  centrePassReceives,
  secondPhaseReceive,
  penalties,
  contactPenalties,
  obstructionPenalties,
  offsides,
  badPasses,
  badHands,
  breaks,
  tossUpWin
)
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
