INSERT INTO netball_womens_international_period (
  rebounds, turnoverHeld, centrePassToGoalPerc, penalties, deflectionWithNoGain, generalPlayTurnovers, interceptPassThrown, 
  gain, points, goalMisses, blocked, deflectionWithGain, goalAssists, tossUpWin, centrePassReceives, obstructionPenalties, 
  feeds, playerId, goals, offsides, secondPhaseReceive, badPasses, period, breaks, blocks, badHands, missedGoalTurnover, 
  squadId, startingPositionCode, possessionChanges, goalAttempts, contactPenalties, quartersPlayed, minutesPlayed, 
  feedWithAttempt, unforcedTurnovers, pickups, currentPositionCode, gainToGoalPerc, intercepts, matchId, periodId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
