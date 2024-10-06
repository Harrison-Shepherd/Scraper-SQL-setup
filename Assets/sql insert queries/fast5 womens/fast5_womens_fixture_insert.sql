INSERT INTO fast5_womens_fixture (
  homeSquadScore, awaySquadName, matchType, finalCode, homeSquadId, homeSquadShortCode, 
  finalShortCode, awaySquadScore, homeSquadNickname, venueName, matchStatus, roundNumber, homeSquadName, utcStartTime, 
  awaySquadCode, awaySquadNickname, venueId, homeSquadCode, awaySquadId, venueCode, awaySquadShortCode, 
  localStartTime, matchId, matchNumber, sportId, fixtureId, periodSecs, period, periodCompleted
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
