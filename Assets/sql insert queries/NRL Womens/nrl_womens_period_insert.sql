INSERT INTO nrl_womens_period (
  tries, runsDummyHalfMetres, sinBins, onReports, runsHitupMetres, tryAssists, ineffectiveTackles, penaltyGoalAttempts, 
  points, conversionsUnsuccessful, score, possessions, tackleds, kickMetres, kicksGeneralPlay, tackles, incompleteSets, 
  tacklesIneffective, period, handlingErrors, sentOffs, runsDummyHalf, squadId, offloads, bombKicksCaught, runsKickReturn, 
  runsHitup, fieldGoalAttempts, conversionAttempts, penaltiesConceded, tacklesMissed, postContactMetres, position, errors, 
  goalLineDropouts, fortyTwenty, conversions, missedTackles, kicksCaught, metresGained, lineBreaks, tackleBreaks, trySaves, 
  passes, runMetres, lineBreakAssists, runsNormalMetres, scrumWins, runsNormal, runsKickReturnMetres, playerId, jumperNumber, 
  fieldGoals, penaltyGoals, runs, matchId, periodId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
