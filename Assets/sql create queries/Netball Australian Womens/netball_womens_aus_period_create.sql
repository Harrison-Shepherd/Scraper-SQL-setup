CREATE TABLE netball_womens_aus_period (
  
  -- Match Statistics
  rebounds INT DEFAULT NULL,
  turnoverHeld INT DEFAULT NULL,
  netPoints DECIMAL(3,2) DEFAULT NULL,
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
  deflections INT DEFAULT NULL,
  deflectionPossessionGain INT DEFAULT NULL,  
  goalAssists INT DEFAULT NULL,
  tossUpWin INT DEFAULT NULL,
  centrePassReceives INT DEFAULT NULL,
  obstructionPenalties INT DEFAULT NULL,
  feeds INT DEFAULT NULL,

  -- Player Information
  playerId INT NOT NULL,
  squadId INT NOT NULL,
  startingPositionCode VARCHAR(45) DEFAULT NULL,
  currentPositionCode VARCHAR(45) DEFAULT NULL,

  -- Performance Statistics
  goals INT DEFAULT NULL,
  offsides INT DEFAULT NULL,
  secondPhaseReceive INT DEFAULT NULL,
  badPasses INT DEFAULT NULL,
  period INT DEFAULT NULL,
  breaks INT DEFAULT NULL,
  blocks INT DEFAULT NULL,
  badHands INT DEFAULT NULL,
  missedGoalTurnover INT DEFAULT NULL,
  possessionChanges INT DEFAULT NULL,
  goalAttempts INT DEFAULT NULL,
  contactPenalties INT DEFAULT NULL,
  quartersPlayed INT DEFAULT NULL,
  minutesPlayed INT DEFAULT NULL,
  feedWithAttempt INT DEFAULT NULL,
  unforcedTurnovers INT DEFAULT NULL,
  pickups INT DEFAULT NULL,
  gainToGoalPerc INT DEFAULT NULL,
  intercepts INT DEFAULT NULL,

  -- Additional Statistics 
  goal_from_zone2 INT DEFAULT NULL,
  goal_from_zone1 INT DEFAULT NULL,
  attempt_from_zone2 INT DEFAULT NULL,
  attempt_from_zone1 INT DEFAULT NULL,
  goal2 INT DEFAULT NULL,
  goal1 INT DEFAULT NULL,
  attempts2 INT DEFAULT NULL,
  attempts1 INT DEFAULT NULL,

  -- Match Information
  matchId INT NOT NULL,  -- Reference to the match
  periodId VARCHAR(45) NOT NULL,  -- Using the matchId_period format


  -- Keys
  PRIMARY KEY (periodId, playerId),  -- Composite primary key for uniqueness
  FOREIGN KEY (matchId) REFERENCES netball_womens_aus_match(matchId)  -- Foreign key linking to match table
);
