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
    


CREATE PROCEDURE insere_funcionario (IN Nome VARCHAR(75), IN , IN Tipo ENUM('Vendesor', 'Comprador'), IN NIF INT)
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
				(Numero,Email,Telefone,Nome,Data_nascimento,Função,Restaurante_NIF,Genero,Nacionalidade)
				VALUES
				(nr,email,tel,nome,data_Nascimento,funcao,nif_restaurante,genero,nacionalidade);
		COMMIT;
	END //