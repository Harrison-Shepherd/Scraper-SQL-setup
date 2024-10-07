CREATE TABLE netball_womens_international_score_flow (
  
  -- Period and Timing Information
  period INT DEFAULT NULL,
  periodSeconds INT DEFAULT NULL,

  -- Scoring Information
  distanceCode INT DEFAULT NULL,
  scorepoints INT DEFAULT NULL,
  scoreName VARCHAR(45) DEFAULT NULL,

  -- Player and Position Information
  positionCode VARCHAR(45) DEFAULT NULL,
  squadId INT NOT NULL,
  playerId INT NOT NULL,

  -- Match Information
  matchId INT NOT NULL,

  -- Unique Identifier
  scoreFlowId VARCHAR(45) NOT NULL,  -- Updated to VARCHAR to handle the matchId + index format

  -- Primary Key and Foreign Key
  PRIMARY KEY (scoreFlowId),  -- Use scoreFlowId as the primary key
  FOREIGN KEY (matchId) REFERENCES netball_womens_international_match(matchId)  -- Foreign key linking to match table
);
