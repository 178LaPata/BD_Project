use autovrumvrum;

-- -------------------------  QUERY 1  -------------------------
DROP PROCEDURE IF EXISTS carros_disponiveis;

DELIMITER //
CREATE PROCEDURE carros_disponiveis ()
	BEGIN
		SELECT * FROM Carro WHERE Carro.ID NOT IN (SELECT Venda.Carro_ID FROM Venda WHERE Venda.Carro_ID IS NOT NULL);
	END //
DELIMITER //

CALL carros_disponiveis();

-- -------------------------  QUERY 2  -------------------------
DROP PROCEDURE IF EXISTS carros_vendidos;

DELIMITER //
CREATE PROCEDURE carros_vendidos ()
    BEGIN
        SELECT * FROM Carro WHERE Carro.ID IN (SELECT Venda.Carro_ID FROM Venda WHERE Venda.Carro_ID IS NOT NULL);
    END //
DELIMITER //

CALL carros_vendidos();

-- -------------------------  QUERY 3  -------------------------
DROP PROCEDURE IF EXISTS funcionarios_disponiveis;

DELIMITER //
CREATE PROCEDURE funcionarios_disponiveis ()
    BEGIN
        SELECT * FROM Funcionario;
    END //
DELIMITER //

CALL funcionarios_disponiveis();

-- -------------------------  QUERY 4  -------------------------
DROP PROCEDURE IF EXISTS clientes_stand;

DELIMITER //
CREATE PROCEDURE clientes_stand ()
    BEGIN
        SELECT * FROM Cliente;
    END //
DELIMITER //

CALL clientes_stand();

-- -------------------------  QUERY 5  -------------------------
DROP PROCEDURE IF EXISTS carros_disponiveis_por_marca;

DELIMITER //
CREATE PROCEDURE carros_disponiveis_por_marca (IN marca VARCHAR(50))
	BEGIN
		SELECT * FROM Carro WHERE Carro.Marca = marca;
	END //
DELIMITER //

CALL carros_disponiveis_por_marca('tesla');

-- -------------------------  QUERY 6  -------------------------
DROP PROCEDURE IF EXISTS historico_compras_cliente;

DELIMITER //
CREATE PROCEDURE historico_compras_cliente (IN cliente_id INT)
    BEGIN
        SELECT * FROM Venda WHERE Venda.Cliente_ID = cliente_id;
    END //
DELIMITER //

CALL historico_compras_cliente(1);

-- -------------------------  QUERY 7  -------------------------
DROP PROCEDURE IF EXISTS historico_testDrives;

DELIMITER //
CREATE PROCEDURE historico_testDrives(IN cliente_id INT)
    BEGIN
        SELECT * FROM TestDrive WHERE TestDrive.Cliente_ID = cliente_id;
    END //
DELIMITER //

CALL historico_testDrives(1);


-- -------------------------  QUERY 8  -------------------------

DROP PROCEDURE IF EXISTS carrosMaisVendidos;

DELIMITER //
CREATE PROCEDURE carrosMaisVendidos()
    BEGIN
        SELECT Carro.Marca, Carro.Modelo, COUNT(Venda.Carro_ID) AS 'Vendas' FROM Carro, Venda WHERE Carro.ID = Venda.Carro_ID GROUP BY Carro.ID ORDER BY Vendas DESC;
    END // 
DELIMITER //

CALL carrosMaisVendidos();

-- -------------------------  QUERY 9  -------------------------



-- -------------------------  QUERY 10  -------------------------
