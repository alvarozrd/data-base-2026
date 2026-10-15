USE INTERCAMBIO_alp;
GO

DECLARE @d DATETIME = GETDATE();

SELECT  FORMAT(@d, 'D', 'en-US') AS 'Inglês Americano',
        FORMAT(@d, 'D', 'en-gb') AS 'Inglês Britânico',
        FORMAT(@d, 'D', 'de-de') AS 'Alemão',
        FORMAT(@d, 'D', 'zh-cn') AS 'Chinês Simplificado',
        FORMAT(@d, 'D', 'pt-br') AS 'Português Brasil';
GO


---

SELECT  NomeAluno AS 'Nome do Aluno',
        DataNasc AS 'Data de Nascimento',
        FORMAT(DataNasc, 'D', 'pt-br') AS 'Data de Nascimento'
FROM ALUNOS;
GO

---

SELECT  CONCAT( 'Paulo', 'Giovani') AS 'CONCAT',
        CONCAT( 'Rua ', 'João XXIII, ', '15', ' - São Pualo') AS 'Endereço',
        STUFF('Paulo Giovani', 2, 1, 'TEXTO') AS 'STUFF',
        REVERSE('Paulo Giovani') AS 'REVERSE',
        REPLICATE(' * ', 10) AS 'REPLICATE 1', 'Paulo' + REPLICATE('.', 5) + ': ' + '6666-6666' AS 'REPLICATE 2';
GO

--- 

SET LANGUAGE Brazilian;
GO

SELECT NomeAluno AS 'Nome do Aluno',
        DATEPART(DAY, DataNasc) AS 'Dia',
        DATENAME(DW, DataNasc)  As 'Dia da Semana',
        DATENAME(M, DataNasc)   AS 'Nome do Mês',
        DATEPART(YEAR, DataNasc) AS 'Ano',
        CONCAT(DATENAME(DW, DataNasc), ', ', DATEPART(DAY, DataNasc), ' de ', DATENAME(M, DataNasc), ' de ', DATEPART(YEAR, DataNasc), '. ') AS 'Data de Nascimento'
FROM ALUNOS;
GO
