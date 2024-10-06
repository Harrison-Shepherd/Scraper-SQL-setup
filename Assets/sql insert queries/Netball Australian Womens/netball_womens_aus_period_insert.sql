INSERT INTO netball_womens_aus_period (
  rebounds, turnoverHeld, netPoints, centrePassToGoalPerc, penalties, deflectionWithNoGain, generalPlayTurnovers, 
  interceptPassThrown, gain, points, goalMisses, blocked, deflectionWithGain, goalAssists, tossUpWin, centrePassReceives, 
  obstructionPenalties, feeds, playerId, goals, offsides, secondPhaseReceive, badPasses, period, breaks, blocks, 
  badHands, missedGoalTurnover, squadId, startingPositionCode, possessionChanges, goalAttempts, contactPenalties, 
  quartersPlayed, minutesPlayed, feedWithAttempt, unforcedTurnovers, pickups, currentPositionCode, gainToGoalPerc, 
  intercepts, matchId, periodId, goal_from_zone2, goal_from_zone1, attempt_from_zone2, attempt_from_zone1, goal2, goal1, 
  deflections, attempts2, attempts1
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
