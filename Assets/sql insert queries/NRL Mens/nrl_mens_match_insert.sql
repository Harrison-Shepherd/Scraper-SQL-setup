INSERT INTO nrl_mens_match (
  matchId, tries, runsDummyHalfMetres, sinBins, onReports, runsHitupMetres, tryAssists, penaltyGoalAttempts, points, 
  conversionsUnsuccessful, possessions, tackleds, kickMetres, kicksGeneralPlay, tackles, tacklesIneffective, handlingErrors, 
  sentOffs, runsDummyHalf, squadId, offloads, bombKicksCaught, runsKickReturn, runsHitup, fieldGoalAttempts, 
  conversionAttempts, penaltiesConceded, postContactMetres, position, errors, goalLineDropouts, fortyTwenty, conversions, 
  tryDebits, missedTackles, penaltyGoalsUnsuccessful, kicksCaught, metresGained, lineBreaks, tackleBreaks, trySaves, 
  passes, runMetres, fieldGoalsUnsuccessful, lineBreakAssists, runsNormalMetres, runsNormal, runsKickReturnMetres, 
  playerId, jumperNumber, fieldGoals, penaltyGoals, runs, shortDisplayName, firstname, surname, displayName, squadName, 
  homeId, awayId, opponent, round, fixtureId, sportId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
