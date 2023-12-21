-- EXEMPLOS ########################################################################

-- (Exemplo 1) Conversão de texto em data

SELECT JULIANDAY('2021-10-01') - JULIANDAY('2021-02-01');

-- (Exemplo 2) Conversão de texto em número

SELECT CAST('100' AS NUMERIC) - CAST('10' AS NUMERIC);

-- (Exemplo 3) Conversão de número em texto

SELECT REPLACE('112122','1','A');
