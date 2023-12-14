/* PARA QUE SERVE ##################################################################

Servem para executar operações aritmética nos registros de uma coluna 

TIPOS DE FUNÇÕES AGREGADAS ######################################################
COUNT()
SUM()
MIN()
MAX()
AVG()

RESUMO ##########################################################################
(1) Servem para executar operações aritmética nos registros de uma coluna 
(2) Funções agregadas não computam células vazias (NULL) como zero
(3) Na função COUNT() pode-se utilizar o asterisco (*) para contar os registros
(4) COUNT(DISTINCT ) irá contar apenas os valores exclusivos */

-- EXEMPLOS ########################################################################

.tables
.schema

-- COUNT() -------------------------------------------------------------------------

-- (Exemplo 1) Contagem de todas as linhas de uma tabela
-- Conte todas as visitas realizadas ao site da empresa fictícia

SELECT COUNT(*) FROM funnel;

-- (Exemplo 2) Contagem das linhas de uma coluna
-- Conte todos os pagamentos registrados na tabela sales.funnel 

SELECT COUNT(paid_date) FROM funnel;

-- (Exemplo 3) Contagem distinta de uma coluna
-- Conte todos os produtos distintos visitados em jan/21

SELECT COUNT(DISTINCT product_id)
FROM funnel
WHERE visit_page_date BETWEEN '2021-01-01' AND '2021-01-31';

-- OUTRAS FUNÇÕES ------------------------------------------------------------------

-- (Exemplo 4) Calcule o preço mínimo, máximo e médio dos productos da tabela products

SELECT 
    MIN(price), 
    MAX(price),
    AVG(PRICE)
FROM products;

-- (Exemplo 5) Informe qual é o veículo mais caro da tabela products

SELECT * FROM products
WHERE price = (SELECT MAX(price) FROM products); 
