INSERT INTO leagues_information (
  leagueId, name, regulationPeriodLength, regulationPeriods, rounds, season, extraTimePeriodLength, cleaned_name, league_season
) 
VALUES (
  %s, %s, %s, %s, %s, %s, %s, %s, %s
);
