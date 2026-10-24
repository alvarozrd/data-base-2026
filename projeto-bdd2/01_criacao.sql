--------------------------------------------------------------------------------
-- 01_criacao.sql
-- Projeto Final - Banco de Dados 2 (CJOBDD2) - IFSP Campos do Jordao
-- Autor: Alvaro Pereira (CJ3037916)
-- Sistema de Gerenciamento de Projetos e Producoes Academicas no IFSP
-- SGBD: Microsoft SQL Server (T-SQL)
--
-- Este script cria o banco de dados e as 15 tabelas do modelo fisico.
-- Para recriar tudo do zero, execute antes:
--     USE master; DROP DATABASE ProducaoAcademica_CJ3037916;
--------------------------------------------------------------------------------


-- Habilita o contexto do banco de dados MASTER
USE master;
GO

-- Cria o banco de dados, caso ele ainda nao exista
IF DB_ID(N'ProducaoAcademica_CJ3037916') IS NULL
    CREATE DATABASE ProducaoAcademica_CJ3037916;
GO

-- Habilita o contexto do banco de dados do projeto
USE ProducaoAcademica_CJ3037916;
GO


--------------------------------------------------------------------------------
-- TABELAS DE APOIO (dominios)
--------------------------------------------------------------------------------

-- Tabela CURSOS
CREATE TABLE CURSOS (
    IdCurso     INT          NOT NULL,
    NomeCurso   VARCHAR(100) NOT NULL,
    Nivel       VARCHAR(30)  NOT NULL,
    CONSTRAINT PK_CURSOS PRIMARY KEY (IdCurso),
    CONSTRAINT UQ_CURSOS_Nome UNIQUE (NomeCurso),
    CONSTRAINT CK_CURSOS_Nivel
        CHECK (Nivel IN ('Técnico', 'Superior', 'Pós-graduação'))
);
GO

-- Tabela AREAS_TEMATICAS
CREATE TABLE AREAS_TEMATICAS (
    IdArea      INT          NOT NULL,
    NomeArea    VARCHAR(80)  NOT NULL,
    Descricao   VARCHAR(250) NULL,
    CONSTRAINT PK_AREAS_TEMATICAS PRIMARY KEY (IdArea),
    CONSTRAINT UQ_AREAS_TEMATICAS_Nome UNIQUE (NomeArea)
);
GO

-- Tabela TIPOS_PRODUCAO
CREATE TABLE TIPOS_PRODUCAO (
    IdTipo      INT          NOT NULL,
    NomeTipo    VARCHAR(40)  NOT NULL,
    Descricao   VARCHAR(150) NULL,
    CONSTRAINT PK_TIPOS_PRODUCAO PRIMARY KEY (IdTipo),
    CONSTRAINT UQ_TIPOS_PRODUCAO_Nome UNIQUE (NomeTipo)
);
GO

-- Tabela VEICULOS_PUBLICACAO (periodicos, congressos e eventos)
CREATE TABLE VEICULOS_PUBLICACAO (
    IdVeiculo    INT          NOT NULL,
    NomeVeiculo  VARCHAR(150) NOT NULL,
    TipoVeiculo  VARCHAR(20)  NOT NULL,
    Abrangencia  VARCHAR(20)  NOT NULL,
    CONSTRAINT PK_VEICULOS_PUBLICACAO PRIMARY KEY (IdVeiculo),
    CONSTRAINT UQ_VEICULOS_PUBLICACAO_Nome UNIQUE (NomeVeiculo),
    CONSTRAINT CK_VEICULOS_Tipo
        CHECK (TipoVeiculo IN ('Periódico', 'Congresso', 'Evento interno')),
    CONSTRAINT CK_VEICULOS_Abrangencia
        CHECK (Abrangencia IN ('Institucional', 'Regional', 'Nacional', 'Internacional'))
);
GO

-- Tabela PALAVRAS_CHAVE
CREATE TABLE PALAVRAS_CHAVE (
    IdPalavra   INT          NOT NULL,
    Termo       VARCHAR(60)  NOT NULL,
    CONSTRAINT PK_PALAVRAS_CHAVE PRIMARY KEY (IdPalavra),
    CONSTRAINT UQ_PALAVRAS_CHAVE_Termo UNIQUE (Termo)
);
GO

-- Tabela REFERENCIAS (referencias bibliograficas)
CREATE TABLE REFERENCIAS (
    IdReferencia     INT           NOT NULL,
    TextoReferencia  VARCHAR(500)  NOT NULL,
    TipoDocumento    VARCHAR(30)   NOT NULL,
    AnoPublicacao    SMALLINT      NULL,
    Link             VARCHAR(255)  NULL,
    CONSTRAINT PK_REFERENCIAS PRIMARY KEY (IdReferencia),
    CONSTRAINT CK_REFERENCIAS_Tipo
        CHECK (TipoDocumento IN ('Livro', 'Artigo', 'Site', 'Norma', 'Dissertação/Tese'))
);
GO


--------------------------------------------------------------------------------
-- TABELAS DE PESSOAS
--------------------------------------------------------------------------------

-- Tabela ALUNOS
CREATE TABLE ALUNOS (
    IdAluno       INT          NOT NULL,
    IdCurso       INT          NOT NULL,
    Matricula     VARCHAR(20)  NOT NULL,
    Nome          VARCHAR(120) NOT NULL,
    Email         VARCHAR(120) NOT NULL,
    DataIngresso  DATE         NOT NULL,
    CONSTRAINT PK_ALUNOS PRIMARY KEY (IdAluno),
    CONSTRAINT UQ_ALUNOS_Matricula UNIQUE (Matricula),
    CONSTRAINT UQ_ALUNOS_Email UNIQUE (Email),
    CONSTRAINT FK_ALUNOS_CURSOS FOREIGN KEY (IdCurso)
        REFERENCES CURSOS (IdCurso)
);
GO

-- Tabela PROFESSORES
CREATE TABLE PROFESSORES (
    IdProfessor     INT          NOT NULL,
    MatriculaSiape  VARCHAR(20)  NOT NULL,
    Nome            VARCHAR(120) NOT NULL,
    Email           VARCHAR(120) NOT NULL,
    Titulacao       VARCHAR(30)  NOT NULL,
    DataAdmissao    DATE         NOT NULL,
    Telefone        CHAR(11)     NULL,
    CONSTRAINT PK_PROFESSORES PRIMARY KEY (IdProfessor),
    CONSTRAINT UQ_PROFESSORES_Siape UNIQUE (MatriculaSiape),
    CONSTRAINT UQ_PROFESSORES_Email UNIQUE (Email),
    CONSTRAINT CK_PROFESSORES_Titulacao
        CHECK (Titulacao IN ('Especialista', 'Mestre', 'Doutor'))
);
GO


--------------------------------------------------------------------------------
-- TABELA CENTRAL
--------------------------------------------------------------------------------

-- Tabela PRODUCOES (producoes academicas)
-- IdVeiculo e opcional: nem toda producao foi apresentada ou publicada.
-- LinkArquivo guarda apenas o caminho/link; o documento nao fica no banco.
CREATE TABLE PRODUCOES (
    IdProducao    INT           NOT NULL,
    IdCurso       INT           NOT NULL,
    IdArea        INT           NOT NULL,
    IdTipo        INT           NOT NULL,
    IdVeiculo     INT           NULL,
    Titulo        VARCHAR(200)  NOT NULL,
    Resumo        VARCHAR(500)  NOT NULL,
    Ano           SMALLINT      NOT NULL,
    DataRegistro  DATE          NOT NULL,
    Situacao      VARCHAR(20)   NOT NULL,
    LinkArquivo   VARCHAR(255)  NULL,
    CONSTRAINT PK_PRODUCOES PRIMARY KEY (IdProducao),
    CONSTRAINT CK_PRODUCOES_Ano CHECK (Ano BETWEEN 2000 AND 2100),
    CONSTRAINT CK_PRODUCOES_Situacao
        CHECK (Situacao IN ('Em andamento', 'Concluída', 'Publicada', 'Cancelada')),
    CONSTRAINT FK_PRODUCOES_CURSOS FOREIGN KEY (IdCurso)
        REFERENCES CURSOS (IdCurso),
    CONSTRAINT FK_PRODUCOES_AREAS FOREIGN KEY (IdArea)
        REFERENCES AREAS_TEMATICAS (IdArea),
    CONSTRAINT FK_PRODUCOES_TIPOS FOREIGN KEY (IdTipo)
        REFERENCES TIPOS_PRODUCAO (IdTipo),
    CONSTRAINT FK_PRODUCOES_VEICULOS FOREIGN KEY (IdVeiculo)
        REFERENCES VEICULOS_PUBLICACAO (IdVeiculo)
);
GO


--------------------------------------------------------------------------------
-- TABELAS ASSOCIATIVAS E DE HISTORICO
--------------------------------------------------------------------------------

-- Tabela AUTORIAS (muitos-para-muitos entre PRODUCOES e ALUNOS)
CREATE TABLE AUTORIAS (
    IdProducao    INT       NOT NULL,
    IdAluno       INT       NOT NULL,
    OrdemAutoria  TINYINT   NOT NULL,
    CONSTRAINT PK_AUTORIAS PRIMARY KEY (IdProducao, IdAluno),
    CONSTRAINT UQ_AUTORIAS_Ordem UNIQUE (IdProducao, OrdemAutoria),
    CONSTRAINT CK_AUTORIAS_Ordem CHECK (OrdemAutoria >= 1),
    CONSTRAINT FK_AUTORIAS_PRODUCOES FOREIGN KEY (IdProducao)
        REFERENCES PRODUCOES (IdProducao),
    CONSTRAINT FK_AUTORIAS_ALUNOS FOREIGN KEY (IdAluno)
        REFERENCES ALUNOS (IdAluno)
);
GO

-- Tabela ORIENTACOES (muitos-para-muitos entre PRODUCOES e PROFESSORES)
CREATE TABLE ORIENTACOES (
    IdProducao      INT          NOT NULL,
    IdProfessor     INT          NOT NULL,
    TipoOrientacao  VARCHAR(15)  NOT NULL,
    CONSTRAINT PK_ORIENTACOES PRIMARY KEY (IdProducao, IdProfessor),
    CONSTRAINT CK_ORIENTACOES_Tipo
        CHECK (TipoOrientacao IN ('Orientador', 'Coorientador')),
    CONSTRAINT FK_ORIENTACOES_PRODUCOES FOREIGN KEY (IdProducao)
        REFERENCES PRODUCOES (IdProducao),
    CONSTRAINT FK_ORIENTACOES_PROFESSORES FOREIGN KEY (IdProfessor)
        REFERENCES PROFESSORES (IdProfessor)
);
GO

-- Tabela BANCAS (participacao de professores na avaliacao de uma producao)
-- Nota pode ser NULL enquanto a avaliacao nao foi lancada.
CREATE TABLE BANCAS (
    IdProducao     INT           NOT NULL,
    IdProfessor    INT           NOT NULL,
    Papel          VARCHAR(20)   NOT NULL,
    Nota           DECIMAL(4,2)  NULL,
    DataAvaliacao  DATE          NOT NULL,
    CONSTRAINT PK_BANCAS PRIMARY KEY (IdProducao, IdProfessor),
    CONSTRAINT CK_BANCAS_Papel
        CHECK (Papel IN ('Presidente', 'Avaliador', 'Suplente')),
    CONSTRAINT CK_BANCAS_Nota CHECK (Nota BETWEEN 0 AND 10),
    CONSTRAINT FK_BANCAS_PRODUCOES FOREIGN KEY (IdProducao)
        REFERENCES PRODUCOES (IdProducao),
    CONSTRAINT FK_BANCAS_PROFESSORES FOREIGN KEY (IdProfessor)
        REFERENCES PROFESSORES (IdProfessor)
);
GO

-- Tabela PRODUCAO_PALAVRA (muitos-para-muitos entre PRODUCOES e PALAVRAS_CHAVE)
CREATE TABLE PRODUCAO_PALAVRA (
    IdProducao  INT NOT NULL,
    IdPalavra   INT NOT NULL,
    CONSTRAINT PK_PRODUCAO_PALAVRA PRIMARY KEY (IdProducao, IdPalavra),
    CONSTRAINT FK_PRODPAL_PRODUCOES FOREIGN KEY (IdProducao)
        REFERENCES PRODUCOES (IdProducao),
    CONSTRAINT FK_PRODPAL_PALAVRAS FOREIGN KEY (IdPalavra)
        REFERENCES PALAVRAS_CHAVE (IdPalavra)
);
GO

-- Tabela PRODUCAO_REFERENCIA (muitos-para-muitos entre PRODUCOES e REFERENCIAS)
CREATE TABLE PRODUCAO_REFERENCIA (
    IdProducao    INT NOT NULL,
    IdReferencia  INT NOT NULL,
    CONSTRAINT PK_PRODUCAO_REFERENCIA PRIMARY KEY (IdProducao, IdReferencia),
    CONSTRAINT FK_PRODREF_PRODUCOES FOREIGN KEY (IdProducao)
        REFERENCES PRODUCOES (IdProducao),
    CONSTRAINT FK_PRODREF_REFERENCIAS FOREIGN KEY (IdReferencia)
        REFERENCES REFERENCIAS (IdReferencia)
);
GO

-- Tabela HISTORICO_STATUS (mudancas de situacao de cada producao)
CREATE TABLE HISTORICO_STATUS (
    IdHistorico       INT           NOT NULL,
    IdProducao        INT           NOT NULL,
    SituacaoAnterior  VARCHAR(20)   NULL,
    SituacaoNova      VARCHAR(20)   NOT NULL,
    DataAlteracao     DATE          NOT NULL,
    Observacao        VARCHAR(200)  NULL,
    CONSTRAINT PK_HISTORICO_STATUS PRIMARY KEY (IdHistorico),
    CONSTRAINT CK_HISTORICO_Anterior
        CHECK (SituacaoAnterior IN ('Em andamento', 'Concluída', 'Publicada', 'Cancelada')),
    CONSTRAINT CK_HISTORICO_Nova
        CHECK (SituacaoNova IN ('Em andamento', 'Concluída', 'Publicada', 'Cancelada')),
    CONSTRAINT FK_HISTORICO_PRODUCOES FOREIGN KEY (IdProducao)
        REFERENCES PRODUCOES (IdProducao)
);
GO


--------------------------------------------------------------------------------
-- Conferencia: lista as tabelas criadas
--------------------------------------------------------------------------------
SELECT  name        AS 'Nome da Tabela',
        create_date AS 'Data de Criação'
FROM sys.tables
ORDER BY name;
GO
