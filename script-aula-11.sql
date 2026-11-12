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

