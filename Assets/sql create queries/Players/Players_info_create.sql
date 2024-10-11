CREATE TABLE player_info (
  
  -- Player Information
  playerId VARCHAR(50) NOT NULL,
  playerName VARCHAR(255) DEFAULT NULL,
  surname VARCHAR(255) DEFAULT NULL,
  
  -- Squad and Sport Information
  squadId VARCHAR(50) NOT NULL,
  sportId VARCHAR(50) NOT NULL,

  -- Primary and Foreign Keys
  PRIMARY KEY (playerId, squadId),
  FOREIGN KEY (squadId) REFERENCES squad_info(squadId),
  FOREIGN KEY (sportId) REFERENCES sport_info(sportId)
);
