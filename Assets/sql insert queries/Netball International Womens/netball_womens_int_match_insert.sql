INSERT INTO netball_womens_international_match (
  rebounds, penalties, gain, possessions, offensiveRebounds, goalMisses, blocked, passes, goalAssists, disposals, 
  tossUpWin, centrePassReceives, obstructionPenalties, feeds, playerId, goals, offsides, badPasses, defensiveRebounds, 
  breaks, blocks, badHands, missedGoalTurnover, squadId, startingPositionCode, goalAttempts, deflections, 
  contactPenalties, quartersPlayed, minutesPlayed, turnovers, pickups, currentPositionCode, intercepts, 
  shortDisplayName, firstname, surname, displayName, squadName, homeId, awayId, opponent, round, fixtureId, 
  sportId, matchId, turnoverHeld, centrePassToGoalPerc, deflectionWithNoGain, generalPlayTurnovers, interceptPassThrown, 
  points, deflectionWithGain, secondPhaseReceive, deflectionPossessionGain, possessionChanges, feedWithAttempt, 
  unforcedTurnovers, gainToGoalPerc
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
