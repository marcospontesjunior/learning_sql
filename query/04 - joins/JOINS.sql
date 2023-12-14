/* PARA QUE SERVE ##################################################################

Servem para combinar colunas de uma ou mais tabelas

SINTAXE #########################################################################
select t1.coluna_1, t1.coluna_1, t2.coluna_1, t2.coluna_2
from schema.tabela_1 as t1
ALGUM join schema.tabela_2 as t2
    on condição_de_join

RESUMO ##########################################################################
(1) Servem para combinar colunas de uma ou mais tabelas
(2) Pode-se chamar todas as colunas com o asterisco (*), mas não é recomendado
(3) É uma boa prática criar aliases para nomear as tabelas utilizadas 
(4) O JOIN sozinho funciona como INNER JOIN */

-- EXEMPLOS ########################################################################

SELECT * FROM tabela_1;
SELECT * FROM tabela_2;

-- (Exemplo 1) Utilize o LEFT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

SELECT 
    t1.cpf, 
    t1.name, 
    t2.state
FROM tabela_1 AS t1 
LEFT JOIN tabela_2 AS t2
    ON t1.cpf = t2.cpf;

-- (Exemplo 2) Utilize o INNER JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

SELECT 
    t1.cpf, 
    t1.name, 
    t2.state
FROM tabela_1 AS t1 
INNER JOIN tabela_2 AS t2
    ON t1.cpf = t2.cpf;

-- (Exemplo 3) Utilize o RIGHT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

SELECT 
    t2.cpf, 
    t1.name, 
    t2.state
FROM tabela_1 AS t1 
RIGHT JOIN tabela_2 AS t2
    ON t1.cpf = t2.cpf;

-- (Exemplo 4) Utilize o FULL JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

SELECT 
    t2.cpf, 
    t1.name, 
    t2.state
FROM tabela_1 AS t1 
FULL JOIN tabela_2 AS t2
    ON t1.cpf = t2.cpf;
