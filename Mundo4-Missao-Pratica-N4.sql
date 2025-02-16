--- Criar tabelas ---
CREATE TABLE Drivers (
	DriverID INT PRIMARY KEY,
	Nome VARCHAR(100),
	CNH VARCHAR(20),
	Endereco VARCHAR(200),
	Contato VARCHAR(50)
);

CREATE TABLE Clients (
	ClientID INT PRIMARY KEY,
	Nome VARCHAR(100),
	Empresa VARCHAR(100),
	Endereco VARCHAR(200),
	Contato VARCHAR(50)
);

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY,
	ClientID INT,
	DriverID INT,
	DetalhesPedido TEXT,
	DataEntrega DATE,
	Status VARCHAR(50),
	FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
	FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);
GO

--- Inserir dados na tabela Drivers ---
INSERT INTO Drivers (DriverID, Nome, CNH, Endereco, Contato) VALUES  
(1, 'João Pedro Silva', '22.221.681-5', 'Rua Boitata, 121, Pinheiros', '(44) 2244-5487'), 
(2, 'Alex Pinheiro', '192.666.807-7', 'Avenida Brasil, 870, Platinas', '(65) 8463-5587'), 
(3, 'Eugenio José Moreira', '013.870.645-1', 'Rua Costaneira, 1108, Central', '(96) 2584-1100');
GO

--- Inserir dados na tabela Clients ---
INSERT INTO Clients (ClientID, Nome, Empresa, Endereco, Contato) VALUES 
(1, 'Central Peças', 'Central Peças e Distribuidora', 'Rua dos Pinhos, 850, Central', '(22) 5879-4555'), 
(2, 'Julio da Silveira', 'Supermercado Julio', 'Avenida Beira Rio, 1120, Saponeira', '(87) 2266-5587'), 
(3, 'Carlos Manuel Orto', 'Distribuidora Vai Que Da', 'Rua Milenar, 2300, Alto do Parque', '(51) 5511-8922');
GO

--- Inserir dados na tabela Orders ---
INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status) VALUES 
(1, 1, 1, 'Entregar 10 caixas de faróis novos', '2025-02-10', 'Pendente'), 
(2, 2, 2, 'Entregar 100 Volumes de hortigrangeiros', '2024-12-07', 'Finalizado'), 
(3, 3, 3, 'Entregar 200 Engradados de Cerveja', '2025-06-01', 'Finalizado');
GO

-- Seleciona Nome e CNH da tabela Motoristas ---
SELECT Nome, CNH, Contato FROM Drivers;
GO

-- Seleciona Nome e Endereço da tabela Clients ---
SELECT Nome, Endereco, Contato FROM Clients;
GO

-- Seleciona clientes que tem pedidos pendentes  ---
SELECT C.Nome, C.Endereco, C.Contato FROM Clients C JOIN Orders O ON C.ClientID = O.ClientID WHERE O.Status = 'Pendente';
GO

-- Seleciona Clientes com pedidos finalizados  ---
SELECT C.Nome, C.Endereco, C.Contato FROM Clients C JOIN Orders O ON C.ClientID = O.ClientID WHERE O.Status = 'Finalizado';
GO

--- Atualiza o status das Orders 3 para ‘Pendente’ ---
UPDATE Orders SET Status = 'Pendente' WHERE OrderID IN (3);
GO

-- Deleta o registro com OrderID = 2 da tabela Orders. ---
DELETE FROM Orders WHERE OrderID = 2;
GO