INSERT INTO afl_mens_period (
  marksInside50, handballs, clangers, hitoutsToAdvantage, penalty50sAgainst, disposals, 
  goalAssists, kickEffeciency, kicksEffective, marksUncontested, tackles, freesFor, behinds, playerId, 
  goals, inside50s, disposalEffeciency, period, blocks, squadId, marks, hitouts, kicks, marksContested, 
  possessionsContested, freesAgainst, clearances, kicksIneffective, possessionsUncontested, matchId, periodId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
