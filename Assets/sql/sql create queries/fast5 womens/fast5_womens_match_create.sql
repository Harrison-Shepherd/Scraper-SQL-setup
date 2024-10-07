CREATE TABLE fast5_womens_match (
  -- Player Information
  playerId INT NOT NULL,
  matchId INT NOT NULL,
  squadId INT NOT NULL,
  firstname VARCHAR(50) DEFAULT NULL,  
  surname VARCHAR(50) DEFAULT NULL,
  displayName VARCHAR(50) DEFAULT NULL,
  shortDisplayName VARCHAR(50) DEFAULT NULL,
  currentPositionCode VARCHAR(5) DEFAULT NULL,
  startingPositionCode VARCHAR(5) DEFAULT NULL,
  
  -- Team Information
  squadName VARCHAR(50) DEFAULT NULL,
  homeId INT DEFAULT NULL,
  awayId INT DEFAULT NULL,
  opponent VARCHAR(50) DEFAULT NULL,
  
  -- Match Information
  round INT DEFAULT NULL,
  fixtureId INT DEFAULT NULL,
  sportId INT DEFAULT NULL,
  powerPlayPeriod INT DEFAULT NULL,
  quartersPlayed INT DEFAULT NULL,
  minutesPlayed INT DEFAULT NULL,
  
  -- Performance Statistics
  goals INT DEFAULT NULL,
  goals1 INT DEFAULT NULL,
  goals2 INT DEFAULT NULL,
  goals3 INT DEFAULT NULL,
  goalAttempts INT DEFAULT NULL,
  goalAttempts1 INT DEFAULT NULL,
  goalAttempts2 INT DEFAULT NULL,
  goalAttempts3 INT DEFAULT NULL,
  goalMisses INT DEFAULT NULL,
  goalMisses1 INT DEFAULT NULL,
  goalMisses2 INT DEFAULT NULL,
  goalMisses3 INT DEFAULT NULL,
  points INT DEFAULT NULL,
  
  -- Defensive Statistics
  rebounds INT DEFAULT NULL,
  defensiveRebounds INT DEFAULT NULL,
  offensiveRebounds INT DEFAULT NULL,
  deflections INT DEFAULT NULL,
  deflectionWithGain INT DEFAULT NULL,
  deflectionWithNoGain INT DEFAULT NULL,
  deflectionPossessionGain INT DEFAULT NULL,
  intercepts INT DEFAULT NULL,
  interceptPassThrown INT DEFAULT NULL,
  gain INT DEFAULT NULL,
  gainToGoalPerc INT DEFAULT NULL,
  pickups INT DEFAULT NULL,
  blocked INT DEFAULT NULL,
  blocks INT DEFAULT NULL,
  
  -- Turnover Statistics
  turnovers INT DEFAULT NULL,
  generalPlayTurnovers INT DEFAULT NULL,
  missedGoalTurnover INT DEFAULT NULL,
  unforcedTurnovers INT DEFAULT NULL,
  turnoverHeld INT DEFAULT NULL,
  possessionChanges INT DEFAULT NULL,
  
  -- Passing and Assisting Statistics
  passes INT DEFAULT NULL,
  feeds INT DEFAULT NULL,
  feedWithAttempt INT DEFAULT NULL,
  goalAssists INT DEFAULT NULL,
  centrePassToGoalPerc INT DEFAULT NULL,
  centrePassReceives INT DEFAULT NULL,
  secondPhaseReceive INT DEFAULT NULL,
  
  -- Penalties and Errors
  penalties INT DEFAULT NULL,
  contactPenalties INT DEFAULT NULL,
  obstructionPenalties INT DEFAULT NULL,
  offsides INT DEFAULT NULL,
  badPasses INT DEFAULT NULL,
  badHands INT DEFAULT NULL,
  breaks INT DEFAULT NULL,
  
  -- Miscellaneous
  tossUpWin INT DEFAULT NULL,

  -- Primary Key and Foreign Key
  PRIMARY KEY (matchId, playerId),
  FOREIGN KEY (fixtureId, matchId) REFERENCES fast5_womens_fixture(fixtureId, matchId)  -- Composite foreign key
);
