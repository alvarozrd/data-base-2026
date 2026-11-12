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
