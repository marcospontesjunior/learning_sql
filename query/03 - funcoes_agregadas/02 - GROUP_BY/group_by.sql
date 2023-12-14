/* PARA QUE SERVE ##################################################################

Serve para agrupar registros semelhantes de uma coluna
Normalmente utilizado em conjunto com as Funções de agregação

RESUMO ##########################################################################
(1) Serve para agrupar registros semelhantes de uma coluna, 
(2) Normalmente utilizado em conjunto com as Funções de agregação
(3) Pode-se referenciar a coluna a ser agrupada pela sua posição ordinal 
(ex: GROUP BY 1,2,3 irá agrupar pelas 3 primeiras colunas da tabela) 
(4) O GROUP BY sozinho funciona como um DISTINCT, eliminando linhas duplicadas */

-- EXEMPLOS ########################################################################

.schema

-- (Exemplo 1) Contagem agrupada de uma coluna
-- Calcule o nº de clientes da tabela customers por estado

SELECT state, COUNT(*) AS count
FROM customers
GROUP BY state
ORDER BY count DESC;

-- (Exemplo 2) Contagem agrupada de várias colunas
-- Calcule o nº de clientes por estado e status profissional 

SELECT state, professional_status, COUNT(*) AS count
FROM customers
GROUP BY state, professional_status
ORDER BY state, count DESC;

/* SELECT state, professional_status, COUNT(*) AS count
FROM customers
GROUP BY 1, 2
ORDER BY state, count DESC;

PODE-SE USAR O INDEX DAS COLUNAS MAS
NÃO É RECOMENDADO POIS PREJUDICA A LEGIBILIDADE DA QUERY */

-- (Exemplo 3) Seleção de valores distintos
-- Selecione os estados distintos na tabela customers utilizando o group by

SELECT state FROM customers
GROUP BY state;
