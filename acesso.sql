-- Autor: Álvaro Pereira
CREATE DATABASE empresaCJ3037916;
GO

-- Habilita o contexto
USE empresaCJ3037916;
GO

-- Cria a tabela
-- CREATE TABLE FUNCIONARIOS(
-- 	ID INT PRIMARY KEY,
-- 	Nome VARCHAR(25) NOT NULL,
-- 	Sexo CHAR(1) NULL,
-- 	Admissao DATE NOT NULL,
-- 	Salario DECIMAL(10,2) NOT NULL
-- );
-- GO

-- Apresenta a tabela
SELECT name
FROM sys.tables;
GO

-- Ajusta o formato das datas

SET DATEFORMAT DMY;
GO

-- insere dados na tabela FUNCIONARIOS

INSERT INTO FUNCIONARIOS (
ID,
Nome,
Sexo,
Admissao,
Salario)
VALUES (3, 'Agnaldo Campestrim', 'M', '23/03/2016', 2548.00);
GO

INSERT INTO FUNCIONARIOS VALUES (5, 'Abner Ferreira', 'M', '05/09/2020', 9531.00);
INSERT INTO FUNCIONARIOS VALUES (6, 'Fabricio Gon�alves', 'M', '26/09/2020', 2631.00);
INSERT INTO FUNCIONARIOS VALUES (7, 'Clarisse Tensor', 'F', '30/03/2020', 6598.00);
INSERT INTO FUNCIONARIOS VALUES (8, 'Luiza Monsenhor', 'F', '04/06/2020', 3265.00);
INSERT INTO FUNCIONARIOS VALUES (9, 'Tamires Helena', 'F', '16/11/2020', 9542.00);
INSERT INTO FUNCIONARIOS VALUES (10, 'Claudia Leite', 'F', '01/09/2020', 7854.00);

-- Exibe o conteudo da tabela FUNCIONARIOS
SELECT * FROM FUNCIONARIOS;
GO

SELECT ID AS 'Código do Funcionário',
        Nome,
        Sexo,
        Salario AS 'Salário'
FROM FUNCIONARIOS;

SELECT * FROM FUNCIONARIOS
WHERE Sexo = 'M'AND
      Salario > 1000;

SELECT * FROM FUNCIONARIOS
ORDER BY Nome;

SELECT * FROM FUNCIONARIOS
WHERE Salario < 3000
ORDER BY Nome,
         Salario DESC;

CREATE TABLE TESTE (
    ID INT,
    Nome CHAR(10)
);

EXEC sp_columns TESTE;

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TESTE';

ALTER TABLE TESTE
    ALTER COLUMN Nome CHAR(50);

ALTER TABLE TESTE
    ADD SEXO CHAR(1) NULL;

ALTER TABLE TESTE 
    ADD DataNascimento DATE,
    Peso DECIMAL(5,2);

SELECT  TABLE_CATALOG    AS 'Banco de dados',
        TABLE_NAME       AS 'Tabela',
        ORDINAL_POSITION AS 'Posição',
        COLUMN_NAME      AS 'Coluna',
        DATA_TYPE        AS 'Tipo de Dados',
        COLLATION_NAME   AS 'Idioma da Coluna',
        IS_NULLABLE      AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TESTE';

ALTER TABLE TESTE
    DROP COLUMN DataNascimento;

ALTER TABLE TESTE
    ADD UNIQUE (Sexo);

ALTER TABLE TESTE
    ALTER COLUMN ID INT NOT NULL;

    ALTER TABLE TESTE 
        ADD CONSTRAINT pk_id PRIMARY KEY (ID);

EXEC sp_helpconstraint TESTE;


SELECT CONSTRAINT_CATALOG AS 'Banco de Dados',
        TABLE_NAME AS 'Nome da Tabela',
        CONSTRAINT_TYPE AS 'Tipo de Restrição',
        CONSTRAINT_NAME AS 'Nome da Restrição'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Teste';

ALTER TABLE TESTE 
    DROP CONSTRAINT pk_id;

DROP TABLE TESTE;

CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sexo CHAR(1) NULL,
    Idade INT CHECK (Idade > 18) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(200) DEFAULT 'meu@email.com' NOT NULL
);

EXEC sp_help 'CLIENTES';

CREATE TABLE #TabelaA (
    ID INT NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Sexo CHAR(1) NULL,
    PRIMARY KEY (ID)
);

INSERT INTO #TabelaA VALUES
    (1, 'Marcelo Augusto', 'M'),
    (2, 'Guaraná Antártica', 'F');



SELECT name
FROM sys.tables;

INSERT INTO #TabelaA
    SELECT  ID,
            Nome,
            Sexo
    FROM FUNCIONARIOS
    WHERE ID > 2;


SELECT  create_date AS 'Data de Criação',
        name        AS 'Nome'
FROM sys.tables;


    