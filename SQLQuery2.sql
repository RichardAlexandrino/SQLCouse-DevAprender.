CREATE TABLE DriversLicense (
	ID INT NOT NULL UNIQUE,
	Name VARCHAR(255) NOT NULL,
	Age INT CHECK(Age>=18)
);

SELECT *
FROM DriversLicense;

INSERT INTO DriversLicense (ID, Name, Age) VALUES
	(1, 'Rafael Silva', 17); -- Error

INSERT INTO DriversLicense (ID, Name, Age) VALUES
	(1, 'Rafael Silva', 18);

ALTER TABLE DriversLicense
ADD Code INT UNIQUE;

INSERT INTO DriversLicense (ID, Name, Age, Code) VALUES
	(2, 'Marcos Souza', 22, 0002),
	(3, 'João Pereira', 19, 0003), -- Violation of UNIQUE KEY constraint 'UQ__DriversL__A25C5AA7C3F45744'. Cannot insert 
	(4, 'Maria Clara', 21, 0003); -- duplicate key in object 'dbo.DriversLicense'. The duplicate key value is (3).

INSERT INTO DriversLicense (ID, Name, Age, Code) VALUES
	(2, 'Marcos Souza', 22, 0002),
	(3, 'João Pereira', 19, 0003), 
	(4, 'Maria Clara', 21, 0004);

SELECT * 
FROM DriversLicense;

UPDATE DriversLicense
SET Code = 1
Where ID = 1;