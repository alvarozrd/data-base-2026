-- Cria o banco de dados LojaIFSP


CREATE DATABASE LojaIFSP;
GO

USE LojaIFSP;
GO

-- Verifica se o banco LojaIFSP ainda nao existe.
-- Se nao existir, ele sera criado.

IF DB_ID(N'LojaIFSP') IS NULL
    CREATE DATABASE LojaIFSP;
GO

-- Seleciona o banco de dados LojaIFSP.
USE LojaIFSP;
GO

-- CRIACAO DA TABELA CLIENTES

-- CREATE TABLE CLIENTES (
--     ID INT PRIMARY KEY,
--     Nome VARCHAR(50) NOT NULL,
--     Sexo CHAR(1) NULL,
--     Idade INT CHECK (Idade > 18) NOT NULL,
--     CPF CHAR(11) UNIQUE NOT NULL,
--     Email VARCHAR(200) DEFAULT 'meu@email.com' NOT NULL
-- );

-- Explicacao das restricoes:

-- PRIMARY KEY: o ID identifica cada cliente. Nao pode repetir nem ser nulo.
-- NOT NULL: a coluna deve obrigatoriamente receber um valor.
-- NULL: a coluna pode ficar sem valor.
-- CHECK (Idade > 18): somente aceita clientes com mais de 18 anos.
-- UNIQUE: impede que dois clientes tenham o mesmo CPF.
-- DEFAULT: insere 'meu@email.com' quando o e-mail nao for informado.

-- INSERCAO DOS REGISTROS VALIDOS

INSERT INTO CLIENTES VALUES
    (1, 'Ana Cristina', 'F', 20, '11111111111', 'ana@gmail.com');
GO

-- Erro por repetir a mesma chave primaria

INSERT INTO CLIENTES VALUES 
    (1, 'Marcos Paulo', 'M', 45, '22222222222', 'marcos@gmail.com');
GO

INSERT INTO CLIENTES VALUES
    (3, 'André Luis', 'M', 15, '33333333333', 'andre@gmail.com');
GO

INSERT INTO CLIENTES VALUES
    (4, 'Maria Clara', NULL, 22, '44444444444', 'maria@gmail.com');
GO

-- Erro, devido ao valor repetido do CPF
INSERT INTO CLIENTES VALUES 
    (5, 'Pedro Augusto', 'M', 45, '11111111111', 'pedro@gmail.com');
GO

-- Erro, devido ao valor do CPF nulo
INSERT INTO CLIENTES VALUES
    (6, 'Ricardo Lima', 'M', 52, NULL, 'ricardo@gmail.com');
GO

-- Erro, devido ao valor da chave primaria ser nulo
INSERT INTO CLIENTES VALUES
    (NULL, 'José Pereira', 'M', 45, '77777777777', 'jose@gmail.com');
GO

-- O e-mail foi omitido. O banco usara o valor DEFAULT.
INSERT INTO CLIENTES VALUES 
    (9, 'Daphne Lima', 'F', 32, '99999999999');
GO

-- Exibe todos os registros da tabela
SELECT * FROM CLIENTES;
GO

-- Insere os registros com correção

-- Insercao dos registros que foram corrigidos.
INSERT INTO CLIENTES VALUES
    (2, 'Marcos Paulo', 'M', 45, '22222222222', 'marcos@gmail.com'),
    (3, 'Andre Luis', 'M', 25, '33333333333', 'andre@gmail.com'),
    (5, 'Pedro Augusto', 'M', 45, '55555555555', 'pedro@gmail.com'),
    (6, 'Ricardo Lima', 'M', 52, '66666666666', 'ricardo@gmail.com'),
    (7, 'Jose Pereira', 'M', 45, '77777777777', 'marcos@gmail.com'),
    (8, 'Marcelo Souza', 'M', 56, '88888888888', 'marcelo@gmail.com'),
    (10, 'Sheila Pereira', NULL, 21, '10101010101', 'sheila@yahoo.com.br'),
    (11, 'Tiago Augusto', NULL, 72, '20202020202', 'tiago@yahoo.com.br'),
    (12, 'Maria Pereira', 'F', 45, '30303030303', 'maria@bol.com.br');
GO

-- Estes clientes nao receberam e-mail.
-- O SQL Server preenchera o campo com 'meu@email.com'.
INSERT INTO CLIENTES (ID, Nome, Sexo, Idade, CPF) VALUES
    (13, 'Lucas Silva', 'M', 19, '40404040404'),
    (14, 'Benedito Silva', NULL, 44, '50505050505'),
    (15, 'Fernanda Pereira', 'F', 31, '60606060606');
GO

-- Exibe todos os registros da tabela
SELECT * FROM CLIENTES;
GO

-- Exibe informações sobre a estrutura da tabela
SELECT TABLE_CATALOG        AS 'Banco de Dados',
       TABLE_NAME           AS 'Tabela',
       ORDINAL_POSITION     AS 'Posição',
       COLUMN_NAME          AS 'Coluna',
       DATA_TYPE            AS 'Tipo de Dados',
       COLLATION_NAME       AS 'Idioma da Coluna',
       IS_NULLABLE          AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CLIENTES';
GO 

-- Exibe informações sobre as restrições da tabela
SELECT CONSTRAINT_CATALOG   AS 'Banco de Dados',
       TABLE_NAME           AS 'Tabela',
       CONSTRAINT_TYPE      AS 'Tipo de Restrição',
       CONSTRAINT_NAME      AS 'Nome da Restrição'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'CLIENTES';
GO

-- Verifica a estrutura da tabela, utilizando o comando
-- SP_HELP
EXEC sp_help 'CLIENTES';
GO

-- QUESTAO 1

-- Enunciado resumido:
-- Exibir todos os registros e todos os dados dos clientes cadastrados.

-- Resposta:

SELECT * FROM CLIENTES;
GO

-- Explicacao:
-- SELECT realiza a consulta. O asterisco (*) solicita todas as colunas e
-- FROM CLIENTES informa de qual tabela os dados serao obtidos.

-- QUESTAO 2

-- Enunciado resumido:
-- Exibir todos os dados dos clientes em ordem alfabetica pelo nome.

-- Resposta:

SELECT * FROM CLIENTES
ORDER BY Nome ASC;

-- Explicacao:
-- ORDER BY Nome organiza o resultado pelo nome. ASC representa a ordem
-- crescente e, para textos, corresponde a ordem alfabetica de A ate Z.
-- O ASC poderia ser omitido porque e a ordenacao padrao do SQL Server.

-- QUESTÃO 3 

-- Enunciado resumido:
-- Exibir todos os dados dos clientes em ordem crescente de idade.

-- Resposta:

SELECT * FROM CLIENTES
ORDER BY Idade ASC;

-- Explicacao:
-- Os clientes mais novos aparecerao antes dos clientes mais 
-- velhos.

-- QUESTÃO 4
-- Enunciado resumido:
-- Exibir todos os dados dos clientes, apresentando os mais velhos primeiro.

-- Resposta:

SELECT * FROM CLIENTES
ORDER BY Idade DESC;

-- Explicacao:
-- DESC significa ordem decrescente. Assim, a maior idade 
-- aparece primeiro.

-- QUESTÃO 5

-- Enunciado resumido:
-- Ordenar por sexo e idade, fazendo os clientes do sexo masculino
-- aparecerem primeiro.

-- Resposta:

SELECT * FROM CLIENTES
ORDER BY
    CASE
        WHEN Sexo = 'M' THEN 1
        WHEN Sexo = 'F' THEN 2
        ELSE 3
    END,
    Idade ASC;

-- Explicacao:
-- O CASE cria uma ordem para os grupos sem alterar a tabela:

-- Sexo masculino ('M') recebe a posicao 1;
-- Sexo feminino ('F') recebe a posicao 2;
-- Sexo nao informado (NULL) recebe a posicao 3.

-- Depois de separar os clientes por sexo, Idade ASC organiza as pessoas de
-- cada grupo da menor para a maior idade.


-- QUESTAO 6

-- Enunciado resumido:
-- Exibir somente o nome, a idade e o e-mail de todos os clientes.

-- Resposta:

SELECT Nome, Idade, Email
FROM CLIENTES;

-- Explicacao:
-- Como a questao pede colunas especificas, seus nomes sao escritos depois
-- do SELECT, separados por virgulas. Nao se utiliza o asterisco.


-- QUESTAO 7

-- Enunciado resumido:
-- Exibir nome, idade e e-mail dos clientes, em ordem alfabetica pelo nome.

-- Resposta:

SELECT Nome, Idade, Email
FROM CLIENTES
ORDER BY Nome ASC;

-- Explicacao:
-- O SELECT escolhe somente as tres colunas solicitadas. O ORDER BY organiza
-- os registros pelo nome, de A ate Z.


-- QUESTAO 8

-- Enunciado resumido:
-- Exibir ID, nome, idade e e-mail dos clientes cujo ID seja maior ou igual
-- a 10. A coluna ID deve aparecer com o titulo "Codigo do Cliente".

-- Resposta:

SELECT
    ID AS 'Codigo do Cliente',
    Nome,
    Idade,
    Email
FROM CLIENTES
WHERE ID >= 10;

-- Explicacao:
-- WHERE ID >= 10 filtra os registros e aceita somente IDs iguais ou
-- superiores a 10. AS cria um alias, isto e, um titulo temporario para a
-- coluna no resultado. O nome verdadeiro da coluna continua sendo ID.


-- QUESTAO 9

-- Enunciado resumido:
-- Ordenar os clientes pelo nome e retornar somente os cinco primeiros.
-- Exibir ID, nome, idade e e-mail, usando "Codigo do Cliente" no lugar de ID.

-- Resposta:

SELECT TOP 5
    ID AS 'Codigo do Cliente',
    Nome,
    Idade,
    Email
FROM CLIENTES
ORDER BY Nome ASC;

-- Explicacao:
-- ORDER BY Nome ASC coloca os clientes em ordem alfabetica. TOP 5 limita o
-- resultado aos cinco primeiros registros dessa ordenacao. TOP e utilizado
-- pelo Microsoft SQL Server.


-- QUESTAO 10

-- Enunciado resumido:
-- Exibir os clientes do sexo masculino que possuem mais de 30 anos,
-- ordenados pelo nome. Mostrar ID, nome, sexo, idade e e-mail. Utilizar os
-- aliases "Codigo do Cliente" e "E-mail".

-- Resposta:

SELECT
    ID AS 'Codigo do Cliente',
    Nome,
    Sexo,
    Idade,
    Email AS 'E-mail'
FROM CLIENTES
WHERE Idade > 30
  AND Sexo = 'M'
ORDER BY Nome ASC;

-- Explicacao:
-- WHERE define os filtros da consulta. O operador AND exige que as duas
-- condicoes sejam verdadeiras ao mesmo tempo:

--  o cliente deve possuir mais de 30 anos;
-- o sexo do cliente deve ser masculino ('M').

-- ORDER BY Nome ASC apresenta o resultado em ordem alfabetica.