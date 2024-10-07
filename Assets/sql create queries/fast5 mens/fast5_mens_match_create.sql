CREATE TABLE fast5_mens_match (
  
  -- Match Statistics
  rebounds INT DEFAULT NULL,
  turnoverHeld INT DEFAULT NULL,
  centrePassToGoalPerc INT DEFAULT NULL,
  penalties INT DEFAULT NULL,
  deflectionWithNoGain INT DEFAULT NULL,
  generalPlayTurnovers INT DEFAULT NULL,
  interceptPassThrown INT DEFAULT NULL,
  gain INT DEFAULT NULL,
  points INT DEFAULT NULL,
  goalMisses INT DEFAULT NULL,
  blocked INT DEFAULT NULL,
  deflectionWithGain INT DEFAULT NULL,
  goalAssists INT DEFAULT NULL,
  tossUpWin INT DEFAULT NULL,
  centrePassReceives INT DEFAULT NULL,
  obstructionPenalties INT DEFAULT NULL,
  feeds INT DEFAULT NULL,

  -- Player Information
  playerId INT NOT NULL,
  goals INT DEFAULT NULL,
  offsides INT DEFAULT NULL,
  secondPhaseReceive INT DEFAULT NULL,
  badPasses INT DEFAULT NULL,
  breaks INT DEFAULT NULL,
  blocks INT DEFAULT NULL,
  badHands INT DEFAULT NULL,
  missedGoalTurnover INT DEFAULT NULL,
  squadId INT NOT NULL,
  deflectionPossessionGain INT DEFAULT NULL,
  possessionChanges INT DEFAULT NULL,
  startingPositionCode VARCHAR(3) DEFAULT NULL,
  goalAttempts INT DEFAULT NULL,
  goalAttempts3 INT DEFAULT NULL,
  goalAttempts2 INT DEFAULT NULL,
  contactPenalties INT DEFAULT NULL,
  goalAttempts1 INT DEFAULT NULL,
  quartersPlayed INT DEFAULT NULL,
  minutesPlayed INT DEFAULT NULL,
  feedWithAttempt INT DEFAULT NULL,
  unforcedTurnovers INT DEFAULT NULL,
  pickups INT DEFAULT NULL,
  goals1 INT DEFAULT NULL,
  currentPositionCode VARCHAR(3) DEFAULT NULL,
  gainToGoalPerc INT DEFAULT NULL,
  intercepts INT DEFAULT NULL,
  goals3 INT DEFAULT NULL,
  goals2 INT DEFAULT NULL,

  -- Additional Information
  shortDisplayName VARCHAR(50) DEFAULT NULL,
  firstname VARCHAR(50) DEFAULT NULL,  
  surname VARCHAR(50) DEFAULT NULL,
  displayName VARCHAR(50) DEFAULT NULL,
  squadName VARCHAR(100) DEFAULT NULL,

  -- Match Information
  homeId INT NOT NULL,
  awayId INT NOT NULL,
  opponent VARCHAR(100) DEFAULT NULL,
  round INT DEFAULT NULL,
  fixtureId INT NOT NULL,
  sportId INT NOT NULL,
  matchId INT NOT NULL,

  -- Keys
  PRIMARY KEY (matchId, playerId),
  FOREIGN KEY (fixtureId, matchId) REFERENCES fast5_mens_fixture(fixtureId, matchId)  -- Composite foreign key
);
