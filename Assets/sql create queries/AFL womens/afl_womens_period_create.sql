CREATE TABLE afl_womens_period (
  
  -- Match Statistics
  marksInside50 INT DEFAULT NULL,
  handballs INT DEFAULT NULL,
  positionCode VARCHAR(3) DEFAULT NULL,
  clangers INT DEFAULT NULL,
  hitoutsToAdvantage INT DEFAULT NULL,
  penalty50sAgainst INT DEFAULT NULL,
  disposals INT DEFAULT NULL,
  goalAssists INT DEFAULT NULL,
  kickEfficiency INT DEFAULT NULL,
  kicksEffective INT DEFAULT NULL,
  marksUncontested INT DEFAULT NULL,
  tackles INT DEFAULT NULL,
  freesFor INT DEFAULT NULL,
  behinds INT DEFAULT NULL,
  playerId INT NOT NULL,
  goals INT DEFAULT NULL,
  inside50s INT DEFAULT NULL,
  jumperNumber INT DEFAULT NULL,
  disposalEfficiency INT DEFAULT NULL,
  period INT DEFAULT NULL,
  blocks INT DEFAULT NULL,
  squadId INT NOT NULL,
  marks INT DEFAULT NULL,
  hitouts INT DEFAULT NULL,
  kicks INT DEFAULT NULL,
  marksContested INT DEFAULT NULL,
  possessionsContested INT DEFAULT NULL,
  freesAgainst INT DEFAULT NULL,
  clearances INT DEFAULT NULL,
  kicksIneffective INT DEFAULT NULL,
  possessionsUncontested INT DEFAULT NULL,



  -- Match Information
  matchId INT NOT NULL,  -- Reference to the match
  periodId VARCHAR(50) NOT NULL,

  -- Keys
  PRIMARY KEY (periodId, playerId),  -- Composite primary key for uniqueness
  FOREIGN KEY (matchId) REFERENCES afl_womens_match(matchId)  -- Foreign key linking to match table
);
