--------------------------------------------------------------------------------
-- 04_consultas_11_30.sql
-- Projeto Final - Banco de Dados 2 (CJOBDD2) - IFSP Campos do Jordao
-- Autor: Alvaro Pereira (CJ3037916)
-- Consultas 11 a 30 sobre o banco ProducaoAcademica_CJ3037916.
-- Cada consulta e precedida por um PRINT que a identifica na saida.
--------------------------------------------------------------------------------

USE ProducaoAcademica_CJ3037916;
GO


PRINT '=== CONSULTA 11 ===';
-- Finalidade: contar quantas producoes cada curso possui, do curso com mais
-- producoes para o curso com menos. (INNER JOIN, GROUP BY, COUNT)
SELECT  C.NomeCurso          AS 'Curso',
        COUNT(P.IdProducao)  AS 'Total de Produções'
FROM CURSOS C INNER JOIN PRODUCOES P
    ON C.IdCurso = P.IdCurso
GROUP BY C.NomeCurso
ORDER BY COUNT(P.IdProducao) DESC, C.NomeCurso ASC;
GO


PRINT '=== CONSULTA 12 ===';
-- Finalidade: contar os alunos de cada curso, incluindo cursos sem alunos.
-- O LEFT JOIN mantem os cursos sem correspondencia; COUNT(A.IdAluno) nao conta
-- valores nulos e, por isso, retorna 0 para esses cursos.
SELECT  C.NomeCurso         AS 'Curso',
        C.Nivel             AS 'Nível',
        COUNT(A.IdAluno)    AS 'Total de Alunos'
FROM CURSOS C LEFT JOIN ALUNOS A
    ON C.IdCurso = A.IdCurso
GROUP BY C.IdCurso, C.NomeCurso, C.Nivel
ORDER BY COUNT(A.IdAluno) DESC, C.NomeCurso ASC;
GO


PRINT '=== CONSULTA 13 ===';
-- Finalidade: contar as producoes por situacao, considerando apenas as
-- registradas a partir de um ano informado em uma variavel (DECLARE).
DECLARE @AnoInicial AS SMALLINT = 2024;

SELECT  P.Situacao  AS 'Situação',
        COUNT(*)    AS 'Total'
FROM PRODUCOES P
WHERE P.Ano >= @AnoInicial
GROUP BY P.Situacao
ORDER BY COUNT(*) DESC, P.Situacao ASC;
GO


PRINT '=== CONSULTA 14 ===';
-- Finalidade: listar as areas tematicas com pelo menos 3 producoes.
-- (GROUP BY com HAVING)
SELECT  A.NomeArea          AS 'Área Temática',
        COUNT(P.IdProducao) AS 'Total de Produções'
FROM AREAS_TEMATICAS A INNER JOIN PRODUCOES P
    ON A.IdArea = P.IdArea
GROUP BY A.NomeArea
HAVING COUNT(P.IdProducao) >= 3
ORDER BY COUNT(P.IdProducao) DESC, A.NomeArea ASC;
GO


PRINT '=== CONSULTA 15 ===';
-- Finalidade: calcular a media das notas de banca por producao e exibir
-- somente as producoes com media igual ou superior a 8,5.
-- Observacao: notas nulas (ainda nao lancadas) sao ignoradas pela funcao AVG.
SELECT  P.IdProducao                    AS 'Código',
        P.Titulo                        AS 'Título',
        COUNT(B.Nota)                   AS 'Notas Lançadas',
        CAST(AVG(B.Nota) AS DECIMAL(4,2)) AS 'Média da Banca'
FROM PRODUCOES P INNER JOIN BANCAS B
    ON P.IdProducao = B.IdProducao
GROUP BY P.IdProducao, P.Titulo
HAVING AVG(B.Nota) >= 8.5
ORDER BY AVG(B.Nota) DESC, P.Titulo ASC;
GO


PRINT '=== CONSULTA 16 ===';
-- Finalidade: contar as orientacoes de cada professor, incluindo os que nao
-- orientaram nenhuma producao.
SELECT  PR.Nome                 AS 'Professor',
        COUNT(O.IdProducao)     AS 'Total de Orientações'
FROM PROFESSORES PR LEFT JOIN ORIENTACOES O
    ON PR.IdProfessor = O.IdProfessor
GROUP BY PR.IdProfessor, PR.Nome
ORDER BY COUNT(O.IdProducao) DESC, PR.Nome ASC;
GO


PRINT '=== CONSULTA 17 ===';
-- Finalidade: contar a participacao de cada professor em bancas, separada por
-- papel (presidente, avaliador ou suplente).
SELECT  PR.Nome     AS 'Professor',
        B.Papel     AS 'Papel na Banca',
        COUNT(*)    AS 'Participações'
FROM BANCAS B INNER JOIN PROFESSORES PR
    ON B.IdProfessor = PR.IdProfessor
GROUP BY PR.Nome, B.Papel
ORDER BY PR.Nome ASC, B.Papel ASC;
GO


PRINT '=== CONSULTA 18 ===';
-- Finalidade: exibir as 5 palavras-chave mais utilizadas nas producoes.
SELECT TOP 5
        K.Termo                 AS 'Palavra-chave',
        COUNT(PP.IdProducao)    AS 'Total de Produções'
FROM PALAVRAS_CHAVE K INNER JOIN PRODUCAO_PALAVRA PP
    ON K.IdPalavra = PP.IdPalavra
GROUP BY K.Termo
ORDER BY COUNT(PP.IdProducao) DESC, K.Termo ASC;
GO


PRINT '=== CONSULTA 19 ===';
-- Finalidade: exibir as 5 referencias bibliograficas mais citadas, mostrando
-- apenas os 70 primeiros caracteres do texto da referencia.
SELECT TOP 5
        R.IdReferencia                  AS 'Código',
        LEFT(R.TextoReferencia, 70)     AS 'Referência (início)',
        COUNT(PR2.IdProducao)           AS 'Citações'
FROM REFERENCIAS R INNER JOIN PRODUCAO_REFERENCIA PR2
    ON R.IdReferencia = PR2.IdReferencia
GROUP BY R.IdReferencia, R.TextoReferencia
ORDER BY COUNT(PR2.IdProducao) DESC, R.IdReferencia ASC;
GO


PRINT '=== CONSULTA 20 ===';
-- Finalidade: listar as producoes com mais de um autor.
SELECT  P.IdProducao        AS 'Código',
        P.Titulo            AS 'Título',
        COUNT(AU.IdAluno)   AS 'Total de Autores'
FROM PRODUCOES P INNER JOIN AUTORIAS AU
    ON P.IdProducao = AU.IdProducao
GROUP BY P.IdProducao, P.Titulo
HAVING COUNT(AU.IdAluno) > 1
ORDER BY COUNT(AU.IdAluno) DESC, P.Titulo ASC;
GO


