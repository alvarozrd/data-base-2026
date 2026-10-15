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

