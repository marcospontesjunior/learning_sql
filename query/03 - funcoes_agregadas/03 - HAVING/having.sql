/* PARA QUE SERVE ##################################################################

Serve para filtrar linhas da seleção por uma coluna agrupada

RESUMO ##########################################################################
(1) Tem a mesma função do WHERE mas pode ser usado para filtrar os resultados 
das funções agregadas enquanto o WHERE possui essa limitação
(2) A função HAVING também pode filtrar colunas não agregadas */

-- EXEMPLOS ########################################################################

-- (Exemplo 1) seleção com filtro no HAVING 
-- Calcule o nº de clientes por estado filtrando apenas estados acima de 100 clientes

SELECT 
    state, 
    COUNT(*)
FROM customers
GROUP BY state
HAVING COUNT(*) >= 100;

-- (Exemplo 2)

SELECT 
    state, 
    COUNT(*)
FROM customers
WHERE state <> 'MT'
GROUP BY state
HAVING COUNT(*) >= 100;

SELECT 
    state, 
    COUNT(*)
FROM customers
GROUP BY state
HAVING 
    COUNT(*) >= 100 AND state <> 'MT';
