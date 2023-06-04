use autovrumvrum;

-- -------------------------  QUERY 1  -------------------------
DROP PROCEDURE IF EXISTS carros_disponiveis;

DELIMITER //
CREATE PROCEDURE carros_disponiveis ()
	BEGIN
		SELECT * FROM Carro
		WHERE Carro.ID NOT IN (SELECT Venda.Carro_ID FROM Venda WHERE Venda.Carro_ID);
	END //
DELIMITER //

CALL carros_disponiveis();

-- -------------------------  QUERY 2  -------------------------
DROP PROCEDURE IF EXISTS carros_vendidos;

DELIMITER //
CREATE PROCEDURE carros_vendidos ()
    BEGIN
        SELECT * FROM Carro
        WHERE Carro.ID IN (SELECT Venda.Carro_ID FROM Venda WHERE Venda.Carro_ID);
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
        SELECT * FROM Carro
        WHERE Carro.ID NOT IN (SELECT Venda.Carro_ID FROM Venda WHERE Venda.Carro_ID)
        AND Carro.Marca = marca;
    END //
DELIMITER //

CALL carros_disponiveis_por_marca('xiaomi');

-- -------------------------  QUERY 6  -------------------------
DROP PROCEDURE IF EXISTS historico_compras_cliente;

DELIMITER //
CREATE PROCEDURE historico_compras_cliente (IN cliente_id INT)
    BEGIN
        SELECT * FROM Venda
        WHERE Venda.Cliente_ID = cliente_id;
    END //
DELIMITER //

CALL historico_compras_cliente(1);

-- -------------------------  QUERY 7  -------------------------
DROP PROCEDURE IF EXISTS historico_testDrives;

DELIMITER //
CREATE PROCEDURE historico_testDrives(IN cliente_id INT)
    BEGIN
        SELECT * FROM TestDrive
        WHERE TestDrive.Cliente_ID = cliente_id;
    END //
DELIMITER //

CALL historico_testDrives(1);

-- -------------------------  QUERY 8  -------------------------
DROP PROCEDURE IF EXISTS carrosMaisVendidosMarca;

DELIMITER //
CREATE PROCEDURE carrosMaisVendidosMarca()
    BEGIN
        SELECT Carro.Marca, COUNT(Venda.Carro_ID) AS 'Vendas'
        FROM Carro, Venda
        WHERE Carro.ID = Venda.Carro_ID
        GROUP BY Carro.ID
        ORDER BY Vendas DESC
        LIMIT 5;
    END //
DELIMITER //

CALL carrosMaisVendidosMarca();

-- -------------------------  QUERY 9  -------------------------
DROP PROCEDURE IF EXISTS receitasMensais;

DELIMITER //
CREATE PROCEDURE receitasMensais(IN mes INT)
    BEGIN
        DECLARE receita DECIMAL(10, 2);
        SELECT SUM(Venda.Preco) INTO receita
        FROM Venda
        WHERE MONTH(Venda.Data_Venda) = mes;
        SELECT receita AS 'Receita';
    END //
DELIMITER //

CALL receitasMensais(3);

-- -------------------------  QUERY 10  -------------------------
DROP PROCEDURE IF EXISTS fornecores_disponiveis;

DELIMITER //
CREATE PROCEDURE fornecores_disponiveis()
    BEGIN
        SELECT * FROM Fornecedor;
    END //
DELIMITER //

CALL fornecores_disponiveis();

-- -------------------------  QUERY 11  -------------------------
DROP PROCEDURE IF EXISTS comprasFornecedor;

DELIMITER //
CREATE PROCEDURE comprasFornecedor(IN fornecedor_id INT)
    BEGIN
        SELECT * FROM Compra
        WHERE Compra.Fornecedor_ID = fornecedor_id;
    END //
DELIMITER //

CALL comprasFornecedor(1);

-- -------------------------  QUERY 12  -------------------------
DROP VIEW IF EXISTS top10CarrosMaisVendidos;

CREATE VIEW top10CarrosMaisVendidos AS
SELECT Carro.Marca, Carro.Modelo, COUNT(Venda.Carro_ID) AS 'Vendas'
FROM Carro, Venda
WHERE Carro.ID = Venda.Carro_ID
GROUP BY Carro.ID
ORDER BY Vendas DESC
LIMIT 10;

SELECT * FROM top10CarrosMaisVendidos;



