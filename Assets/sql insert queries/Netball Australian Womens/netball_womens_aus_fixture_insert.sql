INSERT INTO netball_womens_aus_fixture (
  fixtureId, periodSecs, awaySquadName, matchType, homeSquadId, homeSquadShortCode, homeSquadNickname, 
  matchStatus, roundNumber, homeSquadName, awaySquadNickname, venueId, awaySquadId, venueCode, localStartTime, 
  matchId, homeSquadScore, period, finalCode, isNetball2pt, periodCompleted, finalShortCode, awaySquadScore, 
  venueName, utcStartTime, awaySquadCode, homeSquadCode, awaySquadShortCode, matchNumber, sportId
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
