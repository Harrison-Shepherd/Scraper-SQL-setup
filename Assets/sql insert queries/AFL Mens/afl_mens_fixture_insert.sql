INSERT INTO afl_mens_fixture (
  periodSecs, awaySquadName, matchType, homeSquadId, homeSquadShortCode, homeSquadNickname, matchStatus, 
  roundNumber, homeSquadName, awaySquadNickname, venueId, awaySquadId, venueCode, localStartTime, matchId, homeSquadScore, 
  period, finalCode, periodCompleted, finalShortCode, awaySquadScore, venueName, utcStartTime, awaySquadCode, 
  homeSquadCode, awaySquadShortCode, matchNumber, sportId, fixtureId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
