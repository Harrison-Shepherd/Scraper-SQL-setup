INSERT INTO afl_mens_match (
  marksInside50, handballs, clangers, hitoutsToAdvantage, penalty50sAgainst, disposals, goalAssists, 
  kickEfficiency, kicksEffective, marksUncontested, tackles, freesFor, behinds, playerId, goals, inside50s, disposalEfficiency, 
  blocks, squadId, marks, hitouts, kicks, marksContested, possessionsContested, freesAgainst, clearances, kicksIneffective, 
  possessionsUncontested, shortDisplayName, jumperNumber, positionName, firstName, positionId, surname, displayName, 
  positionCode, squadName, homeId, awayId, opponent, round, fixtureId, sportId, matchId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
