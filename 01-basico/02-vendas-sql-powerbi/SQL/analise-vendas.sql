-- ==============================================================================
-- PROJETO: Análise de Vendas — SQL + Power BI
-- OBJETIVO: Analisar vendas e preparar indicadores para visualização no Power BI
-- ==============================================================================


-- ==============================================================================
-- TAREFA 1: Quantos pedidos foram feitos por produto?
-- ==============================================================================


SELECT produtos,COUNT(*) AS total_pedidos
FROM vendas
GROUP BY produtos
ORDER BY total_pedidos DESC;


-- ==============================================================================
-- TAREFA 2: Qual é a quantidade TOTAL vendida de cada produto?
-- ==============================================================================


SELECT produto, SUM(quantidade) AS qtd_vendida
FROM vendas
GROUP BY produto
ORDER BY qtd_vendida DESC;
  

-- ==============================================================================
-- TAREFA 3: Qual é o TICKET MÉDIO por produto?
-- ==============================================================================


SELECT produto, AVG(preco_unitario * quantidade) AS ticket_medio
FROM vendas
GROUP BY produto
ORDER BY ticket_medio DESC;


-- ==============================================================================
-- TAREFA 4: Quais produtos foram vendidos em MAIS de 3 pedidos diferentes?
-- ==============================================================================


SELECT produto, COUNT(*) AS mais_vendidos
FROM vendas
GROUP BY produto
HAVING COUNT(*) > 3
ORDER BY mais_vendidos DESC;


-- ==============================================================================
-- TAREFA 5: Qual produto teve a MAIOR venda individual em valor financeiro?
-- ==============================================================================


SELECT produto, MAX(preco_unitario * quantidade) AS maior_venda_individual
FROM vendas
GROUP BY produto
ORDER BY maior_venda_individual DESC;


-- ==============================================================================
-- TAREFA 6: Qual é o faturamento total por categoria?
-- ==============================================================================


SELECT categoria, SUM(preco_unitario * quantidade) AS faturamento_categ
FROM vendas 
GROUP BY categoria
ORDER BY faturamento_categ DESC;


-- ==============================================================================
-- TAREFA 7: Qual foi o faturamento total do período?
-- ==============================================================================


SELECT SUM(preco_unitario * quantidade) faturamento_total
FROM vendas;


-- ==============================================================================
-- TAREFA 8: Qual foi o faturamento por dia?
-- ==============================================================================


SELECT data_venda, SUM(preco_unitario * quantidade) AS faturamento_dia
FROM vendas 
GROUP BY data_venda
ORDER BY data_venda;

