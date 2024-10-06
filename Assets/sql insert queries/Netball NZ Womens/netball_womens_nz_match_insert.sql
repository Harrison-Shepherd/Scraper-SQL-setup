INSERT INTO netball_womens_nz_match (
  rebounds, turnoverHeld, centrePassToGoalPerc, penalties, deflectionWithNoGain, generalPlayTurnovers, 
  interceptPassThrown, gain, points, goalMisses, blocked, deflectionWithGain, goalAssists, tossUpWin, 
  centrePassReceives, obstructionPenalties, feeds, playerId, goals, offsides, secondPhaseReceive, badPasses, 
  breaks, blocks, badHands, missedGoalTurnover, squadId, deflectionPossessionGain, possessionChanges, 
  startingPositionCode, goalAttempts, contactPenalties, quartersPlayed, minutesPlayed, feedWithAttempt, 
  unforcedTurnovers, pickups, currentPositionCode, gainToGoalPerc, intercepts, shortDisplayName, firstname, 
  surname, displayName, squadName, homeId, awayId, opponent, round, fixtureId, sportId, matchId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
