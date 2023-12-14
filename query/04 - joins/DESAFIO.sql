-- DESAFIO ########################################################################

.schema

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel

SELECT
    products.brand,
    COUNT(*) AS visits
FROM funnel
LEFT JOIN products
    ON funnel.product_id = products.product_id
GROUP BY products.brand
ORDER BY visits DESC;

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel

SELECT
    stores.store_name,
    COUNT(*) AS visits
FROM funnel
LEFT JOIN stores
    ON funnel.store_id = stores.store_id
GROUP BY stores.store_name
ORDER BY visits DESC;

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)

SELECT
    regions.size,
    COUNT(*) AS count_customers
FROM customers
LEFT JOIN regions
    ON LOWER(customers.city) = LOWER(regions.city)
    AND LOWER(customers.state) = LOWER(regions.state)
GROUP BY regions.size
ORDER BY count_customers DESC;

/* a junção nas colunas city e state é necessária para garantir a correspondência correta entre 
as tabelas e evitar confusões causadas por cidades com nomes duplicados em diferentes estados.*/
