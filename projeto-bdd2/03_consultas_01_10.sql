-- Projeto de Banco de Dados 2 - Álvaro Pereira
-- consultas 1 a 10

USE ProducaoAcademica_CJ3037916;
GO

-- consulta 1
SELECT P.IdProducao AS 'Código',
       P.Titulo AS 'Título',
       T.NomeTipo AS 'Tipo',
       P.Ano AS 'Ano'

FROM PRODUCOES P INNER JOIN TIPOS_PRODUCAO T
    ON P.IdTipo = T.IdTipo

WHERE P.Situacao = 'Publicada'

ORDER BY P.Ano DESC, P.Titulo ASC;
GO


-- consulta 2
SELECT P.IdProducao AS 'Código',
       P.Titulo AS 'Título',
       P.DataRegistro AS 'Data de Registro',
       P.Situacao AS 'Situação'

FROM PRODUCOES P

WHERE P.DataRegistro BETWEEN '2024-01-01' AND '2024-12-31'

ORDER BY P.DataRegistro ASC;
GO


-- consulta 3
SELECT P.IdProducao AS 'Código',
       P.Titulo AS 'Título',
       A.NomeArea AS 'Área Temática'

FROM PRODUCOES P INNER JOIN AREAS_TEMATICAS A
    ON P.IdArea = A.IdArea

WHERE P.Titulo LIKE '%ensino%'

ORDER BY P.Titulo ASC;
GO


-- consulta 4
SELECT PR.IdProfessor AS 'Código',
       PR.Nome AS 'Professor',
       PR.Titulacao AS 'Titulação',
       CASE
            WHEN PR.Telefone IS NULL THEN 'Não informado'
            ELSE PR.Telefone
       END AS 'Telefone'

FROM PROFESSORES PR

ORDER BY PR.Nome ASC;
GO


-- consulta 5
SELECT A.Nome AS 'Aluno',
       C.NomeCurso AS 'Curso',
       YEAR(A.DataIngresso) AS 'Ano de Ingresso'

FROM ALUNOS A INNER JOIN CURSOS C
    ON A.IdCurso = C.IdCurso

WHERE YEAR(A.DataIngresso) >= 2022

ORDER BY A.Nome ASC;
GO


-- consulta 6
SELECT TOP 5
       P.IdProducao AS 'Código',
       P.Titulo AS 'Título',
       P.DataRegistro AS 'Data de Registro',
       P.Situacao AS 'Situação'

FROM PRODUCOES P

ORDER BY P.DataRegistro DESC, P.IdProducao ASC;
GO


-- consulta 7
SELECT TOP 20
       P.IdProducao AS 'Código',
       P.Titulo AS 'Título',
       PR.Nome AS 'Orientador',
       PR.Titulacao AS 'Titulação'

FROM PRODUCOES P INNER JOIN ORIENTACOES O
       ON P.IdProducao = O.IdProducao
    INNER JOIN PROFESSORES PR
       ON O.IdProfessor = PR.IdProfessor

WHERE O.TipoOrientacao = 'Orientador'
  AND P.Situacao IN ('Concluída', 'Publicada')

ORDER BY PR.Nome ASC, P.Titulo ASC;
GO


-- consulta 8
-- mantém as produções sem veículo
SELECT P.IdProducao AS 'Código',
       P.Titulo AS 'Título',
       P.Ano AS 'Ano',
       CASE
            WHEN V.IdVeiculo IS NULL THEN 'Sem veículo de publicação'
            ELSE V.NomeVeiculo
       END AS 'Veículo'

FROM PRODUCOES P LEFT JOIN VEICULOS_PUBLICACAO V
    ON P.IdVeiculo = V.IdVeiculo

WHERE P.Ano >= 2025

ORDER BY P.Ano ASC, P.Titulo ASC;
GO


-- consulta 9
SELECT TOP 20
       A.Nome AS 'Autor Principal',
       CONCAT(C.NomeCurso, ' (', C.Nivel, ')') AS 'Curso',
       P.Titulo AS 'Título'

FROM AUTORIAS AU INNER JOIN ALUNOS A
       ON AU.IdAluno = A.IdAluno
    INNER JOIN CURSOS C
       ON A.IdCurso = C.IdCurso
    INNER JOIN PRODUCOES P
       ON AU.IdProducao = P.IdProducao

WHERE AU.OrdemAutoria = 1

ORDER BY A.Nome ASC, P.Titulo ASC;
GO


-- consulta 10
SELECT R.IdReferencia AS 'Código',
       R.TipoDocumento AS 'Tipo',
       CASE
            WHEN R.AnoPublicacao IS NULL THEN 'Ano não informado'
            ELSE 'Anterior a 2000'
       END AS 'Situação',
       R.TextoReferencia AS 'Referência'

FROM REFERENCIAS R

WHERE R.AnoPublicacao IS NULL
  OR R.AnoPublicacao < 2000

ORDER BY R.IdReferencia ASC;
GO
