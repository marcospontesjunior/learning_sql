-- EXEMPLOS ########################################################################

-- (Exemplo 1) Análise de recorrência dos leads
-- Calcule o volume de visitas por dia ao site separado por 1ª visita e demais visitas

WITH first_visit AS (
    SELECT
        customer_id,
        min(visit_page_date) as visit_1
    FROM 
        funnel 
    GROUP BY customer_id
)
SELECT 
    funnel.visit_page_date,
    (funnel.visit_page_date <> first_visit.visit_1) as lead_recorrente,
    COUNT(*)
FROM funnel 
left join first_visit
    on funnel.customer_id = first_visit.customer_id
GROUP BY funnel.visit_page_date, lead_recorrente
ORDER BY funnel.visit_page_date DESC, lead_recorrente;

-- (Exemplo 2) Análise do preço versus o preço médio
-- Calcule, para cada visita ao site, quanto o preço do um veículo visitado pelo cliente
-- estava acima ou abaixo do preço médio dos veículos daquela marca 
-- (levar em consideração o desconto dado no veículo)

WITH ticket_avg AS (
    SELECT
        brand,
        AVG(price) AS price_avg_brand
    FROM
        products
    GROUP BY
        brand
)
SELECT
    funnel.visit_id,
    funnel.visit_page_date,
    products.brand,
    (products.price * (1 + funnel.discount)) AS final_price,
    ticket_avg.price_avg_brand,
    ((products.price * (1 + funnel.discount)) - ticket_avg.price_avg_brand) AS price_x_avg
FROM
    funnel
LEFT JOIN products
    ON funnel.product_id = products.product_id
LEFT JOIN ticket_avg
    ON products.brand = price_avg_brand;
