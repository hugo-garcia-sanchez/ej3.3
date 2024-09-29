DROP DATABASE IF EXISTS DDBB;
CREATE DATABASE DDBB;
USE DDBB;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY NOT NULL,
	nombre VARCHAR (255) NOT NULL,
	contraseña VARCHAR (255) NOT NULL,
	puntos INT NOT NULL
)ENGINE = InnoDB;

CREATE TABLE Mesa (
	idMesa INT PRIMARY KEY NOT NULL,
	numJugadores INT NOT NULL,
	numCartas INT NOT NULL
	FechaHoraFinalizacion DATETIME NOT NULL,
    	Duracion INTEGER NOT NULL,
    	Ganador INTEGER NOT NULL,
)ENGINE = InnoDB;

CREATE TABLE Relaciones (
	PlayerId INT NOT NULL,
	MesaId INT NOT NULL,
FOREIGN KEY (PlayerId) REFERENCES Usuario(idUsuario),
FOREIGN KEY (MesaId) REFERENCES Mesa(idMesa)
)ENGINE = InnoDB;

INSERT INTO Usuario VALUES (9,'Hugo','hugo',10,'2023-09-29 18:00:00', 20, 2);
INSERT INTO Usuario VALUES (3,'Iker','iker',9,'2023-09-2 14:30:00', 15, 1);
INSERT INTO Usuario VALUES (5,'Jordi','jordi',7,'2023-09-17 17:00:00', 10, 2);
INSERT INTO Usuario VALUES (7,'Ivan','ivan',13,'2023-09-13 18:00:00', 30, 1);

INSERT INTO Mesa VALUES (1,4,60);
INSERT INTO Relaciones VALUES (9,1);
INSERT INTO Relaciones VALUES (3,1);
INSERT INTO Relaciones VALUES (5,1);
INSERT INTO Relaciones VALUES (7,1);
