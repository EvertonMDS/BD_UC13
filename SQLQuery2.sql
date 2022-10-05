-- Criação do DDL onde são criadas a estrutura

CREATE DATABASE RpgOnlineBD

USE RpgOnlineBD

-- Fazer a tabela Usuarios (UsuarioID, Email, Senha)
CREATE TABLE Usuarios (
	UsuarioID INT PRIMARY KEY IDENTITY,
	Email VARCHAR (100) UNIQUE NOT NULL,
	Senha VARCHAR (255) NOT NULL,
)

-- Fazer a tabela Classes (ClasseID, Nome, Descrição)
CREATE TABLE Classes (
	ClasseID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) UNIQUE NOT NULL,
	Descrição VARCHAR (255),
)

-- Fazer a tabela Personagens (PersonagemID, NomePersonagem, UsuarioID[referido na tabela Usuarios], ClasseID[referido na tabela Classes])
CREATE TABLE Personagens (
	PersonagemID INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR (15) UNIQUE NOT NULL,
	UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID),
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID),
)

-- Fazer a tabela Habiliades (HabilidadeID, Nome) 
CREATE TABLE Habilidades(
	HabilidadeID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) UNIQUE NOT NULL
)

-- Fazer a tabela ClasseHabilidade pois na cardinalidade N:N esta tabela extra deve ser criada) 
CREATE TABLE ClasseHabilidade (
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID),
	HabilidadeID INT FOREIGN KEY REFERENCES Habilidades(HabilidadeID)
)

ALTER TABLE Personagens 
ALTER COLUMN NomePersonagem VARCHAR (100);


-- DML - Inserir os Dados nas tabelas
	INSERT INTO Usuarios VALUES ('joca@joca.com', '12345')
	INSERT INTO Classes VALUES ('Bárbaro', 'Ele é realmente Bárbaro')
	INSERT INTO Usuarios VALUES ('manoel@manoel.com', HASHBYTES('SHA2_512', '123456'))
	INSERT INTO Habilidades VALUES ('Direto'), ('Jab'), ('Upper'), ('Cruzado')
	INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Cesar Romano', 3,2)
	INSERT INTO ClasseHabilidade (ClasseID, HabilidadeID) VALUES (2,3), (2, 2), (2 ,1)

	UPDATE Usuarios
	SET Senha = '987456321'
	WHERE UsuarioID = 1


-- DQL  - Mostra as consultas das informações inseridas nas tablelas
	SELECT * FROM Usuarios
	SELECT * FROM Classes
	SELECT * FROM Habilidades
	SELECT * FROM Personagens
	SELECT * FROM ClasseHabilidade


	SELECT * FROM Personagens
	INNER JOIN Classes
	ON Personagens.ClasseID = Classes.ClasseID

	--Exemplo JOIN

	CREATE DATABASE ExemplosJOIN

	USE ExemplosJOIN

--DDL

	CREATE TABLE TabelaA(
	Nome VARCHAR (50) Null	
	)
	
	CREATE TABLE TabelaB(
	Nome VARCHAR (50) Null	
	)

--DML

	INSERT INTO TabelaA VALUES ('Fernanda')
	INSERT INTO TabelaA VALUES ('Josefa')
	INSERT INTO TabelaA VALUES ('Luiz')
	INSERT INTO TabelaA VALUES ('Fernando')

	INSERT INTO TabelaB VALUES ('Carlos'), ('Manoel'), ('Luiz'), ('Fernando')

--DQL

	SELECT * FROM TabelaA
	SELECT * FROM TabelaB

	SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
	INNER JOIN TabelaB
	ON TabelaA.Nome = TabelaB.Nome

	SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
	LEFT JOIN TabelaB
	ON TabelaA.Nome = TabelaB.Nome

	SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
	RIGHT JOIN TabelaB
	ON TabelaA.Nome = TabelaB.Nome

	SELECT TabelaA.Nome AS TabelaA, TabelaB.Nome AS TabelaB FROM TabelaA
	FULL OUTER JOIN TabelaB
	ON TabelaA.Nome = TabelaB.Nome