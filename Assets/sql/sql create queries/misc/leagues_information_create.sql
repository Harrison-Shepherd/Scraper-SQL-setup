CREATE TABLE `leaguesinformation` (
  `leagueId` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `regulationPeriodLength` INT NOT NULL,
  `regulationPeriods` INT NOT NULL,
  `rounds` INT NOT NULL,
  `season` INT NOT NULL,
  `extraTimePeriodLength` VARCHAR(5) NULL,
  `cleaned_name`  VARCHAR(100) NOT NULL,
  `league_season` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`leagueId`),
  UNIQUE (`leagueId`, `name`, `cleaned_name`, `league_season`)
);
