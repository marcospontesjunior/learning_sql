/* PARA QUE SERVE ##################################################################

Serve para limitar o nº de linhas da consulta.
Muito utilizado na etapa de exploração dos dados

SINTAXE #########################################################################
select coluna_1, coluna_2, coluna_3
from schema_1.tabela_1
limit N

RESUMO ##########################################################################
(1) Comando utilizado para limitar o nº de linhas da consulta.
(2) Muito utilizado na etapa de exploração dos dados
(3) Muito utilizado em conjunto com o comando ORDER BY quando o que importa são
os TOP N. Ex: "N pagamentos mais recentes", "N produtos mais caros" */

-- EXEMPLOS ########################################################################

.schema

-- (Exemplo 1) Seleção das N primeiras linhas usando LIMIT
-- Liste as 10 primeiras linhas da tabela funnel utilizando o LIMIT

SELECT * FROM funnel
LIMIT 10;

-- (Exemplo 2) Seleção das N primeiras linhas usando LIMIT e ORDER BY
-- Liste os 10 produtos mais caros da tabela products com o comando LIMIT

SELECT * FROM products
ORDER BY price DESC
LIMIT 10;
