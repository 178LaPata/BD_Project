use autovrumvrum;

-- -------------------------  QUERY 1  -------------------------
DROP VIEW IF EXISTS viewCarrosDisponiveis;

DELIMITER //
CREATE VIEW viewCarrosDisponiveis AS
    SELECT Carro.Marca, Carro.Modelo, Carro.Ano, Carro.Kilometros, Carro.Cilindrada, Carro.Combustivel, Carro.Preco, Carro.Estado
    FROM Carro
    WHERE Carro.ID NOT IN (SELECT Venda.Carro_ID FROM Venda WHERE Venda.Carro_ID);
DELIMITER //

SELECT * FROM viewCarrosDisponiveis;

-- -------------------------  QUERY 2  -------------------------
DROP VIEW IF EXISTS viewCarrosVendidos;

DELIMITER //
    CREATE VIEW viewCarrosVendidos AS
        SELECT Carro.Marca, Carro.Modelo, Carro.Ano, Carro.Kilometros, Carro.Cilindrada, Carro.Combustivel, Carro.Preco, Carro.Estado
        FROM Carro
        WHERE Carro.ID IN (SELECT Venda.Carro_ID FROM Venda WHERE Venda.Carro_ID);
DELIMITER //

SELECT * FROM viewCarrosVendidos;

-- -------------------------  QUERY 3  -------------------------
DROP PROCEDURE IF EXISTS funcionarios_disponiveis;

DELIMITER //
CREATE PROCEDURE funcionarios_disponiveis ()
    BEGIN
        SELECT funcionario.Nome, funcionario.Genero, funcionario.Data_de_Nascimento, funcionario.NIF, funcionario.Tipo
        FROM Funcionario;
    END //
DELIMITER //

CALL funcionarios_disponiveis();

-- -------------------------  QUERY 4  -------------------------
DROP VIEW IF EXISTS viewClientes;

DELIMITER //
CREATE VIEW viewClientes AS
    SELECT Cliente.Nome, Cliente.Genero, Cliente.Data_de_Nascimento, Cliente.NIF, Cliente.Morada
    FROM Cliente;
DELIMITER //

SELECT * FROM viewClientes;

-- -------------------------  QUERY 5  -------------------------
DROP PROCEDURE IF EXISTS carros_disponiveis_por_marca;

DELIMITER //
CREATE PROCEDURE carros_disponiveis_por_marca (IN marca VARCHAR(50))
    BEGIN
        SELECT carro.Marca, carro.Modelo, carro.Ano, carro.Kilometros, carro.Cilindrada, carro.Combustivel, carro.Preco, carro.Estado
        FROM Carro
        WHERE Carro.ID NOT IN (SELECT Venda.Carro_ID FROM Venda WHERE Venda.Carro_ID)
        AND Carro.Marca = marca;
    END //
DELIMITER //

CALL carros_disponiveis_por_marca('bmw');

-- -------------------------  QUERY 6  -------------------------
DROP PROCEDURE IF EXISTS historico_compras_cliente;

DELIMITER //
CREATE PROCEDURE historico_compras_cliente (IN cliente_id INT)
    BEGIN
        SELECT cliente.Nome , carro.Marca, carro.Modelo, carro.Ano, carro.Kilometros, carro.Cilindrada, carro.Combustivel, carro.Preco, carro.Estado, venda.Data_Venda, venda.Preco
        FROM Venda
        INNER JOIN Carro ON Carro.ID = Venda.Carro_ID
        INNER JOIN Cliente ON Cliente.ID = Venda.Cliente_ID
        WHERE Venda.Cliente_ID = cliente_id;
    END //
DELIMITER //

CALL historico_compras_cliente(1);

-- -------------------------  QUERY 7  -------------------------
DROP PROCEDURE IF EXISTS historico_testDrives;

DELIMITER //
CREATE PROCEDURE historico_testDrives(IN cliente_id INT)
    BEGIN
        SELECT cliente.Nome, carro.Marca, carro.Modelo, carro.Ano, carro.Kilometros,
               carro.Cilindrada, carro.Combustivel, testDrive.Data_Ocorrencia, funcionario.Nome AS 'Funcionario'
        FROM TestDrive
        INNER JOIN Carro ON Carro.ID = TestDrive.Carro_ID
        INNER JOIN Cliente ON Cliente.ID = TestDrive.Cliente_ID
        INNER JOIN Funcionario ON Funcionario.ID = TestDrive.Funcionario_ID
        WHERE TestDrive.Cliente_ID = cliente_id;
    END //
DELIMITER //

CALL historico_testDrives(1);

-- -------------------------  QUERY 8  -------------------------
DROP PROCEDURE IF EXISTS ObterMarcasMaisVendidas;

DELIMITER //
CREATE PROCEDURE ObterMarcasMaisVendidas()
BEGIN
    SELECT Carro.Marca, COUNT(*) AS Quantidade
    FROM Carro
    INNER JOIN Venda ON carro.ID = Venda.Carro_ID
    GROUP BY Carro.Marca
    ORDER BY Quantidade DESC, Carro.Marca;
END //
DELIMITER //

CALL ObterMarcasMaisVendidas();

-- -------------------------  QUERY 9  -------------------------
DROP PROCEDURE IF EXISTS receitasMensais;

DELIMITER //
CREATE PROCEDURE receitasMensais()
    BEGIN
        SELECT MONTH(Venda.Data_Venda) AS Mes, SUM(Venda.Preco) AS Receita
        FROM Venda
        GROUP BY Mes
        ORDER BY Receita DESC;
    END //
DELIMITER //

CALL receitasMensais();

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
        SELECT Carro.Marca, Carro.Ano, Carro.Modelo, Carro.Cilindrada, Carro.Combustivel, Carro.Preco, Compra.Data_Compra, Fornecedor.Nome AS 'Fornecedor', Funcionario.Nome AS 'Funcionario'
        FROM Compra
        INNER JOIN Carro ON Carro.ID = Compra.Carro_ID
        INNER JOIN Fornecedor ON Fornecedor.ID = Compra.Fornecedor_ID
        INNER JOIN Funcionario ON Funcionario.ID = Compra.Funcionario_ID
        WHERE Compra.Fornecedor_ID = fornecedor_id;
    END //
DELIMITER //

CALL comprasFornecedor(1);

