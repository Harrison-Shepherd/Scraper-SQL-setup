INSERT INTO netball_womens_international_fixture (
  fixtureId,
  matchId,
  matchNumber,
  matchType,
  matchStatus,
  sportId,
  periodSecs,
  period,
  periodCompleted,
  localStartTime,
  utcStartTime,
  homeSquadId,
  homeSquadName,
  homeSquadShortCode,
  homeSquadNickname,
  homeSquadScore,
  homeSquadCode,
  awaySquadId,
  awaySquadName,
  awaySquadNickname,
  awaySquadScore,
  awaySquadCode,
  awaySquadShortCode,
  venueId,
  venueCode,
  venueName,
  roundNumber,
  finalCode,
  finalShortCode
)
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
);
