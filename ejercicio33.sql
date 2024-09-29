DROP DATABASE IF EXISTS Championship;
CREATE DATABASE Championship;
USE Championship;

CREATE TABLE Player (
	Identifier INT PRIMARY KEY NOT NULL,
	Name VARCHAR (255) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE Game (
	Identifier INT PRIMARY KEY NOT NULL,
	Location VARCHAR (255) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE `Participation` (
	Player INT NOT NULL,
	Game INT NOT NULL,
	Position INT NOT NULL,
FOREIGN KEY(Player) REFERENCES Player(Identifier),
FOREIGN KEY(Game) REFERENCES Game(Identifier)
)ENGINE = InnoDB;



INSERT INTO Player VALUES (1,'Jan');
INSERT INTO Player VALUES (2,'Eric');
INSERT INTO Player VALUES (3,'Ivan');
INSERT INTO Player VALUES (4,'Alexis');
INSERT INTO Player VALUES (5,'Joel');

INSERT INTO Game VALUES (1,'Barcelona');
INSERT INTO Game VALUES (2,'Madrid');
INSERT INTO Game VALUES (3, 'Vigo');

INSERT INTO Participation VALUES (1,1,2);
INSERT INTO Participation VALUES (2,1,3);
INSERT INTO Participation VALUES (3,1,4);
INSERT INTO Participation VALUES (5,1,1);
INSERT INTO Participation VALUES (3,2,2);
INSERT INTO Participation VALUES (4,2,1);
INSERT INTO Participation VALUES (5,3,1);
INSERT INTO Participation VALUES (3,3,3);
INSERT INTO Participation VALUES (4,3,2);
INSERT INTO Participation VALUES (1,2,3);
INSERT INTO Participation VALUES (2,2,4);
INSERT INTO Participation VALUES (1,3,4);



SELECT Game.Identifier,Game.Location FROM Player,Game,`Participation` WHERE
	Player.Name = 'Joel' AND 
	Player.Identifier = Participation.Player AND
	(Participation.Position = 1 OR Participation.Position = 2) AND
	Participation.Game = Game.Identifier;


SELECT `Participation`.Game FROM Player,`Participation` WHERE 
	Player.Name = 'Ivan' AND
	Player.Identifier = Participation.Player AND
	Participation.Game IN ( SELECT Participation.Game FROM Player,Participation WHERE Player.Name = 'Joel' AND Player.Identifier = Participation.Player);




