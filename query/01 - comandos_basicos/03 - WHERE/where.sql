/* PARA QUE SERVE ##################################################################

Serve para filtrar linhas de acordo com uma condição

SINTAXE #########################################################################
select coluna_1, coluna_2, coluna_3
from schema_1.tabela_1
where condição_x=true

RESUMO ##########################################################################
(1) Comando utilizado para filtrar linhas de acordo com uma condição
(2) No PostgreSQL são utilizadas aspas simples para delimitar strings 
(3) string = sequência de caracteres = texto
(4) Pode-se combinar mais de uma condição utilizando os operadores lógicos
(5) No PostgreSQL as datas são escritas no formato 'YYYY-MM-DD' ou 'YYYYMMDD' */

-- EXEMPLOS ########################################################################

.schema

-- (Exemplo 1) Filtro com condição única
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina

SELECT email, state FROM customers
WHERE state = 'SC';

-- (Exemplo 2) Filtro com mais de uma condição
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul

SELECT email, state FROM customers
WHERE state = 'SC' OR state = 'MT'; 

-- (Exemplo 3) Filtro de condição com data
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos

SELECT email, state, birth_date FROM customers
WHERE (state = 'SC' OR state = 'MT') AND birth_date < '1993-12-12'
