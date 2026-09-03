USE empresaCJ3037916;

SELECT * FROM FUNCIONARIOS
WHERE Sexo != 'M';


SELECT * FROM FUNCIONARIOS
WHERE Sexo <> 'M';


SELECT * FROM FUNCIONARIOS
WHERE NOT Sexo = 'M';


SELECT * FROM FUNCIONARIOS
WHERE Salario >= 1000 AND
      Salario <= 2000;


SELECT * FROM FUNCIONARIOS
WHERE Salario BETWEEN 1000 AND 2000;


SELECT * FROM FUNCIONARIOS
WHERE Telefone IS NULL;


SELECT * FROM FUNCIONARIOS
WHERE Telefone IS NOT NULL;


IF EXISTS (
    SELECT * FROM FUNCIONARIOS
    WHERE Salario > 30000
)
    PRINT 'Alguém recebe acima de R$ 30.000,00'
ELSE 
    PRINT 'Ninguém recebe acima de R$ 30.000,00';


SELECT * FROM FUNCIONARIOS
WHERE   ID = 1 OR
        ID = 2 OR 
        ID = 5;


SELECT * FROM FUNCIONARIOS
WHERE ID IN (1, 2, 5);

SELECT * FROM FUNCIONARIOS 
WHERE Salario IN (
    SELECT Salario
    FROM FUNCIONARIOS
    WHERE Salario > 2000.00
);

SELECT * FROM FUNCIONARIOS 
WHERE Nome LIKE 'M%';

-- to upper!
SELECT * FROM FUNCIONARIOS
WHERE UPPER(Nome) Like '%CAMPESTRIM'
ORDER BY Nome;

SELECT * FROM FUNCIONARIOS 
WHERE Nome LIKE '[^A]%'
ORDER BY Nome;

GO

CREATE VIEW MaioresSalarios AS  
    SELECT ID AS 'Código do Funcionário',
           Nome,
           Sexo,
           Salario AS 'Salário'
    FROM FUNCIONARIOS;

GO

SELECT * FROM MaioresSalarios;
SELECT  [Código do Funcionário],
        Nome,
        [Salário]
FROM MaioresSalarios;

GO

ALTER VIEW MaioresSalarios AS 
    SELECT ID AS [Código do Funcionário],
           Nome, 
           Sexo AS [Sexo do funcionário],
           Salario AS [Salário]
    FROM FUNCIONARIOS
GO

SELECT * FROM MaioresSalarios
ORDER BY [Salário] DESC;
