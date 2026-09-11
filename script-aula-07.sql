use empresaCJ3037916;

-- Cria a tabela DEPENDENTES para armazenar os dados dos dependentes dos funcionários.
-- A coluna ID cria o relacionamento com a chave primária da tabela FUNCIONARIOS.
CREATE TABLE DEPENDENTES (
    CodDependentes INT PRIMARY KEY,
    Nome VARCHAR(35) NOT NULL,
    Sexo CHAR(1) NULL,
    DataNascimento DATE NOT NULL,
    ID INT FOREIGN KEY REFERENCES
FUNCIONARIOS (ID)
);

-- Exibe todos os registros cadastrados na tabela DEPENDENTES.
SELECT * FROM DEPENDENTES;

-- Define o formato de data como ano, mês e dia para ler corretamente o arquivo CSV.
SET DATEFORMAT YMD;

-- Importa os dados do arquivo dependentes.csv para dentro da tabela DEPENDENTES.
-- FIRSTROW = 2 ignora a primeira linha do arquivo, que normalmente contém cabeçalhos.
BULK INSERT DEPENDENTES
    FROM '/dados/dependentes.csv'
WITH(
    FIRSTROW = 2,
    DATAFILETYPE = 'widechar',
    FIELDTERMINATOR = ','
);

-- Confere os dados importados em DEPENDENTES e os dados existentes em FUNCIONARIOS.
SELECT * FROM DEPENDENTES;
SELECT * FROM FUNCIONARIOS;

-- Sintaxe mais antiga de junção entre tabelas, sem usar a palavra JOIN.
-- O resultado combina cada funcionário com cada dependente, formando um produto cartesiano.
SELECT *
FROM FUNCIONARIOS, DEPENDENTES;


-- Sintaxe utilizando CROSS JOIN para gerar explicitamente o produto cartesiano.
-- Cada linha de FUNCIONARIOS é combinada com todas as linhas de DEPENDENTES.
SELECT * 
FROM FUNCIONARIOS CROSS JOIN 
DEPENDENTES;

-- Usa apelidos para as tabelas: F representa FUNCIONARIOS e D representa DEPENDENTES.
-- Isso deixa a consulta mais curta e ajuda a identificar de qual tabela vem cada coluna.
SELECT  F.ID                AS 'Código do Funcionário',
        F.Nome              AS 'Nome do Funcionário',
        D.Nome              AS 'Nome do Dependente',
        D.DataNascimento    AS 'Data de Nascimento'
FROM FUNCIONARIOS F CROSS JOIN DEPENDENTES D;


-- INNER JOIN entre funcionários e dependentes.
-- Exibe somente funcionários que possuem dependente correspondente na tabela DEPENDENTES.
SELECT 
    F.ID        AS 'Código do Funcionário',
    F.Nome      AS 'Nome do Funcionário',
    F.Salario   AS 'Salário',
    D.Nome      AS 'Nome do Dependente',
    D.ID        AS 'Código do Responsável'
FROM FUNCIONARIOS F JOIN DEPENDENTES D
    ON F.ID = D.ID;


-- INNER JOIN com filtro de data de nascimento.
-- Exibe somente dependentes nascidos a partir do ano 2000 e ordena por funcionário e dependente.
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

-- Altera o formato de data para dia, mês e ano antes de inserir novos funcionários.
SET DATEFORMAT DMY;

-- Insere novos registros na tabela FUNCIONARIOS para ampliar os exemplos de JOIN.
INSERT INTO FUNCIONARIOS VALUES
(11, 'Ana Cláudia', 'F', '12/09/2011', 4900.00, '3663-9090'),
(12, 'André Lima', 'M', '05/11/2009', 2050.00, '3664-8989'),
(13, 'Marcos Souza', 'M', '02/10/2009', 3800.00, NULL),
(14, 'Mariana Gomes', 'F', '19/11/2018', 1758.50, NULL),
(15, 'Cinthia Faria', 'F', '18/07/2016', 1758.58, '3662-1212');




-- LEFT OUTER JOIN partindo de FUNCIONARIOS.
-- Mantém todos os funcionários, mesmo quando não existe dependente relacionado.
SELECT  F.ID                AS 'ID',
        F.Nome              AS 'Funcionário',
        F.Admissao          AS 'Admissão',
        F.Salario           AS 'Salário',
        D.Nome              AS 'Dependente',
        D.DataNascimento    AS 'Data de Nascimento'
FROM FUNCIONARIOS F LEFT OUTER JOIN DEPENDENTES D
ON F.ID = D.ID;


-- RIGHT OUTER JOIN partindo de DEPENDENTES para FUNCIONARIOS.
-- Como FUNCIONARIOS está do lado direito, a consulta mantém todos os funcionários.
SELECT F.ID				AS 'ID',
       F.Nome			AS 'Funcionário',
	   F.Admissao		AS 'Admissão',
	   F.Salario		AS 'Salário',
	   D.Nome			AS 'Dependente',
	   D.DataNascimento	AS 'Data de Nascimento'
FROM DEPENDENTES D RIGHT OUTER JOIN FUNCIONARIOS F 
	ON F.ID = D.ID;
GO


-- LEFT OUTER JOIN partindo de DEPENDENTES para FUNCIONARIOS.
-- Como DEPENDENTES está do lado esquerdo, a consulta mantém todos os dependentes.
SELECT F.ID				AS 'ID',
       F.Nome			AS 'Funcionário',
	   F.Admissao		AS 'Admissão',
	   F.Salario		AS 'Salário',
	   D.Nome			AS 'Dependente',
	   D.DataNascimento	AS 'Data de Nascimento'
FROM DEPENDENTES D LEFT OUTER JOIN FUNCIONARIOS F 
	ON F.ID = D.ID;
GO



-- FULL OUTER JOIN entre DEPENDENTES e FUNCIONARIOS.
-- Exibe registros correspondentes e também registros sem correspondência em qualquer uma das tabelas.
SELECT F.ID				AS 'ID',
       F.Nome			AS 'Funcionário',
	   F.Admissao		AS 'Admissão',
	   F.Salario		AS 'Salário',
	   D.Nome			AS 'Dependente',
	   D.DataNascimento	AS 'Data de Nascimento'
FROM DEPENDENTES D FULL OUTER JOIN FUNCIONARIOS F 
	ON F.ID = D.ID;
GO


-- Conta dependentes usando INNER JOIN.
-- Como a consulta usa INNER JOIN, entram apenas funcionários que possuem dependentes relacionados.
SELECT  F.ID AS 'ID',
        F.Nome AS 'Funcionários',
        COUNT(F.ID) AS 'Total de Dependentes'
FROM FUNCIONARIOS F INNER JOIN DEPENDENTES D
    ON F.ID = D.ID
GROUP BY F.ID, F.Nome;


-- Lógica correta para contar dependentes considerando funcionários sem dependentes.
-- COUNT(D.ID) conta apenas dependentes encontrados, sem contar automaticamente o funcionário.
SELECT  F.ID AS 'ID',
        F.Nome AS 'Funcionários',
        COUNT(D.ID) AS 'Total de Dependentes'
FROM FUNCIONARIOS F FULL OUTER JOIN DEPENDENTES D
    ON F.ID = D.ID
GROUP BY F.ID, F.Nome;
