/* TIPOS ###########################################################################
CASE WHEN
COALESCE()

RESUMO ##########################################################################
(1) CASE WHEN é o comando utilizado para criar respostas específicas para 
diferentes condições e é muito utilizado para fazer agrupamento de dados
(2) COALESCE é o comando utilizado para preencher campos nulos com o primeiro
valor não nulo de uma sequência de valores. */

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Agrupamento de dados com CASE WHEN
-- Calcule o nº de clientes que ganham abaixo de 5k, entre 5k e 10k, entre 10k e 
-- 15k e acima de 15k

WITH faixa_de_renda AS (
    SELECT  
        income,
        CASE
            WHEN income < 5000 THEN '0-5000'
            WHEN income >= 5000 AND income < 10000 THEN '5000-10000'
            WHEN income >= 10000 AND income < 15000 THEN '10000-15000'
            ELSE '15000+'
        END AS faixa_renda
    FROM customers    
)

SELECT
    faixa_renda,
    COUNT(*)
FROM
    faixa_de_renda
GROUP BY faixa_renda;

-- (Exemplo 2) Tratamento de dados nulos com COALESCE
-- Crie uma coluna chamada populacao_ajustada na tabela temp_tables.regions e
-- preencha com os dados da coluna population, mas caso esse campo estiver nulo, 
-- preencha com a população média (geral) das cidades do Brasil

/* SELECT 
    *,
    CASE 
        WHEN population IS NOT NULL THEN population
        ELSE (SELECT AVG(population) FROM regions)
    END AS populacao_ajustada
FROM regions
WHERE population IS NULL; */

SELECT 
    *,
    COALESCE(population, 
        (SELECT AVG(population) FROM regions)
    ) AS populacao_ajustada
FROM regions
WHERE population IS NULL;
