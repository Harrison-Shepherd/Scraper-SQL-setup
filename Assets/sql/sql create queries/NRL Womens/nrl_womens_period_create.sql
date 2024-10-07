CREATE TABLE NRL_womens_period (
  
  -- Match and Squad Information
  matchId INT NOT NULL,  -- Reference to the match
  squadId INT NOT NULL,
  periodId VARCHAR(45) NOT NULL,  -- Using the matchId_period format

  -- Player Information
  playerId INT NOT NULL,
  jumperNumber INT DEFAULT NULL,
  position VARCHAR(45) DEFAULT NULL,


  -- Performance Statistics
  tries INT DEFAULT NULL,
  tryAssists INT DEFAULT NULL,
  trySaves INT DEFAULT NULL,
  conversions INT DEFAULT NULL,
  conversionsUnsuccessful INT DEFAULT NULL,
  conversionAttempts INT DEFAULT NULL,
  penaltyGoals INT DEFAULT NULL,
  penaltyGoalAttempts INT DEFAULT NULL,
  fieldGoals INT DEFAULT NULL,
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

  -- Unique Period Statistics
  ineffectiveTackles INT DEFAULT NULL,  -- Period-specific
  incompleteSets INT DEFAULT NULL,  -- Period-specific
  tacklesMissed INT DEFAULT NULL,  -- Period-specific
  scrumWins INT DEFAULT NULL,  -- Period-specific
  score INT DEFAULT NULL,  -- Period-specific

  -- Primary Key and Foreign Key
  PRIMARY KEY (periodId, playerId),  -- Composite primary key for uniqueness
  FOREIGN KEY (matchId) REFERENCES NRL_womens_match(matchId)  -- Foreign key linking to match table
);
