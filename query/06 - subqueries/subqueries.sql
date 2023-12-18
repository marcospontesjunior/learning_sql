/* PARA QUE SERVE ##################################################################

Servem para consultar dados de outras consultas.

TIPOS ###########################################################################
Subquery no WHERE
Subquery com WITH
Subquery no FROM
Subquery no SELECT

RESUMO ##########################################################################
(1) Servem para consultar dados de outras consultas.
(2) Para que as subqueries no WHERE e no SELECT funcionem, elas devem retornar 
apenas um único valor
(3) Não é recomendado utilizar subqueries diretamente dentro do FROM pois isso 
dificulta a legibilidade da query. */

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Subquery no WHERE
-- Informe qual é o veículo mais barato da tabela products

SELECT 
    *
FROM 
    products
WHERE price = (SELECT MIN(price) from products);

-- (Exemplo 2) Subquery com WITH
-- Calcule a idade média dos clientes por status profissional

WITH age_query AS (SELECT 
     professional_status,
    (DATE() - birth_date) As age
FROM 
    customers)

SELECT 
    professional_status,
    AVG(age) as avg_age
FROM 
    age_query
GROUP BY professional_status;

-- (Exemplo 3) Subquery no FROM
-- Calcule a média de idades dos clientes por status profissional

SELECT 
    professional_status,
    AVG(age) as avg_age
FROM (
    SELECT 
        professional_status,
        (DATE() - birth_date) As age
    FROM 
        customers
    ) 
GROUP BY professional_status;

-- (Exemplo 4) Subquery no SELECT
-- Na tabela sales.funnel crie uma coluna que informe o nº de visitas acumuladas 
-- que a loja visitada recebeu até o momento

SELECT
    funnel.visit_id,
    funnel.visit_page_date,
    stores.store_name,
    (
        SELECT
            COUNT(*)
        FROM funnel as funnel2
        WHERE funnel2.visit_page_date <= funnel.visit_page_date
            AND funnel2.visit_page_date = funnel.store_id
    ) AS accumulated_visit
FROM
    funnel
LEFT JOIN stores
    ON funnel.store_id = stores.store_id
ORDER BY stores.store_name, funnel.visit_page_date;