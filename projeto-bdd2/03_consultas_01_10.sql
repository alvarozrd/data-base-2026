--------------------------------------------------------------------------------
-- 03_consultas_01_10.sql
-- Projeto Final - Banco de Dados 2 (CJOBDD2) - IFSP Campos do Jordao
-- Autor: Alvaro Pereira (CJ3037916)
-- Consultas 1 a 10 sobre o banco ProducaoAcademica_CJ3037916.
-- Cada consulta e precedida por um PRINT que a identifica na saida.
--------------------------------------------------------------------------------

USE ProducaoAcademica_CJ3037916;
GO


PRINT '=== CONSULTA 1 ===';
-- Finalidade: listar as producoes publicadas, com o tipo e o ano, das mais
-- recentes para as mais antigas.
SELECT  P.IdProducao AS 'Código',
        P.Titulo     AS 'Título',
        T.NomeTipo   AS 'Tipo',
        P.Ano        AS 'Ano'
FROM PRODUCOES P INNER JOIN TIPOS_PRODUCAO T
    ON P.IdTipo = T.IdTipo
WHERE P.Situacao = 'Publicada'
ORDER BY P.Ano DESC, P.Titulo ASC;
GO


PRINT '=== CONSULTA 2 ===';
-- Finalidade: listar as producoes registradas durante o ano de 2024.
SELECT  P.IdProducao   AS 'Código',
        P.Titulo       AS 'Título',
        P.DataRegistro AS 'Data de Registro',
        P.Situacao     AS 'Situação'
FROM PRODUCOES P
WHERE P.DataRegistro BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY P.DataRegistro ASC;
GO


PRINT '=== CONSULTA 3 ===';
-- Finalidade: localizar producoes cujo titulo contenha a palavra "ensino",
-- informando a area tematica de cada uma.
SELECT  P.IdProducao AS 'Código',
        P.Titulo     AS 'Título',
        A.NomeArea   AS 'Área Temática'
FROM PRODUCOES P INNER JOIN AREAS_TEMATICAS A
    ON P.IdArea = A.IdArea
WHERE P.Titulo LIKE '%ensino%'
ORDER BY P.Titulo ASC;
GO


PRINT '=== CONSULTA 4 ===';
-- Finalidade: exibir o contato dos professores, indicando "Não informado"
-- quando o telefone nao foi cadastrado (tratamento de valores nulos).
SELECT  PR.IdProfessor AS 'Código',
        PR.Nome        AS 'Professor',
        PR.Titulacao   AS 'Titulação',
        CASE
            WHEN PR.Telefone IS NULL THEN 'Não informado'
            ELSE PR.Telefone
        END            AS 'Telefone'
FROM PROFESSORES PR
ORDER BY PR.Nome ASC;
GO


PRINT '=== CONSULTA 5 ===';
-- Finalidade: listar os alunos que ingressaram a partir de 2022, com o curso
-- e o ano de ingresso, em ordem alfabetica.
SELECT  A.Nome                 AS 'Aluno',
        C.NomeCurso            AS 'Curso',
        YEAR(A.DataIngresso)   AS 'Ano de Ingresso'
FROM ALUNOS A INNER JOIN CURSOS C
    ON A.IdCurso = C.IdCurso
WHERE YEAR(A.DataIngresso) >= 2022
ORDER BY A.Nome ASC;
GO


PRINT '=== CONSULTA 6 ===';
-- Finalidade: exibir as 5 producoes registradas mais recentemente.
SELECT TOP 5
        P.IdProducao   AS 'Código',
        P.Titulo       AS 'Título',
        P.DataRegistro AS 'Data de Registro',
        P.Situacao     AS 'Situação'
FROM PRODUCOES P
ORDER BY P.DataRegistro DESC;
GO


PRINT '=== CONSULTA 7 ===';
-- Finalidade: listar o orientador de cada producao concluida ou publicada.
-- O resultado foi limitado a 20 linhas.
SELECT TOP 20
        P.IdProducao AS 'Código',
        P.Titulo     AS 'Título',
        PR.Nome      AS 'Orientador',
        PR.Titulacao AS 'Titulação'
FROM PRODUCOES P INNER JOIN ORIENTACOES O
        ON P.IdProducao = O.IdProducao
    INNER JOIN PROFESSORES PR
        ON O.IdProfessor = PR.IdProfessor
WHERE O.TipoOrientacao = 'Orientador'
  AND P.Situacao IN ('Concluída', 'Publicada')
ORDER BY PR.Nome ASC, P.Titulo ASC;
GO


PRINT '=== CONSULTA 8 ===';
-- Finalidade: listar as producoes de 2025 em diante com o veiculo de
-- publicacao. O LEFT JOIN mantem as producoes que nao possuem veiculo.
SELECT  P.IdProducao AS 'Código',
        P.Titulo     AS 'Título',
        P.Ano        AS 'Ano',
        CASE
            WHEN V.IdVeiculo IS NULL THEN 'Sem veículo de publicação'
            ELSE V.NomeVeiculo
        END          AS 'Veículo'
FROM PRODUCOES P LEFT JOIN VEICULOS_PUBLICACAO V
    ON P.IdVeiculo = V.IdVeiculo
WHERE P.Ano >= 2025
ORDER BY P.Ano ASC, P.Titulo ASC;
GO


PRINT '=== CONSULTA 9 ===';
-- Finalidade: listar o autor principal (primeiro autor) de cada producao,
-- com o curso e o nivel. O resultado foi limitado a 20 linhas.
SELECT TOP 20
        A.Nome                                 AS 'Autor Principal',
        CONCAT(C.NomeCurso, ' (', C.Nivel, ')') AS 'Curso',
        P.Titulo                               AS 'Título'
FROM AUTORIAS AU INNER JOIN ALUNOS A
        ON AU.IdAluno = A.IdAluno
    INNER JOIN CURSOS C
        ON A.IdCurso = C.IdCurso
    INNER JOIN PRODUCOES P
        ON AU.IdProducao = P.IdProducao
WHERE AU.OrdemAutoria = 1
ORDER BY A.Nome ASC, P.Titulo ASC;
GO


PRINT '=== CONSULTA 10 ===';
-- Finalidade: identificar referencias bibliograficas sem ano informado ou
-- anteriores a 2000, classificando o motivo.
SELECT  R.IdReferencia  AS 'Código',
        R.TipoDocumento AS 'Tipo',
        CASE
            WHEN R.AnoPublicacao IS NULL THEN 'Ano não informado'
            ELSE 'Anterior a 2000'
        END             AS 'Situação',
        R.TextoReferencia AS 'Referência'
FROM REFERENCIAS R
WHERE R.AnoPublicacao IS NULL
   OR R.AnoPublicacao < 2000
ORDER BY R.IdReferencia ASC;
GO
