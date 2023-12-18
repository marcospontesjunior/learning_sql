/* -- SINTAXE #########################################################################
select coluna_1, coluna_2
from schema_1.tabela_1

union / union all

select coluna_3, coluna_4 
from schema_2.tabela_2 */


-- EXEMPLOS ########################################################################

-- (Exemplo 1) União simples de duas tabelas
-- Una a tabela sales.products com a tabela temp_tables.products_2

SELECT * FROM products
UNION ALL
SELECT * FROM products_2;

