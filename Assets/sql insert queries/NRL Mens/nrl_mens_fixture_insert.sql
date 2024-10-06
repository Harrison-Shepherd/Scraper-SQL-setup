INSERT INTO nrl_mens_fixture (
  fixtureId, matchId, matchStatus, roundNumber, matchNumber, homeSquadId, homeSquadName, homeSquadCode, homeSquadShortCode, 
  homeSquadNickname, awaySquadId, awaySquadName, awaySquadCode, awaySquadShortCode, awaySquadNickname, matchType, 
  finalShortCode, finalCode, venueId, venueName, venueCode, localStartTime, utcStartTime, homeSquadScore, awaySquadScore, 
  period, periodCode, periodSecs, sportId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
