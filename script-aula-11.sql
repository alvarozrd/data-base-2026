USE INTERCAMBIO_alp
GO


-- cria a tabela AERONAVES
CREATE TABLE AERONAVES ( 
    CodAeronave INT IDENTITY PRIMARY KEY,
    Modelo VARCHAR(50) NOT NULl
);
GO

-- insere algumas aeronaves
INSERT INTO AERONAVES VALUES
    ('Boeing 707'),
    ('Boeing 737'),
    ('Boeing 747'),
    ('Embraer ERJ-145'),
    ('Vickers VC-10');
GO

-- Exibe os dados das aeronaves

SELECT * FROM AERONAVES;
GO

-- Tentar inserir passando um valor para o CodAeronave

INSERT INTO AERONAVES (CodAeronave, Modelo) VALUES
    (6, 'Airbus A300');
GO

-- Permite inserir valores explícitos na coluna
-- de identidade de uma tabela

SET IDENTITY_INSERT AERONAVES ON;
GO

INSERT INTO AERONAVES (CodAeronave, Modelo) VALUES
    (6, 'Airbus A300');
GO

SELECT * FROM AERONAVES;
GO

-- altera o valor de IDENTITY_INSERT

SET IDENTITY_INSERT AERONAVES OFF;
GO

-- cria a tabela VEICULOS
-- utiliza o Idetity iniciando em 1 e incrementando em 10
CREATE TABLE VEICULOS (
    Codigo INT IDENTITY(1, 10) PRIMARY KEY,
    Modelo VARCHAR(50) NOT NULL
);
GO

-- insere valores em VEICULOS

INSERT INTO VEICULOS VALUES
    ('Ferrari'),
    ('Camaro'),
    ('Fusca');
GO

-- Exibe os dados 

SELECT * FROM VEICULOS;
GO

-- Exibe o valor do incremento utilizado
SELECT  IDENT_INCR('AERONAVES') As 'Inc. AERONAVES',
        IDENT_INCR('VEICULOS')  AS 'Inc. VEICULOS';
GO

-- Exibindo o último valor de IDENTITY que foi utilizado 

SELECT  @@IDENTITY                  AS 'Último IDENTITY',
        IDENT_CURRENT('VEICULOS')   AS 'IDENTITY (VEICULOS)',
        IDENT_CURRENT('AERONAVES')  AS 'IDENTITY (AERONAVES)';
GO


-- Cria uma sequência que começa com 1 e com incremento 1 
CREATE SEQUENCE Incrementa1 AS INT
    START WITH 1
    INCREMENT BY 1;
GO

-- Cria uma sequência que começa com 10 e com incremento 100
CREATE SEQUENCE Incrementa100 AS INT
    START WITH 10
    INCREMENT BY 100;
GO

-- Cria uma sequência que começa com 10 e com incremento 100
CREATE SEQUENCE Incrementa1000 AS INT
    START WITH 1000
    INCREMENT BY -100;
GO

-- Exibe informações sobre as sequências

SELECT name as 'Nome',
    create_date         AS 'Data de Criação',
    start_value         AS 'Valor Inicial',
    increment           AS 'Incremento',
    minimum_value       AS 'Valor Minímo',
    maximum_value       AS 'Valor Máximo',
    current_value       AS 'Valor Atual'
FROM sys.sequences;
GO

-- Criando uma sequência com mais parâmetros 

CREATE SEQUENCE IncrementaDecimal AS DECIMAL(3,0)
    START WITH 125
    INCREMENT BY 25
    MINVALUE 100
    MAXVALUE 200
    CYCLE
    CACHE 3;
GO


-- Exibe o primeiro valor das sequências

SELECT  NEXT VALUE FOR Incrementa1               AS 'Incrementa1',
        NEXT VALUE FOR Incrementa100             AS 'Incrementa100',
        NEXT VALUE FOR Incrementa1000            AS 'Incrementa1000',
        NEXT VALUE FOR IncrementaDecimal         AS 'IncrementaDecimal';
GO

-- Cria uma tabela temporária, para ilustrar a utilização das sequências
CREATE TABLE #TestaSequencia (
    ID      INT,
    Nome    CHAR(20)
);
GO

-- Reinicia o valor da sequência Incrementa100
ALTER SEQUENCE Incrementa100
    RESTART WITH 10;
GO

-- Utiliza a sequência INCREMENTA100 para 
-- inserir valores na tabela #TestaSequencia
INSERT INTO #TestaSequencia (ID, Nome) VALUES
    (NEXT VALUE FOR Incrementa100, 'Ana'),
    (NEXT VALUE FOR Incrementa100, 'Maria'),
    (NEXT VALUE FOR Incrementa100, 'João');
GO

-- Exibe os valores da tabela #TestaSequência
SELECT * FROM #TestaSequencia;
GO


-- Recuperando o valor atual de uma sequência 
SELECT current_value        AS      'Valor Atual'
    FROM sys.sequences
    WHERE name = 'Incrementa100';
GO

-- Remove a sequência Incrementa100
DROP SEQUENCE Incrementa100;
GO

-- Tenta inserir um registro utilizando uma sequência INCREMENTA100
INSERT INTO #TestaSequencia (ID, Nome) VALUES
    (NEXT VALUE FOR Incrementa100, 'José');
GO
-- Declara uma variável e atribui um valor com SET
DECLARE @nome VARCHAR(100);
SET @nome = 'Carlos Pereira';

-- Utiliza a variável em uma consulta
SELECT  CodAluno    AS 'Código',
        NomeAluno   AS 'Nome do Aluno',
        Endereco    AS 'Endereço'
FROM ALUNOS
WHERE NomeAluno LIKE @nome;
GO

-- Atribui um valor à variável durante a declaração
DECLARE @nome VARCHAR(100) = 'Carlos Pereira';

-- Utiliza a variável em uma consulta
SELECT  CodAluno    AS 'Código',
        NomeAluno   AS 'Nome do Aluno',
        Endereco    AS 'Endereço'
FROM ALUNOS
WHERE NomeAluno LIKE @nome;
GO

-- Armazena o total de viagens em uma variável
DECLARE @totalViagens INT = (SELECT COUNT(*) FROM VIAGENS);

SELECT @totalViagens AS 'Total de Viagens';
GO

-- Verifica se um número é par ou ímpar
DECLARE @numero INT = 10;

IF ((@numero % 2) = 0)
    PRINT 'O número ' + CAST(@numero AS VARCHAR) + ' é par!';
ELSE
    PRINT 'O número ' + CAST(@numero AS VARCHAR) + ' é ímpar!';
GO
