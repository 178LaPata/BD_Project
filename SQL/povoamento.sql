-- -----------------------------------------------------
-- Indicação da base de dados de trabalho
-- -----------------------------------------------------
USE AutoVrumVrum;

-- -----------------------------------------------------
-- Povoamento da tabela `Fornecedor`
-- -----------------------------------------------------
INSERT INTO Fornecedor(Nome, Tipo, NIF) VALUES
('matilde', 'Empresa', 123456789),
('lara', 'Empresa', 345678912),
('ricardo', 'Individual',567891234),
('kiko', 'Individual',234567891);

-- -----------------------------------------------------
-- Povoamento da tabela `Funcionario`
-- -----------------------------------------------------
INSERT INTO Funcionario(Nome, Genero, Data_de_Nascimento, NIF, Tipo) VALUES
( 'joao', 'M', '2002-09-27', 984727874, 'Vendedor'),
( 'beatriz', 'F', '2002-08-30', 654321789, 'Comprador'),
( 'bianca', 'F', '2002-03-05', 226655773, 'Vendedor'),
( 'andre', 'M', '2002-11-14', 987654321, 'Comprador');

-- -----------------------------------------------------
-- Povoamento da tabela `Cliente
-- -----------------------------------------------------
INSERT INTO Cliente(Nome, Genero, Data_de_Nascimento, NIF, Morada) 
VALUES	('henrique', 'M', '2001-02-24', 189076543, 'praceta do vilar'),
		('joana', 'F', '2000-10-13', 392912738, 'braga'),
		('hugo', 'M', '2001-09-12', 475287345, 'porto'),
		('maria', 'F', '2000-07-05', 382837534, 'gota'),
		('telmo', 'M', '1999-02-20', 653123939, 'peoes');

-- -----------------------------------------------------
-- Povoamento da tabela `Compra`
-- -----------------------------------------------------
INSERT INTO Compra(Data_Compra, Preco, Funcionario_ID, Fornecedor_ID) 
VALUES	('2023-01-15', 120.50, 1, 2),
		('2022-06-20', 20.30, 2, 3),
		('2022-05-17', 10.20, 3, 2),
		('2022-04-07', 55.55, 4, 1),
		('2022-03-05', 44.44, 1, 4),
		('2022-02-10', 60.00, 4, 2);

-- -----------------------------------------------------
-- Povoamento da tabela `Venda`
-- -----------------------------------------------------
INSERT INTO Venda(Data_Venda, Preco, Cliente_ID, Funcionario_ID) 
VALUES	('2022-11-15', 1120.50, 1, 2),
		('2022-12-20', 2120.30, 2, 3),
		('2022-10-17', 4210.20, 3, 2),
		('2022-05-07', 5555.55, 5, 1),
		('2021-03-05', 3444.44, 1, 4),
		('2021-02-10', 7860.00, 4, 2);
		
-- -----------------------------------------------------
-- Povoamento da tabela `Carro`
-- -----------------------------------------------------
INSERT INTO Carro(Marca, Modelo, Ano, Kilometros, Cilindrada, Combustivel, Preco, Estado, Fornecedor_ID, Compra_ID, Venda_ID) 
VALUES	('bmw', 'serie 4', 2019, 220202, 420, 'Gasoleo', 57000000.0, 'novo', 1, 1, 1),
		('audi', 'a3', 2018, 200000, 300, 'Gasolina', 50000000.0, 'usado', 2, 2, 2),
		('mercedes', 'classe a', 2017, 150000, 200, 'Gas', 40000000.0, 'usado', 3, 3, 3),
		('ferrari', '911', 2000, 150230, 200, 'Gas', 400000.0, 'usado', 4, 4, 4),
		('mercedes', 'amg gt', 2022, 0, 500, 'Hibrido', 1000000.0, 'bonito', 1, 5, 5),
		('tesla', 'model x', 2018, 300000, 600, 'Eletrico', 200000000.0, 'feio', 2, 6, 6),
		('seat', 'ibiza', 2002, 111111, 290, 'Gasolina', 5000.0, 'cringe', 3, 1, 2);

-- -----------------------------------------------------
-- Povoamento da tabela `TestDrive`
-- -----------------------------------------------------
INSERT INTO TestDrive(Data_Ocorrencia, Cliente_ID, Funcionario_ID, Carro_ID) 
VALUES	('2023-02-23', 1, 1, 1),
		('2023-03-19', 2, 2, 2),
		('2023-04-15', 3, 3, 3),
		('2023-05-20', 4, 4, 4),
		('2023-06-25', 5, 3, 5);

-- -----------------------------------------------------
-- Povoamento da tabela `Telemovel_Cliente`
-- -----------------------------------------------------
INSERT INTO Telemovel_Cliente(Telemovel, Cliente_ID) VALUES
(992939495, 1),
(987654321, 2),
(876543219, 3),
(765432198, 4),
(198288744, 5);

-- -----------------------------------------------------
-- Povoamento da tabela `Email_Cliente`
-- -----------------------------------------------------
INSERT INTO Email_Cliente(Email, Cliente_ID) VALUES
('bu@gmail.com', 1),
('bubu@gmail.com', 2),
('bububu@gmail.com', 3),
('bubububu@gmail.com', 4),
('bububububu@gmail.com', 5);

-- -----------------------------------------------------
-- Povoamento da tabela `Email_Fornecedor`
-- -----------------------------------------------------
INSERT INTO Email_Fornecedor(Email, Fornecedor_ID) VALUES
('ti@gmail.com', 1),
('titi@gmail.com', 2),
('tititi@gmail.com', 3),
('titititi@gmail.com', 4);

-- -----------------------------------------------------
-- Povoamento da tabela `Telemovel_Fornecedor`
-- -----------------------------------------------------
INSERT INTO Telemovel_Fornecedor(Telemovel, Fornecedor_ID) VALUES
(921483871, 1),
(475092508, 2),
(382959135, 3),
(192837466, 4);

-- -----------------------------------------------------
-- Povoamento da tabela `Email_Funcionario`
-- -----------------------------------------------------
INSERT INTO Email_Funcionario(Email, Funcionario_ID) VALUES
('bi@gmail.com', 1),
('bibi@gmail.com', 2),
('bibibi@gmail.com', 3),
('bibibibi@gmail.com', 4);

-- -----------------------------------------------------
-- Povoamento da tabela `Telemovel_Funcionario`
-- -----------------------------------------------------
INSERT INTO Telemovel_Funcionario(Telemovel, Funcionario_ID) VALUES
('871564307', 1),
('357081253', 2),
('983579864', 3),
('378950450', 4);
