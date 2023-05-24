DELIMITER //
CREATE PROCEDURE insere_fornecedor (IN Nome VARCHAR(75), IN Tipo ENUM('Individual', 'Empresa'), IN NIF INT)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
		
        DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
                SHOW WARNINGS;
                ROLLBACK;
			END;
    
		START TRANSACTION;
			INSERT INTO Fornecedor
				(Nome, Tipo, NIF)
				VALUES
				(Nome, Tipo, NIF);
		COMMIT;
	END //
    

DELIMITER //
CREATE PROCEDURE insere_funcionario (IN Nome VARCHAR(75), IN Genero VARCHAR(1) , IN Data_de_Nascimento DATE, IN NIF INT, IN Tipo ENUM('Vendesor', 'Comprador') )
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO Funcionario
				(Nome, Genero, Data_de_Nascimento, NIF, Tipo)
				VALUES
				(Nome, Genero, Data_de_Nascimento, NIF, Tipo);
		COMMIT;
END //

DELIMITER //
CREATE PROCEDURE insere_cliente (IN Nome VARCHAR(75), IN Genero VARCHAR(1) , IN Data_de_Nascimento DATE, IN NIF INT, IN Morada VARCHAR(75))
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO Cliente
				(Nome, Genero, Data_de_Nascimento, NIF, Morada)
				VALUES
				(Nome, Genero, Data_de_Nascimento, NIF, Morada);
		COMMIT;
END //

DELIMITER //
CREATE PROCEDURE insere_compra (IN Data_Compra DATE, IN Preco DOUBLE, IN Funcionario_ID INT, IN Fornecedor_ID INT)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO Compra
				(Data_Compra, Preco, Funcionario_ID, Fornecedor_ID)
				VALUES
				(Data_Compra, Preco, Funcionario_ID, Fornecedor_ID);
		COMMIT;
END //

DELIMITER //
CREATE PROCEDURE  insere_venda (IN Data_Venda DATE, IN Preco DOUBLE, IN Cliente_ID INT, IN Funcionario_ID INT)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO Venda
				(Data_Venda, Preco, Cliente_ID, Funcionario_ID)
				VALUES
				(Data_Venda, Preco, Cliente_ID, Funcionario_ID);
		COMMIT;
END //

DELIMITER //
CREATE PROCEDURE insere_carro (IN Marca VARCHAR(50), IN Modelo VARCHAR(50), IN Ano INT, IN Kilometros INT, IN Cilindrada INT, IN Combustivel ENUM('Gasolina', 'Gasoleo', 'Hibrido', 'Eletrico', 'Gas'), IN Preco DOUBLE, IN Estado VARCHAR(75), IN Fornecedor_ID INT, IN Compra_ID INT, IN Venda_ID INT)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO Carro
				(Marca, Modelo, Ano, Kilometros, Cilindrada, Combustivel, Preco, Estado, Fornecedor_ID, Compra_ID, Venda_ID)
				VALUES
				(Marca, Modelo, Ano, Kilometros, Cilindrada, Combustivel, Preco, Estado, Fornecedor_ID, Compra_ID, Venda_ID);
		COMMIT;
END //

DELIMITER //
CREATE PROCEDURE insere_TesteDrive (IN Data_Ocorrencia DATE, IN Cliente_ID INT, IN Funcionario_ID INT, IN Carro_ID INT)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO TesteDrive
				(Data_Ocorrencia, Cliente_ID, Funcionario_ID, Carro_ID)
				VALUES
				(Data_Ocorrencia, Cliente_ID, Funcionario_ID, Carro_ID);
		COMMIT;
END //

DELIMITER //
CREATE PROCEDURE insere_tlm_Cliente (IN Telemovel INT, IN Cliente_ID INT)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO tlm_Cliente
				(Telemovel, Cliente_ID)
				VALUES
				(Telemovel, Cliente_ID);
		COMMIT;
END //



DELIMITER //
CREATE PROCEDURE insere_email_Cliente (IN Email VARCHAR(90), IN Cliente_ID INT)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO email_Cliente
				(Email, Cliente_ID)
				VALUES
				(Email, Cliente_ID);
		COMMIT;
END //


DELIMITER //
CREATE PROCEDURE insere_email_Fornecedor (IN Email VARCHAR(90), IN Fornecedor_ID INT) 
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO tlm_Cliente
				(Email, Fornecedor_ID)
				VALUES
				(Email, Fornecedor_ID);
		COMMIT;
END //


DELIMITER //
CREATE PROCEDURE insere_tlm_Fornecedor (IN Telemovel INT, IN Fornecedor_ID INT) 
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO tlm_Cliente
				(Telemovel, Fornecedor_ID)
				VALUES
				(Telemovel, Fornecedor_ID);
		COMMIT;
END //



DELIMITER //
CREATE PROCEDURE insere_tlm_Funcionario (IN Telemovel INT, IN Funcionario_ID INT)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO tlm_Funcionario
				(Telemovel, Funcionario_ID)
				VALUES
				(Telemovel, Funcionario_ID);
		COMMIT;
END //


DELIMITER //
CREATE PROCEDURE insere_email_Funcionario (IN Email VARCHAR(90), IN Funcionario_ID INT)
	BEGIN
		DECLARE exit handler for SQLEXCEPTION
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		
		DECLARE exit handler for SQLWARNING
			BEGIN
				SHOW ERRORS LIMIT 1;
				SHOW WARNINGS;
				ROLLBACK;
			END;
		START TRANSACTION;
			INSERT INTO email_Funcionario
				(Email, Funcionario_ID)
				VALUES
				(Email, Funcionario_ID);
		COMMIT;
END //












