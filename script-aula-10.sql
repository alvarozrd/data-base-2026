USE INTERCAMBIO_alp;


GO
DECLARE @d AS DATETIME = GETDATE();

SELECT FORMAT(@d, 'D', 'en-US') AS 'Inglês Americano',
       FORMAT(@d, 'D', 'en-gb') AS 'Inglês Britânico',
       FORMAT(@d, 'D', 'de-de') AS 'Alemão',
       FORMAT(@d, 'D', 'zh-cn') AS 'Chinês Simplificado',
       FORMAT(@d, 'D', 'pt-br') AS 'Português Brasil';


GO
---
SELECT NomeAluno AS 'Nome do Aluno',
       DataNasc AS 'Data de Nascimento',
       FORMAT(DataNasc, 'D', 'pt-br') AS 'Data de Nascimento'
FROM   ALUNOS;


GO
---
SELECT CONCAT('Paulo', 'Giovani') AS 'CONCAT',
       CONCAT('Rua ', 'João XXIII, ', '15', ' - São Pualo') AS 'Endereço',
       STUFF('Paulo Giovani', 2, 1, 'TEXTO') AS 'STUFF',
       REVERSE('Paulo Giovani') AS 'REVERSE',
       REPLICATE(' * ', 10) AS 'REPLICATE 1',
       'Paulo' + REPLICATE('.', 5) + ': ' + '6666-6666' AS 'REPLICATE 2';


GO
--- 
SET LANGUAGE Brazilian;


GO
SELECT NomeAluno AS 'Nome do Aluno',
       DATEPART(DAY, DataNasc) AS 'Dia',
       DATENAME(DW, DataNasc) AS 'Dia da Semana',
       DATENAME(M, DataNasc) AS 'Nome do Mês',
       DATEPART(YEAR, DataNasc) AS 'Ano',
       CONCAT(DATENAME(DW, DataNasc), ', ', DATEPART(DAY, DataNasc), ' de ', DATENAME(M, DataNasc), ' de ', DATEPART(YEAR, DataNasc), '. ') AS 'Data de Nascimento'
FROM   ALUNOS;


GO
---
SELECT NomeAluno AS 'Nome do aluno',
       SUBSTRING(NomeAluno, 1, 1) AS 'Inicial',
       LOWER(NomeAluno) AS 'Nome em minúsculas',
       UPPER(NomeAluno) AS 'Nome em maiúsculas',
       LEN(NomeAluno) AS 'Qtd caracteres',
       LEFT(NomeAluno, 3) AS 'LEFT',
       RIGHT(NomeAluno, 3) AS 'RIGHT',
       RIGHT(RTRIM(NomeAluno), 3) AS 'RTRIM',
       '   ' + NomeAluno AS 'LTRIM 1',
       LTRIM('   ' + NomeAluno) AS 'LTRIM 2'
FROM   ALUNOS;


---

DECLARE @valor AS DECIMAL(5, 2) = 156.90;

SELECT  CAST(@valor AS CHAR(20))       AS 'CAST',
        CONVERT(DECIMAL(10,5), @valor) AS 'CONVERT';
GO

---

DECLARE @valor AS INT = 100;

SELECT  CAST(@valor AS CHAR(20))            AS 'CAST1',
        CAST(@valor AS DECIMAL(10, 5))      AS 'CAST2',
        CONVERT(CHAR(20), @valor)           AS 'CONVERT1',
        CONVERT(DECIMAL(10,5), @valor)      AS 'CONVERT2'
GO
