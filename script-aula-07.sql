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

SET DATEFORMAT DMY;

INSERT INTO FUNCIONARIOS VALUES
(11, 'Ana Cláudia', 'F', '12/09/2011', 4900.00, '3663-9090'),
(12, 'André Lima', 'M', '05/11/2009', 2050.00, '3664-8989'),
(13, 'Marcos Souza', 'M', '02/10/2009', 3800.00, NULL),
(14, 'Mariana Gomes', 'F', '19/11/2018', 1758.50, NULL),
(15, 'Cinthia Faria', 'F', '18/07/2016', 1758.58, '3662-1212');




SELECT  F. ID       AS 'ID',
        F.Nome      AS 'Funcionánio',
        F.Admissao  AS 'Admissão',
        F.Salario   AS 'Salário',
        D. Nome     AS 'Dependente',
        D. DataNascimento AS 'Data de Nascimento'
FROM FUNCIONARIOS F LEFT OUTER JOIN DEPENDENTES D
ON F.ID = D.ID;