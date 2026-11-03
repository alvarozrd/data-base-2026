-- Projeto de Banco de Dados 2 - Álvaro Pereira
-- consultas 11 a 30

USE ProducaoAcademica_CJ3037916;
GO

-- consulta 11
SELECT C.NomeCurso AS 'Curso',
       COUNT(P.IdProducao) AS 'Total de Produções'

FROM CURSOS C INNER JOIN PRODUCOES P
    ON C.IdCurso = P.IdCurso

GROUP BY C.NomeCurso

ORDER BY COUNT(P.IdProducao) DESC, C.NomeCurso ASC;
GO


-- consulta 12
-- conta somente os alunos encontrados
SELECT C.NomeCurso AS 'Curso',
       C.Nivel AS 'Nível',
       COUNT(A.IdAluno) AS 'Total de Alunos'

FROM CURSOS C LEFT JOIN ALUNOS A
    ON C.IdCurso = A.IdCurso

GROUP BY C.IdCurso, C.NomeCurso, C.Nivel

ORDER BY COUNT(A.IdAluno) DESC, C.NomeCurso ASC;
GO


-- consulta 13
DECLARE @AnoInicial AS SMALLINT = 2024;

SELECT P.Situacao AS 'Situação',
       COUNT(*) AS 'Total'

FROM PRODUCOES P

WHERE P.Ano >= @AnoInicial

GROUP BY P.Situacao

ORDER BY COUNT(*) DESC, P.Situacao ASC;
GO


-- consulta 14
SELECT A.NomeArea AS 'Área Temática',
       COUNT(P.IdProducao) AS 'Total de Produções'

FROM AREAS_TEMATICAS A INNER JOIN PRODUCOES P
    ON A.IdArea = P.IdArea

GROUP BY A.NomeArea

HAVING COUNT(P.IdProducao) >= 3

ORDER BY COUNT(P.IdProducao) DESC, A.NomeArea ASC;
GO


-- consulta 15
-- considera as notas a partir de 8,5
SELECT P.IdProducao AS 'Código',
       P.Titulo AS 'Título',
       COUNT(B.Nota) AS 'Notas a partir de 8,5'

FROM PRODUCOES P INNER JOIN BANCAS B
    ON P.IdProducao = B.IdProducao

WHERE B.Nota >= 8.5

GROUP BY P.IdProducao, P.Titulo

ORDER BY COUNT(B.Nota) DESC, P.Titulo ASC, P.IdProducao ASC;
GO


-- consulta 16
SELECT PR.Nome AS 'Professor',
       COUNT(O.IdProducao) AS 'Total de Orientações'

FROM PROFESSORES PR LEFT JOIN ORIENTACOES O
    ON PR.IdProfessor = O.IdProfessor

GROUP BY PR.IdProfessor, PR.Nome

ORDER BY COUNT(O.IdProducao) DESC, PR.Nome ASC;
GO


-- consulta 17
SELECT PR.Nome AS 'Professor',
       B.Papel AS 'Papel na Banca',
       COUNT(*) AS 'Participações'

FROM BANCAS B INNER JOIN PROFESSORES PR
    ON B.IdProfessor = PR.IdProfessor

GROUP BY PR.IdProfessor, PR.Nome, B.Papel

ORDER BY PR.Nome ASC, B.Papel ASC;
GO


-- consulta 18
SELECT TOP 5
       K.Termo AS 'Palavra-chave',
       COUNT(PP.IdProducao) AS 'Total de Produções'

FROM PALAVRAS_CHAVE K INNER JOIN PRODUCAO_PALAVRA PP
    ON K.IdPalavra = PP.IdPalavra

GROUP BY K.Termo

ORDER BY COUNT(PP.IdProducao) DESC, K.Termo ASC;
GO


-- consulta 19
SELECT TOP 5
       R.IdReferencia AS 'Código',
       LEFT(R.TextoReferencia, 70) AS 'Referência (início)',
       COUNT(PR2.IdProducao) AS 'Citações'

FROM REFERENCIAS R INNER JOIN PRODUCAO_REFERENCIA PR2
    ON R.IdReferencia = PR2.IdReferencia

GROUP BY R.IdReferencia, R.TextoReferencia

ORDER BY COUNT(PR2.IdProducao) DESC, R.IdReferencia ASC;
GO


-- consulta 20
SELECT P.IdProducao AS 'Código',
       P.Titulo AS 'Título',
       COUNT(AU.IdAluno) AS 'Total de Autores'

FROM PRODUCOES P INNER JOIN AUTORIAS AU
    ON P.IdProducao = AU.IdProducao

GROUP BY P.IdProducao, P.Titulo

HAVING COUNT(AU.IdAluno) > 1

ORDER BY COUNT(AU.IdAluno) DESC, P.Titulo ASC;
GO


-- consulta 21
SELECT A.IdAluno AS 'Código',
       A.Nome AS 'Aluno'

FROM ALUNOS A

WHERE A.IdAluno IN (
    SELECT AU.IdAluno
    FROM AUTORIAS AU
    WHERE AU.IdProducao IN (
       SELECT P.IdProducao
       FROM PRODUCOES P
       WHERE P.Situacao = 'Publicada'
    )
)

ORDER BY A.Nome ASC;
GO


-- consulta 22
SELECT A.IdAluno AS 'Código',
       A.Nome AS 'Aluno',
       C.NomeCurso AS 'Curso'

FROM ALUNOS A INNER JOIN CURSOS C
    ON A.IdCurso = C.IdCurso
    LEFT JOIN AUTORIAS AU ON A.IdAluno = AU.IdAluno

WHERE AU.IdAluno IS NULL

ORDER BY A.Nome ASC;
GO


-- consulta 23
SELECT PR.IdProfessor AS 'Código',
       PR.Nome AS 'Professor',
       PR.Titulacao AS 'Titulação'

FROM PROFESSORES PR

WHERE PR.IdProfessor NOT IN (
    SELECT O.IdProfessor
    FROM ORIENTACOES O
)

ORDER BY PR.Nome ASC;
GO


-- consulta 24
SELECT Nome AS 'Nome', Email AS 'E-mail', 'Aluno' AS 'Perfil'

FROM ALUNOS

UNION ALL
SELECT Nome, Email, 'Professor'

FROM PROFESSORES

ORDER BY Nome, Perfil, [E-mail];
GO


-- consulta 25
SELECT A.IdAluno AS 'Código', A.Nome AS 'Aluno'

FROM ALUNOS A INNER JOIN AUTORIAS AU
       ON A.IdAluno = AU.IdAluno
    INNER JOIN PRODUCOES P
       ON AU.IdProducao = P.IdProducao

WHERE P.Situacao = 'Publicada'

INTERSECT
SELECT A.IdAluno, A.Nome

FROM ALUNOS A INNER JOIN AUTORIAS AU
       ON A.IdAluno = AU.IdAluno
    INNER JOIN PRODUCOES P
       ON AU.IdProducao = P.IdProducao

WHERE P.Situacao = 'Concluída'

ORDER BY 2;
GO


-- consulta 26
SELECT PR.IdProfessor AS 'Código', PR.Nome AS 'Professor'

FROM PROFESSORES PR INNER JOIN BANCAS B
    ON PR.IdProfessor = B.IdProfessor

EXCEPT
SELECT PR.IdProfessor, PR.Nome

FROM PROFESSORES PR INNER JOIN ORIENTACOES O
    ON PR.IdProfessor = O.IdProfessor

ORDER BY 2;
GO


-- consulta 27
SELECT T.NomeTipo AS 'Tipo de Produção',
       COUNT(P.IdProducao) AS 'Total'

FROM TIPOS_PRODUCAO T FULL OUTER JOIN PRODUCOES P
    ON T.IdTipo = P.IdTipo

GROUP BY T.NomeTipo

ORDER BY COUNT(P.IdProducao) DESC, T.NomeTipo ASC;
GO


-- consulta 28
SELECT TOP 10
       P.IdProducao AS 'Código',
       P.Titulo AS 'Título',
       P.DataRegistro AS 'Registro',
       H.DataAlteracao AS 'Conclusão',
       DATEDIFF(DAY, P.DataRegistro, H.DataAlteracao) AS 'Dias',
       DATEDIFF(MONTH, P.DataRegistro, H.DataAlteracao) AS 'Meses'

FROM PRODUCOES P INNER JOIN HISTORICO_STATUS H
    ON P.IdProducao = H.IdProducao

WHERE H.SituacaoNova = 'Concluída'

ORDER BY DATEDIFF(DAY, P.DataRegistro, H.DataAlteracao) DESC, P.IdProducao ASC, H.IdHistorico ASC;
GO


-- consulta 29
SELECT H.IdProducao AS 'Código',
       P.Titulo AS 'Título',
       FORMAT(H.DataAlteracao, 'D', 'pt-br') AS 'Data da Publicação'

FROM HISTORICO_STATUS H INNER JOIN PRODUCOES P
    ON H.IdProducao = P.IdProducao

WHERE H.SituacaoNova = 'Publicada'

ORDER BY H.DataAlteracao ASC;
GO


-- consulta 30
-- permite executar a criação da visão novamente
IF EXISTS (
    SELECT TABLE_NAME
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'vw_ResumoProducoes'
      AND TABLE_TYPE = 'VIEW'
)
    DROP VIEW dbo.vw_ResumoProducoes;
GO

CREATE VIEW dbo.vw_ResumoProducoes AS
    SELECT P.IdProducao AS [Código],
          P.Titulo AS [Título],
          C.NomeCurso AS [Curso],
          T.NomeTipo AS [Tipo],
          A.NomeArea AS [Área],
          P.Ano AS [Ano],
          P.Situacao AS [Situação]
    FROM PRODUCOES P INNER JOIN CURSOS C
       ON P.IdCurso = C.IdCurso
       INNER JOIN TIPOS_PRODUCAO T ON P.IdTipo = T.IdTipo
       INNER JOIN AREAS_TEMATICAS A ON P.IdArea = A.IdArea;
GO

SELECT [Código], [Título], [Curso], [Tipo], [Situação]

FROM dbo.vw_ResumoProducoes

WHERE [Ano] >= 2025

ORDER BY [Curso] ASC, [Título] ASC;
GO
