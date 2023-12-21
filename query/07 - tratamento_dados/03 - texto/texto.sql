/* TIPOS ###########################################################################
LOWER()
UPPER()
TRIM()
REPLACE()

RESUMO ##########################################################################
(1) LOWER() é utilizado para transformar todo texto em letras minúsculas
(2) UPPER() é utilizado para transformar todo texto em letras maiúsculas
(3) TRIM() é utilizado para remover os espaços das extremidades de um texto
(4) REPLACE() é utilizado para substituir uma string por outra string */

-- EXEMPLOS ########################################################################

-- (Exemplo 1) Corrija o primeiro elemento das queries abaixo utilizando os comandos 
-- de tratamento de texto para que o resultado seja sempre TRUE 

SELECT UPPER('Sao Paulo') = 'SAO PAULO';

SELECT LOWER('São Paulo') = 'são paulo';

SELECT TRIM('SÃO PAULO     ') = 'SÃO PAULO';

SELECT REPLACE('SAO PAULO', 'SAO', 'SÃO') = 'SÃO PAULO';
