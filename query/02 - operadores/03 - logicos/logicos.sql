/* PARA QUE SERVE ##################################################################

Usados para unir expressões simples em uma composta

TIPOS ###########################################################################
AND; OR; NOT; BETWEEN; IN; LIKE; ILIKE; IS NULL

RESUMO ##########################################################################
(1) Usados para unir expressões simples em uma composta
(2) AND: Verifica se duas comparações são simultaneamente verdadeiras
(3) OR: Verifica se uma ou outra comparação é verdadeiras
(4) BETWEEN: Verifica quais valores estão dentro do range definido
(5) IN: Funciona como multiplos ORs
(6) LIKE e ILIKE: Comparam textos e são sempre utilizados em conjunto com o 
operador %, que funciona como um coringa, indicando que qualquer texto pode 
aparecer no lugar do campo
(7) ILIKE ignora se o campo tem letras maiúsculas ou minúsculas na comparação
(8) IS NULL: Verifica se o campo é nulo
(9) Utilize o Guia de comandos para consultar os operadores utilizados no SQL */

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Uso do comando BETWEEN 
-- Selecione veículos que custam entre 100k e 200k na tabela products

/* SELECT * FROM products
WHERE price >= 100000 AND price <= 200000; */

SELECT * FROM products
WHERE price BETWEEN 100000 AND 200000;

-- (Exemplo 2)  Uso do comando NOT
-- Selecione veículos que custam abaixo de 100k ou acima 200k 

/* SELECT * FROM products
WHERE price < 100000 OR price > 200000; */

SELECT * FROM products
WHERE price NOT BETWEEN 100000 AND 200000;

-- (Exemplo 3) Uso do comando IN
-- Selecionar produtos que sejam da marca HONDA, TOYOTA ou RENAULT

/* SELECT * FROM products
WHERE brand = 'HONDA' OR brand = 'TOYOTA' OR brand = 'RENAULT'; */

SELECT * FROM products
WHERE brand IN ('HONDA', 'TOYOTA', 'RENAULT');

-- NOT + IN 
SELECT * FROM products
WHERE brand NOT IN ('HONDA', 'TOYOTA', 'RENAULT'); 

-- (Exemplo 4) Uso do comando LIKE (matchs imperfeitos)
-- Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ANA

/* SELECT DISTINCT first_name FROM customers
WHERE first_name = 'ANA'; */

-- PREFIXO
SELECT DISTINCT first_name FROM customers
WHERE first_name LIKE 'ANA%';

-- SUFIXO
SELECT DISTINCT first_name FROM customers
WHERE first_name LIKE '%ANA';

-- (Exemplo 5) Uso do comando ILIKE (ignora letras maiúsculas e minúsculas)
-- Selecione os primeiros nomes distintos com iniciais 'ana'

/* SELECT DISTINCT first_name FROM customers
WHERE first_name LIKE 'ana%'; */

SELECT DISTINCT first_name FROM customers
WHERE first_name ILIKE 'ana%';

-- (Exemplo 6) Uso do comando IS NULL
-- Selecionar apenas as linhas que contém nulo no campo "population" na tabela
-- temp_tables.regions

SELECT * FROM regions
WHERE population IS NULL;
