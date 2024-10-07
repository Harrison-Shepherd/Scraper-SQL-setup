CREATE TABLE afl_womens_match (
  
  -- Match Statistics
  marksInside50 INT DEFAULT NULL,
  handballs INT DEFAULT NULL,
  positionCode VARCHAR(50) DEFAULT NULL,
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

  -- Player Information
  firstname VARCHAR(50) DEFAULT NULL,  
  recruitedFrom VARCHAR(50) DEFAULT NULL,
  mainPlayingPosition VARCHAR(50) DEFAULT NULL,
  displayName VARCHAR(50) DEFAULT NULL,
  shortDisplayName VARCHAR(50) DEFAULT NULL,
  positionName VARCHAR(50) DEFAULT NULL,
  debut YEAR DEFAULT NULL,
  positionId INT DEFAULT NULL,
  surname VARCHAR(50) DEFAULT NULL,
  dob DATE DEFAULT NULL,
  height INT DEFAULT NULL,

  -- Team Information
  squadShortName VARCHAR(5) DEFAULT NULL,
  squadName VARCHAR(50) DEFAULT NULL,
  homeId INT NOT NULL,  
  awayId INT NOT NULL,  
  opponent VARCHAR(50) DEFAULT NULL,
  
  -- Match Information
  round INT DEFAULT NULL,
  fixtureId INT NOT NULL,
  sportId INT NOT NULL,
  matchId INT NOT NULL,

  -- Keys
  PRIMARY KEY (matchId, playerId),
  FOREIGN KEY (fixtureId, matchId) REFERENCES afl_womens_fixture(fixtureId, matchId)  -- Composite foreign key
);
