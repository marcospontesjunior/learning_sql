-- Exemplos ########################################################################

-- (Exemplo 1) Identifique qual é o status profissional mais frequente nos clientes 
-- que compraram automóveis no site

SELECT 
    customers.professional_status,
    COUNT(funnel.paid_date) AS payment
FROM funnel 
LEFT JOIN customers
    ON funnel.customer_id = customers.customer_id
 GROUP BY customers.professional_status
 ORDER BY payment DESC;   

-- (Exemplo 2) Identifique qual é o gênero mais frequente nos clientes que compraram
-- automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders

SELECT 
    ibge.gender,
    COUNT(funnel.paid_date)
FROM funnel
LEFT JOIN customers
    ON funnel.customer_id = customers.customer_id
LEFT JOIN ibge_genders AS ibge
    ON LOWER(customers.first_name) = ibge.first_name
GROUP BY ibge.gender;

-- (Exemplo 3) Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions

SELECT
    regions.region,
    COUNT(funnel.visit_page_date) AS visits
FROM funnel
LEFT JOIN customers
    ON funnel.customer_id = customers.customer_id
LEFT JOIN regions
    ON LOWER(customers.city) = LOWER(regions.city)
    AND LOWER(customers.state) = LOWER(regions.state)
GROUP BY regions.region
ORDER BY visits DESC; 
