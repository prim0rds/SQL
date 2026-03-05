--  Simulação SQL – 10 Questões

-- Questão 1
-- Selecione todos os clientes da tabela Cliente.

SELECT * 
FROM Cliente;

-- Questão 2 
-- Liste apenas os clientes que moram no estado PR.

SELECT *
FROM Cliente
WHERE estado = 'PR';

-- Questão 3 
-- Liste apenas os clientes ativos.

SELECT *
FROM Cliente
WHERE status = 'ATIVO';

-- Questão 4 
-- Conte quantos clientes existem na tabela.

SELECT COUNT(id_cliente) AS 'Quantidade de Cliente'
FROM Cliente;

-- Questão 5 
-- Liste todos os pedidos aprovados.

SELECT *
FROM Pedido
WHERE status = 'APROVADO';

-- Questão 6 
-- Mostre todos os pedidos junto com o nome do cliente.

SELECT 
	c.nome, 
    p.id_pedido, 
    p.id_cliente, 
    p.data_pedido, 
    p.status, 
    p.valor_total
FROM Cliente AS c
JOIN Pedido AS p 
	ON c.id_cliente = p.id_cliente;

-- Questão 7 
-- Conte quantos pedidos cada cliente fez.

SELECT 
	c.nome, 
    COUNT(p.id_pedido) AS quantidade_pedidos
FROM Cliente AS c
JOIN Pedido AS p 
	ON c.id_cliente = p.id_cliente
GROUP BY c.nome;

-- Questão 8 
-- Mostre o valor total de cada pedido.

SELECT 
	id_pedido, 
	valor_total
FROM Pedido;

-- Questão 9 
-- Mostre os 3 clientes que mais fizeram pedidos.

SELECT 
	c.id_cliente, 
    COUNT(p.id_pedido) AS qtd_pedido
FROM Cliente AS c
JOIN Pedido AS p
	ON c.id_cliente = p.id_cliente
GROUP BY id_cliente
ORDER BY qtd_pedido DESC
LIMIT 3;

-- Questão 10 
-- Mostre o valor total gasto por cliente.

SELECT
	c.nome,
	SUM(p.valor_total) AS total_gasto
FROM Cliente AS c
JOIN Pedido AS p
	ON c.id_cliente = p.id_cliente
GROUP BY c.nome
ORDER BY total_gasto DESC;