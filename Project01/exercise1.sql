--Criação Banco de Dados
CREATE SCHEMA `cap02` ;

--Criação Tabela
CREATE TABLE `cap02`.`tb_navios` (
  `nome_navio` VARCHAR(50) NULL,
  `mes_ano` VARCHAR(10) NULL,
  `classificacao_risco` VARCHAR(15) NULL,
  `indice_conformidade` VARCHAR(15) NULL,
  `pontuacao_risco` INT NULL,
  `temporada` VARCHAR(200) NULL);

--Carregando dados para a tablea
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dados_navio.csv' 
INTO TABLE cap02.tb_navios 
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--Quais embarcações possuem pontuação de risco igual a 310?
SELECT nome_navio, pontuacao_risco
FROM cap02.tb_navios 
WHERE pontuacao_risco = 10
ORDER BY pontuacao_risco;

--Quais embarcações têm classificação de risco A e índice de conformidade maior ou igual a 95%?
SELECT nome_navio, classificacao_risco, indice_conformidade
FROM cap02.tb_navios 
WHERE classificacao_risco = 'A' AND indice_conformidade > 95
ORDER BY indice_conformidade;

--Quais embarcações têm classificação de risco C ou D e índice de conformidade menor ou igual a 95%?
SELECT nome_navio, classificacao_risco, indice_conformidade
FROM cap02.tb_navios 
WHERE classificacao_risco in ('A', 'B') AND indice_conformidade < 95
ORDER BY indice_conformidade;

--Quais embarcações têm classificação de risco A ou pontuação de risco igual a 0?
SELECT nome_navio, classificacao_risco, pontuacao_risco
FROM cap02.tb_navios
WHERE classificacao_risco = 'A' OR pontuacao_risco = 0
ORDER BY pontuacao_risco, nome_navio;

--Quais embarcações foram inspecionadas em Dezembro de 2016?
SELECT nome_navio, mes_ano, classificacao_risco, pontuacao_risco
FROM cap02.tb_navios
WHERE mes_ano = '12/2016'
ORDER BY nome_navio;