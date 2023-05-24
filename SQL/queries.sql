use autovrumvrum;

DROP PROCEDURE IF EXISTS carrosMaisVendidos;

DELIMITER //
CREATE PROCEDURE carrosMaisVendidos()
    BEGIN
        SELECT Carro.Marca, Carro.Modelo, COUNT(Venda.Carro_ID) AS 'Vendas' FROM Carro, Venda WHERE Carro.ID = Venda.Carro_ID GROUP BY Carro.ID ORDER BY Vendas DESC;
    END // 
DELIMITER //

CALL carrosMaisVendidos();