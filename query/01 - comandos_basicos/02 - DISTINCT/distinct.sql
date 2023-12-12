/* PARA QUE SERVE ##################################################################

Serve para remover linhas duplicadas e mostrar apenas linhas distintas
Muito usado na etapa de exploração das bases 


SINTAXE #########################################################################
select distinct coluna_1, coluna_2, coluna_3
from schema_1.tabela_1

RESUMO ##########################################################################
(1) Comando usado para remover linhas duplicadas e mostrar apenas linhas distintas
(2) Muito utilizado na etapa de exploração dos dados
(3) Caso mais de uma coluna seja selecionada, o comando SELECT DISTINCT irá 
retornar todas as combinações distintas. */

-- EXEMPLOS ########################################################################

.schema

-- (Exemplo 1) Seleção de uma coluna sem DISTINCT
-- Liste as marcas de carro que constam na tabela products

SELECT brand FROM products;

-- (Exemplo 2) Seleção de uma coluna com DISTINCT
-- Liste as marcas de carro distintas que constam na tabela products

SELECT DISTINCT brand FROM products; 

-- (Exemplo 3) Seleção de mais de uma coluna com DISTINCT
-- Liste as marcas e anos de modelo distintos que constam na tabela products

SELECT DISTINCT brand, model_year FROM products;
