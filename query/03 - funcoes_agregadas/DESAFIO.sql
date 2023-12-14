-- DESAFIO ########################################################################

.schema

-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos

SELECT 
    (DATE() - birth_date) AS age,
    COUNT(*) AS count
FROM customers
GROUP BY age
HAVING age < 30;

-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers

SELECT 
    MAX((DATE() - birth_date)) AS max_age,
    MIN((DATE() - birth_date)) AS min_age
FROM customers;

-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)

SELECT * FROM customers
WHERE income = (SELECT MAX(income) FROM customers);

-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca

SELECT
    brand,
    COUNT(*) AS count
FROM products
GROUP BY brand;

-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo

SELECT 
    brand,
    model_year,
    COUNT(product_id) AS count
FROM products
GROUP BY brand, model_year;

-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados

SELECT 
    brand,
    COUNT(brand) AS count
FROM products
GROUP BY brand
HAVING 
    count >= 10;