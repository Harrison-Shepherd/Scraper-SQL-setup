INSERT INTO netball_womens_aus_match (
  rebounds, turnoverHeld, netPoints, centrePassToGoalPerc, penalties, deflectionWithNoGain, generalPlayTurnovers, 
  interceptPassThrown, gain, points, goalMisses, blocked, deflectionWithGain, goalAssists, tossUpWin, centrePassReceives, 
  obstructionPenalties, feeds, playerId, goals, offsides, secondPhaseReceive, badPasses, breaks, blocks, badHands, 
  missedGoalTurnover, squadId, deflectionPossessionGain, possessionChanges, startingPositionCode, goalAttempts, 
  contactPenalties, quartersPlayed, minutesPlayed, feedWithAttempt, unforcedTurnovers, pickups, currentPositionCode, 
  gainToGoalPerc, intercepts, shortDisplayName, firstname, surname, displayName, squadName, homeId, awayId, opponent, 
  round, fixtureId, sportId, matchId, goal_from_zone2, goal_from_zone1, attempt_from_zone2, attempt_from_zone1, 
  goal2, goal1, attempt2, attempt1, deflections
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
