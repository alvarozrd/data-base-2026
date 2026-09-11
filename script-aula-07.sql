use empresaCJ3037916;

CREATE TABLE DEPENDENTES (
    CodDependentes INT PRIMARY KEY,
    Nome VARCHAR(35) NOT NULL,
    Sexo CHAR(1) NULL,
    DataNascimento DATE NOT NULL,
    ID INT FOREIGN KEY REFERENCES
FUNCIONARIOS (ID)
);

SELECT * FROM DEPENDENTES;

SET DATEFORMAT YMD;

BULK INSERT DEPENDENTES
    FROM '/dados/dependentes.csv'
WITH(
    FIRSTROW = 2,
    DATAFILETYPE = 'widechar',
    FIELDTERMINATOR = ','
);

SELECT * FROM DEPENDENTES;
SELECT * FROM FUNCIONARIOS;

-- sintaxe mais antiga
SELECT *
FROM FUNCIONARIOS, DEPENDENTES;


-- sintaxe utilizando CROSS JOIN 
SELECT * 
FROM FUNCIONARIOS CROSS JOIN 
DEPENDENTES;

-- nomeando cada tabela
SELECT  F.ID                AS 'Código do Funcionário',
        F.Nome              AS 'Nome do Funcionário',
        D.Nome              AS 'Nome do Depependente',
        D.DataNascimento    AS 'Data de Nascimento'
FROM FUNCIONARIOS F CROSS JOIN DEPENDENTES D;


-- exibe somente o registro do funcionário que possuí algum dependente
SELECT 
    F.ID        AS 'Código do Funcionário',
    F.Nome      AS 'Nome do Funcionário',
    F.Salario   AS 'Salário',
    D.Nome      AS 'Nome do Dependente',
    D.ID        AS 'Código do Responsável'
FROM FUNCIONARIOS F JOIN DEPENDENTES D
    ON F.ID = D.ID;


-- apenas aqueles que nasceram depois de 2000's
SELECT 
    F.ID                AS 'Código do Funcionário',
    F.Nome              AS 'Nome do Funcionário',
    F.Salario           AS 'Salário',
    D.Nome              AS 'Nome do Dependente',
    D.DataNascimento    AS 'Data de Nascimento',
    D.ID                AS 'Código do Responsável'
FROM FUNCIONARIOS F JOIN DEPENDENTES D
    ON F.ID = D.ID
WHERE YEAR(D.DataNascimento) >= 2000
ORDER BY F.Nome, D.Nome;

