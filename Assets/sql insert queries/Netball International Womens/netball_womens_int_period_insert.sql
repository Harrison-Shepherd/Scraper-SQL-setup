INSERT INTO netball_womens_international_period (
  rebounds,
  turnoverHeld,
  centrePassToGoalPerc,
  penalties,
  deflectionWithNoGain,
  generalPlayTurnovers,
  interceptPassThrown,
  gain,
  points,
  goalMisses,
  blocked,
  deflectionWithGain,
  deflections,
  deflectionPossessionGain,
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
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
