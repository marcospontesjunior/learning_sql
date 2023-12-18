-- DESAFIO ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers

WITH visit_number AS (
	SELECT 
		customer_id, 
		count(*) AS n_visits
	FROM 
		funnel
	GROUP BY customer_id
)
SELECT
	customers.*,
	n_visits
FROM 
	customers 
LEFT JOIN visit_number  
	ON customers.customer_id = visit_number.customer_id;
    