CREATE TABLE NRL_womens_match (
  
  -- Match and Squad Information
  matchId INT NOT NULL,
  squadId INT NOT NULL,
  fixtureId INT NOT NULL,
  homeId INT NOT NULL,
  awayId INT NOT NULL,
  sportId INT NOT NULL,

  -- Player Information
  playerId INT NOT NULL,
  jumperNumber INT DEFAULT NULL,
  shortDisplayName VARCHAR(45) DEFAULT NULL,
  firstname VARCHAR(45) DEFAULT NULL,
  surname VARCHAR(45) DEFAULT NULL,
  displayName VARCHAR(45) DEFAULT NULL,
  squadName VARCHAR(45) DEFAULT NULL,
  position VARCHAR(45) DEFAULT NULL,
  opponent VARCHAR(45) DEFAULT NULL,
  round INT DEFAULT NULL,

  -- Performance Statistics
  tries INT DEFAULT NULL,
  tryAssists INT DEFAULT NULL,
  tryDebits INT DEFAULT NULL,
  trySaves INT DEFAULT NULL,
  points INT DEFAULT NULL,
  conversions INT DEFAULT NULL,
  conversionsUnsuccessful INT DEFAULT NULL,
  conversionAttempts INT DEFAULT NULL,
  penaltyGoals INT DEFAULT NULL,
  penaltyGoalsUnsuccessful INT DEFAULT NULL,
  penaltyGoalAttempts INT DEFAULT NULL,
  fieldGoals INT DEFAULT NULL,
  fieldGoalsUnsuccessful INT DEFAULT NULL,
  fieldGoalAttempts INT DEFAULT NULL,
  
  -- Runs and Metres Gained
  runs INT DEFAULT NULL,
  runMetres INT DEFAULT NULL,
  metresGained INT DEFAULT NULL,
  runsNormal INT DEFAULT NULL,
  runsNormalMetres INT DEFAULT NULL,
  runsKickReturn INT DEFAULT NULL,
  runsKickReturnMetres INT DEFAULT NULL,
  runsHitup INT DEFAULT NULL,
  runsHitupMetres INT DEFAULT NULL,
  runsDummyHalf INT DEFAULT NULL,
  runsDummyHalfMetres INT DEFAULT NULL,
  postContactMetres INT DEFAULT NULL,
  
  -- Tackles and Defensive Actions
  tackles INT DEFAULT NULL,
  tackleds INT DEFAULT NULL,
  tackleBreaks INT DEFAULT NULL,
  tacklesIneffective INT DEFAULT NULL,
  missedTackles INT DEFAULT NULL,
  lineBreaks INT DEFAULT NULL,
  lineBreakAssists INT DEFAULT NULL,
  offloads INT DEFAULT NULL,
  
  -- Kicking
  kickMetres INT DEFAULT NULL,
  kicksGeneralPlay INT DEFAULT NULL,
  kicksCaught INT DEFAULT NULL,
  bombKicksCaught INT DEFAULT NULL,
  fortyTwenty INT DEFAULT NULL,
  
  -- Errors and Penalties
  handlingErrors INT DEFAULT NULL,
  penaltiesConceded INT DEFAULT NULL,
  errors INT DEFAULT NULL,

  -- Miscellaneous
  passes INT DEFAULT NULL,
  goalLineDropouts INT DEFAULT NULL,
  sentOffs INT DEFAULT NULL,
  sinBins INT DEFAULT NULL,
  onReports INT DEFAULT NULL,

  -- Primary Key and Foreign Key
  PRIMARY KEY (matchId, playerId),
  FOREIGN KEY (fixtureId, matchId) REFERENCES NRL_womens_fixture(fixtureId, matchId)  -- Composite foreign key
);
