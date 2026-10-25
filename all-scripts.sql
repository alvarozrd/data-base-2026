SELECT NAME 
FROM sys.tables;

USE empresaCJ3037916

SELECT CONSTRAINT_CATALOG AS 'Banco de Dados',
        TABLE_NAME AS 'Nome da Tabela',
        CONSTRAINT_TYPE AS 'Tipo de Restrição',
        CONSTRAINT_NAME AS 'Nome da Restrição'
FROM tempdb.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME LIKE '#TabelaA%';

SELECT * 
        INTO FuncionariosCOPIA
    FROM FUNCIONARIOS;

SELECT * FROM FuncionariosCOPIA;

USE empresaCJ3037916

CREATE TABLE ##TabelaB (
    ID INT NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Sexo CHAR(1) NULL,
    PRIMARY KEY (ID)
);

INSERT INTO ##TabelaB VALUES
    (1, 'Marcelo Augusto', 'M'),
    (2, 'Guaraná Antártica', 'F');

SELECT * FROM ##TabelaB;-- Cria o banco de dados LojaIFSP


CREATE DATABASE LojaIFSP;
GO

USE LojaIFSP;
GO

-- Verifica se o banco LojaIFSP ainda nao existe.
-- Se nao existir, ele sera criado.

IF DB_ID(N'LojaIFSP') IS NULL
    CREATE DATABASE LojaIFSP;
GO

-- Seleciona o banco de dados LojaIFSP.
USE LojaIFSP;
GO

-- CRIACAO DA TABELA CLIENTES

CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sexo CHAR(1) NULL,
    Idade INT CHECK (Idade > 18) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(200) DEFAULT 'meu@email.com' NOT NULL
);

-- Explicacao das restricoes:

-- PRIMARY KEY: o ID identifica cada cliente. Nao pode repetir nem ser nulo.
-- NOT NULL: a coluna deve obrigatoriamente receber um valor.
-- NULL: a coluna pode ficar sem valor.
-- CHECK (Idade > 18): somente aceita clientes com mais de 18 anos.
-- UNIQUE: impede que dois clientes tenham o mesmo CPF.
-- DEFAULT: insere 'meu@email.com' quando o e-mail nao for informado.

-- INSERCAO DOS REGISTROS VALIDOS

INSERT INTO CLIENTES VALUES
    (1, 'Ana Cristina', 'F', 20, '11111111111', 'ana@gmail.com');
GO

-- Erro por repetir a mesma chave primaria

INSERT INTO CLIENTES VALUES 
    (1, 'Marcos Paulo', 'M', 45, '22222222222', 'marcos@gmail.com');
GO

INSERT INTO CLIENTES VALUES
    (3, 'André Luis', 'M', 15, '33333333333', 'andre@gmail.com');
GO

INSERT INTO CLIENTES VALUES
    (4, 'Maria Clara', NULL, 22, '44444444444', 'maria@gmail.com');
GO

-- Erro, devido ao valor repetido do CPF
INSERT INTO CLIENTES VALUES 
    (5, 'Pedro Augusto', 'M', 45, '11111111111', 'pedro@gmail.com');
GO

-- Erro, devido ao valor do CPF nulo
INSERT INTO CLIENTES VALUES
    (6, 'Ricardo Lima', 'M', 52, NULL, 'ricardo@gmail.com');
GO

-- Erro, devido ao valor da chave primaria ser nulo
INSERT INTO CLIENTES VALUES
    (NULL, 'José Pereira', 'M', 45, '77777777777', 'jose@gmail.com');
GO

-- O e-mail foi omitido. O banco usara o valor DEFAULT.
INSERT INTO CLIENTES VALUES 
    (9, 'Daphne Lima', 'F', 32, '99999999999');
GO

-- Exibe todos os registros da tabela
SELECT * FROM CLIENTES;
GO

-- Insere os registros com correção

-- Insercao dos registros que foram corrigidos.
INSERT INTO CLIENTES VALUES
    (2, 'Marcos Paulo', 'M', 45, '22222222222', 'marcos@gmail.com'),
    (3, 'Andre Luis', 'M', 25, '33333333333', 'andre@gmail.com'),
    (5, 'Pedro Augusto', 'M', 45, '55555555555', 'pedro@gmail.com'),
    (6, 'Ricardo Lima', 'M', 52, '66666666666', 'ricardo@gmail.com'),
    (7, 'Jose Pereira', 'M', 45, '77777777777', 'marcos@gmail.com'),
    (8, 'Marcelo Souza', 'M', 56, '88888888888', 'marcelo@gmail.com'),
    (10, 'Sheila Pereira', NULL, 21, '10101010101', 'sheila@yahoo.com.br'),
    (11, 'Tiago Augusto', NULL, 72, '20202020202', 'tiago@yahoo.com.br'),
    (12, 'Maria Pereira', 'F', 45, '30303030303', 'maria@bol.com.br');
GO

-- Estes clientes nao receberam e-mail.
-- O SQL Server preenchera o campo com 'meu@email.com'.
INSERT INTO CLIENTES (ID, Nome, Sexo, Idade, CPF) VALUES
    (13, 'Lucas Silva', 'M', 19, '40404040404'),
    (14, 'Benedito Silva', NULL, 44, '50505050505'),
    (15, 'Fernanda Pereira', 'F', 31, '60606060606');
GO

-- Exibe todos os registros da tabela
SELECT * FROM CLIENTES;
GO

-- Exibe informações sobre a estrutura da tabela
SELECT TABLE_CATALOG        AS 'Banco de Dados',
       TABLE_NAME           AS 'Tabela',
       ORDINAL_POSITION     AS 'Posição',
       COLUMN_NAME          AS 'Coluna',
       DATA_TYPE            AS 'Tipo de Dados',
       COLLATION_NAME       AS 'Idioma da Coluna',
       IS_NULLABLE          AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CLIENTES';
GO 

-- Exibe informações sobre as restrições da tabela
SELECT CONSTRAINT_CATALOG   AS 'Banco de Dados',
       TABLE_NAME           AS 'Tabela',
       CONSTRAINT_TYPE      AS 'Tipo de Restrição',
       CONSTRAINT_NAME      AS 'Nome da Restrição'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'CLIENTES';
GO

-- Verifica a estrutura da tabela, utilizando o comando
-- SP_HELP
EXEC sp_help 'CLIENTES';
GO

-- QUESTAO 1

-- Enunciado resumido:
-- Exibir todos os registros e todos os dados dos clientes cadastrados.

-- Resposta:

SELECT * FROM CLIENTES;
GO

-- Explicacao:
-- SELECT realiza a consulta. O asterisco (*) solicita todas as colunas e
-- FROM CLIENTES informa de qual tabela os dados serao obtidos.

-- QUESTAO 2

-- Enunciado resumido:
-- Exibir todos os dados dos clientes em ordem alfabetica pelo nome.

-- Resposta:

SELECT * FROM CLIENTES
ORDER BY Nome ASC;

-- Explicacao:
-- ORDER BY Nome organiza o resultado pelo nome. ASC representa a ordem
-- crescente e, para textos, corresponde a ordem alfabetica de A ate Z.
-- O ASC poderia ser omitido porque e a ordenacao padrao do SQL Server.

-- QUESTÃO 3 

-- Enunciado resumido:
-- Exibir todos os dados dos clientes em ordem crescente de idade.

-- Resposta:

SELECT * FROM CLIENTES
ORDER BY Idade ASC;

-- Explicacao:
-- Os clientes mais novos aparecerao antes dos clientes mais 
-- velhos.

-- QUESTÃO 4
-- Enunciado resumido:
-- Exibir todos os dados dos clientes, apresentando os mais velhos primeiro.

-- Resposta:

SELECT * FROM CLIENTES
ORDER BY Idade DESC;

-- Explicacao:
-- DESC significa ordem decrescente. Assim, a maior idade 
-- aparece primeiro.

-- QUESTÃO 5

-- Enunciado resumido:
-- Ordenar por sexo e idade, fazendo os clientes do sexo masculino
-- aparecerem primeiro.

-- Resposta:

SELECT * FROM CLIENTES
ORDER BY
    CASE
        WHEN Sexo = 'M' THEN 1
        WHEN Sexo = 'F' THEN 2
        ELSE 3
    END,
    Idade ASC;

-- Explicacao:
-- O CASE cria uma ordem para os grupos sem alterar a tabela:

-- Sexo masculino ('M') recebe a posicao 1;
-- Sexo feminino ('F') recebe a posicao 2;
-- Sexo nao informado (NULL) recebe a posicao 3.

-- Depois de separar os clientes por sexo, Idade ASC organiza as pessoas de
-- cada grupo da menor para a maior idade.


-- QUESTAO 6

-- Enunciado resumido:
-- Exibir somente o nome, a idade e o e-mail de todos os clientes.

-- Resposta:

SELECT Nome, Idade, Email
FROM CLIENTES;

-- Explicacao:
-- Como a questao pede colunas especificas, seus nomes sao escritos depois
-- do SELECT, separados por virgulas. Nao se utiliza o asterisco.


-- QUESTAO 7

-- Enunciado resumido:
-- Exibir nome, idade e e-mail dos clientes, em ordem alfabetica pelo nome.

-- Resposta:

SELECT Nome, Idade, Email
FROM CLIENTES
ORDER BY Nome ASC;

-- Explicacao:
-- O SELECT escolhe somente as tres colunas solicitadas. O ORDER BY organiza
-- os registros pelo nome, de A ate Z.


-- QUESTAO 8

-- Enunciado resumido:
-- Exibir ID, nome, idade e e-mail dos clientes cujo ID seja maior ou igual
-- a 10. A coluna ID deve aparecer com o titulo "Codigo do Cliente".

-- Resposta:

SELECT
    ID AS 'Codigo do Cliente',
    Nome,
    Idade,
    Email
FROM CLIENTES
WHERE ID >= 10;

-- Explicacao:
-- WHERE ID >= 10 filtra os registros e aceita somente IDs iguais ou
-- superiores a 10. AS cria um alias, isto e, um titulo temporario para a
-- coluna no resultado. O nome verdadeiro da coluna continua sendo ID.


-- QUESTAO 9

-- Enunciado resumido:
-- Ordenar os clientes pelo nome e retornar somente os cinco primeiros.
-- Exibir ID, nome, idade e e-mail, usando "Codigo do Cliente" no lugar de ID.

-- Resposta:

SELECT TOP 5
    ID AS 'Codigo do Cliente',
    Nome,
    Idade,
    Email
FROM CLIENTES
ORDER BY Nome ASC;

-- Explicacao:
-- ORDER BY Nome ASC coloca os clientes em ordem alfabetica. TOP 5 limita o
-- resultado aos cinco primeiros registros dessa ordenacao. TOP e utilizado
-- pelo Microsoft SQL Server.


-- QUESTAO 10

-- Enunciado resumido:
-- Exibir os clientes do sexo masculino que possuem mais de 30 anos,
-- ordenados pelo nome. Mostrar ID, nome, sexo, idade e e-mail. Utilizar os
-- aliases "Codigo do Cliente" e "E-mail".

-- Resposta:

SELECT
    ID AS 'Codigo do Cliente',
    Nome,
    Sexo,
    Idade,
    Email AS 'E-mail'
FROM CLIENTES
WHERE Idade > 30
  AND Sexo = 'M'
ORDER BY Nome ASC;

-- Explicacao:
-- WHERE define os filtros da consulta. O operador AND exige que as duas
-- condicoes sejam verdadeiras ao mesmo tempo:

--  o cliente deve possuir mais de 30 anos;
-- o sexo do cliente deve ser masculino ('M').

-- ORDER BY Nome ASC apresenta o resultado em ordem alfabetica.-- habilita o contexto do banco Loja IFSP
IF DB_ID (N'LojaIFSP') IS NULL
    PRINT 'O Bando de Dados LojaIFSP não existe!';
ELSE
    USE LojaIFSP;
GO

-- Exibe a data de criação e o nome das tabelas
-- que existem no banco de dados em uso

SELECT  create_date AS 'Data de Criação',
        name AS 'Nome da Tabela'
FROM sys.tables;
GO 

-- exibe infos sobre a estrutura da tabela
SELECT  TABLE_CATALOG       AS 'Banco de Dados',
        TABLE_NAME          AS 'Tabela',
        ORDINAL_POSITION    AS 'Posição',
        COLUMN_NAME         AS 'Coluna',
        DATA_TYPE           AS 'Tipo de dado',
        COLLATION_NAME      AS 'Tipo de Coluna',
        IS_NULLABLE         AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CLIENTES';
GO

-- exibe todos os registros da tabela CLIENTES
SELECT * FROM CLIENTES;
GO

-- EXERCICIOSSSS

-- QUESTAO 1
-- Alterar a estrutura da tabela CLIENTES, adicionando as colunas DDD e
-- Telefone. A coluna DDD deve usar CHAR(2), e a coluna Telefone deve usar
-- CHAR(10).

ALTER TABLE CLIENTES
    ADD DDD CHAR(2) NULL,
        Telefone CHAR(10) NULL;
GO

-- ALTER TABLE modifica a estrutura de uma tabela ja existente.
-- ADD indica que novas colunas serao adicionadas.
-- As colunas foram definidas como NULL para permitir que existam clientes
-- sem codigo de area ou sem telefone cadastrado.
-- CHAR(2) armazena exatamente 2 caracteres para o DDD.
-- CHAR(10) armazena exatamente 10 caracteres para o telefone.

-- A consulta abaixo mostra novamente a estrutura da tabela CLIENTES para
-- verificar se as colunas DDD e Telefone foram adicionadas corretamente.

SELECT  TABLE_CATALOG       AS 'Banco de Dados',
        TABLE_NAME          AS 'Tabela',
        ORDINAL_POSITION    AS 'Posicao',
        COLUMN_NAME         AS 'Coluna',
        DATA_TYPE           AS 'Tipo de Dado',
        COLLATION_NAME      AS 'Tipo de Coluna',
        IS_NULLABLE         AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CLIENTES';
GO

-- QUESTAO 2
-- Atualizar os registros dos clientes cadastrados, preenchendo os campos DDD
-- e Telefone.

-- Observacao:
-- A figura 03 nao esta no repositorio. Por isso, os valores abaixo foram
-- organizados de forma coerente com os registros criados na lista 02 e com as
-- questoes seguintes desta lista. Alguns clientes ficam sem DDD ou com DDD
-- igual a 11 para que a questao 5 possa demonstrar a exclusao solicitada.


UPDATE CLIENTES SET DDD = '35', Telefone = '997040800' WHERE ID = 1;
UPDATE CLIENTES SET DDD = '11', Telefone = '366815500' WHERE ID = 2;
UPDATE CLIENTES SET DDD = '35', Telefone = '998010200' WHERE ID = 3;
UPDATE CLIENTES SET DDD = NULL, Telefone = '366450000' WHERE ID = 4;
UPDATE CLIENTES SET DDD = '11', Telefone = '366420010' WHERE ID = 5;
UPDATE CLIENTES SET DDD = '35', Telefone = '997770600' WHERE ID = 6;
UPDATE CLIENTES SET DDD = NULL, Telefone = '366390000' WHERE ID = 7;
UPDATE CLIENTES SET DDD = '19', Telefone = '996660800' WHERE ID = 8;
UPDATE CLIENTES SET DDD = '35', Telefone = '999990900' WHERE ID = 9;
UPDATE CLIENTES SET DDD = '35', Telefone = '366215150' WHERE ID = 10;
UPDATE CLIENTES SET DDD = '11', Telefone = '995551100' WHERE ID = 11;
UPDATE CLIENTES SET DDD = '15', Telefone = '994441200' WHERE ID = 12;
UPDATE CLIENTES SET DDD = '35', Telefone = NULL        WHERE ID = 13;
UPDATE CLIENTES SET DDD = NULL, Telefone = NULL        WHERE ID = 14;
UPDATE CLIENTES SET DDD = NULL, Telefone = '993331500' WHERE ID = 15;
GO

-- UPDATE altera os dados de registros ja cadastrados.
-- SET informa quais colunas receberao novos valores.
-- WHERE ID = ... garante que apenas o cliente indicado seja atualizado.
-- Quando DDD ou Telefone recebe NULL, significa que o dado nao foi cadastrado.

-- A consulta abaixo exibe os clientes depois das atualizacoes.

SELECT ID, Nome, DDD, Telefone
FROM CLIENTES
ORDER BY ID ASC;
GO

-- QUESTAO 3
-- Copiar os dados da tabela CLIENTES para uma tabela temporaria global chamada
-- ##clientesCOPIA, adicionar uma chave primaria nomeada na coluna ID e exibir
-- as restricoes existentes nessa nova tabela.

SELECT *
INTO ##clientesCOPIA
FROM CLIENTES;
GO

ALTER TABLE ##clientesCOPIA
    ADD CONSTRAINT PK_clientesCOPIA PRIMARY KEY (ID);
GO

SELECT  tc.CONSTRAINT_CATALOG AS 'Banco de Dados',
        tc.TABLE_NAME         AS 'Tabela',
        tc.CONSTRAINT_TYPE    AS 'Tipo de Restricao',
        tc.CONSTRAINT_NAME    AS 'Nome da Restricao'
FROM tempdb.INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
WHERE tc.TABLE_NAME LIKE '##clientesCOPIA%';
GO

-- SELECT INTO cria uma nova tabela com base no resultado de uma consulta.
-- Como a questao pede uma tabela temporaria global no SQL Server, o nome da
-- tabela recebe dois sinais de cerquilha: ##clientesCOPIA.
-- A tabela temporaria global pode ser acessada por outras sessoes enquanto
-- a sessao que a criou ainda estiver aberta.
-- ALTER TABLE ADD CONSTRAINT cria a restricao PK_clientesCOPIA.
-- PRIMARY KEY (ID) define a coluna ID como identificador unico da tabela.
-- A consulta em tempdb.INFORMATION_SCHEMA.TABLE_CONSTRAINTS exibe as
-- restricoes da tabela temporaria, pois tabelas temporarias ficam no tempdb.

-- QUESTAO 4
-- Copiar para uma nova tabela chamada CLIENTES2 apenas os clientes que possuem
-- telefone cadastrado.

SELECT *
INTO CLIENTES2
FROM CLIENTES
WHERE Telefone IS NOT NULL;
GO

-- SELECT INTO cria a tabela CLIENTES2 e copia os dados selecionados.
-- WHERE Telefone IS NOT NULL filtra apenas os clientes cujo telefone foi
-- preenchido. Registros com telefone NULL ficam fora da copia.

-- A consulta abaixo exibe os registros inseridos na tabela CLIENTES2.

SELECT *
FROM CLIENTES2
ORDER BY ID ASC;
GO

-- QUESTAO 5
-- Remover da tabela CLIENTES2 os clientes que nao possuem DDD cadastrado ou
-- cujo DDD seja igual a 11. Exibir a tabela antes e depois da exclusao.


-- Antes da exclusao:
SELECT *
FROM CLIENTES2
ORDER BY ID ASC;
GO

DELETE FROM CLIENTES2
WHERE DDD IS NULL
   OR DDD = '11';
GO

-- Depois da exclusao:
SELECT *
FROM CLIENTES2
ORDER BY ID ASC;
GO

-- Explicacao:
-- DELETE remove registros de uma tabela.
-- WHERE limita a exclusao somente aos registros que atendem ao criterio.
-- DDD IS NULL identifica clientes sem codigo de area cadastrado.
-- OR DDD = '11' tambem remove clientes cujo codigo de area seja 11.
-- O operador OR significa que basta uma das condicoes ser verdadeira para o
-- registro ser excluido.

-- QUESTAO 6
-- Excluir todos os registros da tabela CLIENTES2 usando TRUNCATE.

TRUNCATE TABLE CLIENTES2;
GO
-- TRUNCATE TABLE remove todos os registros da tabela de forma direta.
-- Diferentemente do DELETE usado sem WHERE, o TRUNCATE nao remove linha por
-- linha e nao permite escolher registros especificos.
-- A estrutura da tabela CLIENTES2 continua existindo, mas fica sem dados.


-- A consulta abaixo mostra que a tabela CLIENTES2 ficou vazia.

SELECT *
FROM CLIENTES2;
GO

-- QUESTAO 7

-- Excluir a tabela CLIENTES2.

DROP TABLE CLIENTES2;
GO

-- DROP TABLE remove a tabela inteira do banco de dados.
-- Depois desse comando, a estrutura e os registros de CLIENTES2 deixam de
-- existir. Para usar CLIENTES2 novamente, seria necessario cria-la outra vez.

-- QUESTAO 8

-- Atualizar a cliente Fernanda Pereira, alterando o e-mail para
-- fernanda.pereira@uol.com.br e o DDD para 15. Depois, exibir o conteudo da
-- tabela CLIENTES.


UPDATE CLIENTES
SET Email = 'fernanda.pereira@uol.com.br',
    DDD = '15'
WHERE Nome = 'Fernanda Pereira';
GO

SELECT *
FROM CLIENTES
ORDER BY ID ASC;
GO

-- UPDATE altera os dados da cliente ja cadastrada.
-- SET modifica as colunas Email e DDD ao mesmo tempo.
-- WHERE Nome = 'Fernanda Pereira' limita a alteracao apenas a essa cliente.
-- A consulta SELECT final exibe todos os registros da tabela CLIENTES depois
-- da atualizacao.
USE empresaCJ3037916;

IF DB_ID (N'LojaIFSP') IS NULL
CREATE DATABASE LojaIESP;
ELSE
USE LojaIFSP;   
-- Autor: Álvaro Pereira
-- Arquivo: script-aula05.sql

USE empresaCJ3037916;

SELECT create_date AS 'Data de Criação',
name AS 'Nome da Tabela'
FROM sys.tables;

SELECT * FROM FUNCIONARIOS;

ALTER TABLE FUNCIONARIOS 
    ADD Telefone CHAR(10);

SELECT * FROM FUNCIONARIOS;

SELECT  TABLE_CATALOG    AS 'Banco de dados',
        TABLE_NAME       AS 'Tabela',
        ORDINAL_POSITION AS 'Posição',
        COLUMN_NAME      AS 'Coluna',
        DATA_TYPE        AS 'Tipo de Dados',
        COLLATION_NAME   AS 'Idioma da Coluna',
        IS_NULLABLE      AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FUNCIONÁRIOS';

ALTER TABLE FUNCIONARIOS
    ADD Telefone CHAR(10);

UPDATE FUNCIONARIOS
    SET Telefone = '359970408'
    WHERE ID = 1;

SELECT * FROM FUNCIONARIOS;

--Atualiza o telefone de alguns funcionarios
UPDATE FUNCIONARIOS SET Telefone ='3668-1550' WHERE ID =2;
UPDATE FUNCIONARIOS SET Telefone ='3664-5000' WHERE ID =4;
UPDATE FUNCIONARIOS SET Telefone ='3664-2001' WHERE ID =5;
UPDATE FUNCIONARIOS SET Telefone ='3663-9000' WHERE ID =7;
UPDATE FUNCIONARIOS SET Telefone ='3663-7000' WHERE ID =9;
UPDATE FUNCIONARIOS SET Telefone ='3662-1515' WHERE ID =10;

SELECT * FROM FUNCIONARIOS;

UPDATE FUNCIONARIOS 
    SET Salario = Salario * 1.10
    WHERE YEAR(Admissao) < 2020;

SELECT * FROM FUNCIONARIOS;

SELECT * FROM FuncionariosCOPIA
WHERE Salario < 2000;

UPDATE FUNCIONARIOS
    SET Nome = 'Rochelle Styles'
WHERE Nome = 'Ricardo Styles';

SELECT * FROM FUNCIONARIOS; 

TRUNCATE TABLE FuncionariosCOPIA;

USE empresaCJ3037916;

SELECT * FROM FUNCIONARIOS
WHERE Sexo != 'M';


SELECT * FROM FUNCIONARIOS
WHERE Sexo <> 'M';


SELECT * FROM FUNCIONARIOS
WHERE NOT Sexo = 'M';


SELECT * FROM FUNCIONARIOS
WHERE Salario >= 1000 AND
      Salario <= 2000;


SELECT * FROM FUNCIONARIOS
WHERE Salario BETWEEN 1000 AND 2000;


SELECT * FROM FUNCIONARIOS
WHERE Telefone IS NULL;


SELECT * FROM FUNCIONARIOS
WHERE Telefone IS NOT NULL;


IF EXISTS (
    SELECT * FROM FUNCIONARIOS
    WHERE Salario > 30000
)
    PRINT 'Alguém recebe acima de R$ 30.000,00'
ELSE 
    PRINT 'Ninguém recebe acima de R$ 30.000,00';


SELECT * FROM FUNCIONARIOS
WHERE   ID = 1 OR
        ID = 2 OR 
        ID = 5;


SELECT * FROM FUNCIONARIOS
WHERE ID IN (1, 2, 5);

SELECT * FROM FUNCIONARIOS 
WHERE Salario IN (
    SELECT Salario
    FROM FUNCIONARIOS
    WHERE Salario > 2000.00
);

SELECT * FROM FUNCIONARIOS 
WHERE Nome LIKE 'M%';

-- to upper!
SELECT * FROM FUNCIONARIOS
WHERE UPPER(Nome) Like '%CAMPESTRIM'
ORDER BY Nome;

SELECT * FROM FUNCIONARIOS 
WHERE Nome LIKE '[^A]%'
ORDER BY Nome;

GO

CREATE VIEW MaioresSalarios AS  
    SELECT ID AS 'Código do Funcionário',
           Nome,
           Sexo,
           Salario AS 'Salário'
    FROM FUNCIONARIOS;

GO

SELECT * FROM MaioresSalarios;
SELECT  [Código do Funcionário],
        Nome,
        [Salário]
FROM MaioresSalarios;

GO

ALTER VIEW MaioresSalarios AS 
    SELECT ID AS [Código do Funcionário],
           Nome, 
           Sexo AS [Sexo do funcionário],
           Salario AS [Salário]
    FROM FUNCIONARIOS
GO


SELECT * FROM MaioresSalarios
ORDER BY [Salário] DESC;


SELECT [Código do Funcionário],
        Nome,
        "Sexo do funcionário",
        Salário
FROM MaioresSalarios
Where Salário > 1500;

EXEC sp_helptext MaioresSalarios;
DROP VIEW MaioresSalarios;


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



SELECT      Nome AS 'Nome',
            ID   AS 'Código',
            Ende  AS 'Endereço'
FROM table1;
GO 



SELECT      T1.Nome AS 'Nome',
            T1.ID   AS 'Código',
            T1.Ende  AS 'Endereço',
            T2.amount AS 'Salário'

FROM table1 T1 JOIN table2 T2 ON T1.ID = T2.Id-funci;


-- Habilita o contexto
USE empresaCJ3037916;
GO

SELECT * FROM FUNCIONARIOS

--------------------------------------------------------------------------------
-- 01-Intercambio.sql
-- Script para criar o banco de dados INTERCAMBIO
--------------------------------------------------------------------------------


-- Habilita o contexto do banco de dados MASTER
USE Master;
GO


-- Cria o banco de dados INTERCAMBIO, caso ele não exista
IF DB_ID(N'INTERCAMBIO') IS NULL
    CREATE DATABASE INTERCAMBIO_alp;
GO


-- Habilita o contexto do banco de dados INTERCAMBIO
USE INTERCAMBIO_alp;
GO


--------------------------------------------------------------------------------
-- Criação das tabelas
--------------------------------------------------------------------------------


-- Tabela PAISES (Código ISO3)
CREATE TABLE PAISES (
    CodPais CHAR(3) PRIMARY KEY,
    NomePais VARCHAR(255) NOT NULL,
    IdiomaPais VARCHAR(50) NULL
);
GO


-- Tabela VIAGENS
CREATE TABLE VIAGENS (
    CodViagem INT PRIMARY KEY,
    DataSaida DATE NOT NULL,
    DataRetorno DATE NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    PaisDestino CHAR(3) NOT NULL FOREIGN KEY REFERENCES PAISES(CodPais)
);
GO


-- Tabela ALUNOS
CREATE TABLE ALUNOS (
    CodAluno INT IDENTITY PRIMARY KEY,
    NomeAluno CHAR(20) NOT NULL,
    DataNasc DATE NOT NULL,
    Endereco VARCHAR(60) NOT NULL,
    Telefone CHAR(12) NOT NULL,
    Genero CHAR(1) NULL,
    PaisOrigem CHAR(3) NOT NULL FOREIGN KEY REFERENCES PAISES(CodPais),
    CodViagem INT NOT NULL FOREIGN KEY REFERENCES VIAGENS(CodViagem)
);
GO


-- Tabela AlunosCOPIA
-- Essa tabela será utilizada apenas para demonstrar os operadores do conjunto relacional
CREATE TABLE AlunosCOPIA (
    CodAluno INT IDENTITY PRIMARY KEY,
    NomeAluno CHAR(20) NOT NULL,
    DataNasc DATE NOT NULL,
    Endereco VARCHAR(60) NOT NULL,
    Telefone CHAR(12) NOT NULL,
    Genero CHAR(1),
    PaisOrigem CHAR(3) NOT NULL FOREIGN KEY REFERENCES PAISES(CodPais),
    CodViagem INT NOT NULL FOREIGN KEY REFERENCES VIAGENS(CodViagem)
);
GO


-- Exibe o nome das tabelas que existem no banco de dados em uso
SELECT name 
FROM sys.tables;
GO



--------------------------------------------------------------------------------
-- Inserção dos dados
--------------------------------------------------------------------------------


-- Insere 244 registros na tabela PAISES
INSERT INTO PAISES VALUES 
    ('AFG', 'Afeganistão', 'Dari e Pashtu'),
    ('ZAF', 'África do Sul', 'Inglês'),
    ('ALA', 'Aland, Ilhas', 'Sueco'),
    ('ALB', 'Albânia', 'Albanês'),
    ('DEU', 'Alemanha', 'Alemão'),
    ('AND', 'Andorra', 'Catalão'),
    ('AGO', 'Angola', 'Português'),
    ('AIA', 'Anguilla', 'Inglês'),
    ('ATA', 'Antártida', NULL),
    ('ATG', 'Antigua e Barbuda', 'Inglês'),
    ('ANT', 'Antilhas Holandesas', 'Papiamento, Neerlandês e Inglês'),
    ('SAU', 'Arábia Saudita', 'Árabe'),
    ('DZA', 'Argélia', 'Árabe'),
    ('ARG', 'Argentina', 'Espanhol'),
    ('ARM', 'Armênia', 'Armênio'),
    ('ABW', 'Aruba', 'Neerlandês e Papiamento'),
    ('AUS', 'Austrália', 'Inglês'),
    ('AUT', 'Áustria', 'Alemão'),
    ('AZE', 'Azerbeijão', 'Azeri'),
    ('BHS', 'Bahamas', 'Inglês'),
    ('BHR', 'Bahrein', 'Árabe e Inglês'),
    ('BGD', 'Bangladesh', 'Bengali'),
    ('BRB', 'Barbados', 'Inglês'),
    ('BEL', 'Bélgica', 'Neerlandês, Francês e Alemão'),
    ('BLZ', 'Belize', 'Inglês'),
    ('BEN', 'Benin', 'Francês'),
    ('BMU', 'Bermudas', 'Inglês'),
    ('BLR', 'Bielo-Rússia', 'Russo'),
    ('BOL', 'Bolívia', 'Espanhol'),
    ('BIH', 'Bósnia-Herzegovina', 'Bósnio, Croata e Sérvio'),
    ('BWA', 'Botswana', 'Inglês'),
    ('BVT', 'Bouvet, Ilha', NULL),
    ('BRA', 'Brasil', 'Português'),
    ('BRN', 'Brunei', 'Malaio'),
    ('BGR', 'Bulgária', 'Búlgaro'),
    ('BFA', 'Burkina Faso', 'Francês'),
    ('BDI', 'Burundi', 'Francês'),
    ('BTN', 'Butão', 'Dzonka'),
    ('CPV', 'Cabo Verde', 'Português'),
    ('KHM', 'Cambodja', 'Khmer'),
    ('CMR', 'Camarões', 'Inglês e Francês'),
    ('CAN', 'Canadá', 'Inglês e Francês'),
    ('CYM', 'Cayman, Ilhas', 'Inglês'),
    ('KAZ', 'Cazaquistão', 'Russo'),
    ('CAF', 'Centro-africana, República', 'Francês e Sangho'),
    ('TCD', 'Chade', 'Francês'),
    ('CZE', 'Checa, República', 'Tcheco'),
    ('CHL', 'Chile', 'Espanhol'),
    ('CHN', 'China', 'Chinês'),
    ('CYP', 'Chipre', 'Grego'),
    ('CXR', 'Christmas, Ilha', 'Inglês, Chinês e Malaio'),
    ('CCK', 'Cocos, Ilhas', 'Inglês'),
    ('COL', 'Colômbia', 'Espanhol'),
    ('COM', 'Comores', 'Árabe'),
    ('COG', 'Congo, República do', 'Francês'),
    ('COD', 'Congo, República Democrática do (antigo Zaire),', 'Francês'),
    ('COK', 'Cook, Ilhas', 'Inglês e Maori'),
    ('KOR', 'Coréia do Sul', 'Coreano'),
    ('PRK', 'Coréia, República Democrática da (Coréia do Norte),', 'Coreano'),
    ('CIV', 'Costa do Marfim', 'Francês'),
    ('CRI', 'Costa Rica', 'Espanhol'),
    ('HRV', 'Croácia', 'Croata'),
    ('CUB', 'Cuba', 'Castelhano ou Espanhol'),
    ('DNK', 'Dinamarca', 'Dinamarquês'),
    ('DJI', 'Djibouti', 'Francês'),
    ('DMA', 'Dominica', 'Inglês'),
    ('DOM', 'Dominicana, República', 'Espanhol'),
    ('EGY', 'Egito', 'Árabe'),
    ('SLV', 'El Salvador', 'Espanhol'),
    ('ARE', 'Emirados Árabes Unidos', 'Árabe'),
    ('ECU', 'Equador', 'Espanhol'),
    ('ERI', 'Eritreia', 'Amárico'),
    ('SVK', 'Eslováquia', 'Eslovaco'),
    ('SVN', 'Eslovênia', 'Esloveno'),
    ('ESP', 'Espanha', 'Castelhano ou Espanhol'),
    ('USA', 'Estados Unidos da América', 'Inglês'),
    ('EST', 'Estônia', 'Estônio'),
    ('ETH', 'Etiópia', 'Amárico'),
    ('FRO', 'Faroe, Ilhas', 'Feroês e Dinamarquês'),
    ('FJI', 'Fiji', 'Inglês'),
    ('PHL', 'Filipinas', 'Inglês'),
    ('FIN', 'Finlândia', 'Finlandês'),
    ('FRA', 'França', 'Francês'),
    ('GAB', 'Gabão', 'Francês'),
    ('GMB', 'Gâmbia', 'Inglês'),
    ('GHA', 'Gana', 'Inglês'),
    ('GEO', 'Geórgia', 'Georgiano'),
    ('SGS', 'Geórgia do Sul e Sandwich do Sul, Ilhas', 'Inglês'),
    ('GIB', 'Gibraltar', 'Inglês'),
    ('GRC', 'Grécia', 'Grego'),
    ('GRD', 'Granada', 'Inglês'),
    ('GRL', 'Groenlândia', 'Groenlandês'),
    ('GLP', 'Guadalupe', 'Francês'),
    ('GUM', 'Guam', 'Inglês e Chamorro'),
    ('GTM', 'Guatemala', 'Espanhol'),
    ('GGY', 'Guernsey', 'Inglês e Francês'),
    ('GUY', 'Guiana', 'Inglês'),
    ('GUF', 'Guiana Francesa', 'Francês'),
    ('GNB', 'Guiné-Bissau', 'Português'),
    ('GIN', 'Guiné-Conacri', 'Francês'),
    ('GNQ', 'Guiné Equatorial', 'Espanhol'),
    ('HTI', 'Haiti', 'Francês e Crioulo'),
    ('HMD', 'Heard e McDonald, Ilhas', NULL),
    ('HND', 'Honduras', 'Espanhol'),
    ('HKG', 'Hong Kong', 'Chinês e Inglês'),
    ('HUN', 'Hungria', 'Húngaro'),
    ('YEM', 'Iêmen', 'Árabe'),
    ('IND', 'Índia', 'Inglês e Hindi'),
    ('IDN', 'Indonésia', 'Bahasa'),
    ('IRQ', 'Iraque', 'Árabe'),
    ('IRN', 'Irã', 'Persa'),
    ('IRL', 'Irlanda', 'Inglês'),
    ('ISL', 'Islândia', 'Inglês'),
    ('ISR', 'Israel', 'Hebraico'),
    ('ITA', 'Itália', 'Italiano'),
    ('JAM', 'Jamaica', 'Inglês'),
    ('JPN', 'Japão', 'Japonês'),
    ('JEY', 'Jérsei', 'Inglê, Francês e Jérriais'),
    ('JOR', 'Jordânia', 'Árabe'),
    ('KIR', 'Kiribati', 'Inglês'),
    ('KWT', 'Kuwait', 'Árabe'),
    ('LAO', 'Laos', 'Lao'),
    ('LSO', 'Lesoto', 'Inglês'),
    ('LVA', 'Letônia', 'Letão'),
    ('LBN', 'Líbano', 'Árabe'),
    ('LBR', 'Libéria', 'Inglês'),
    ('LBY', 'Líbia', 'Árabe'),
    ('LIE', 'Liechtenstein', 'Alemão'),
    ('LTU', 'Lituânia', 'Lituano'),
    ('LUX', 'Luxemburgo', 'Francês'),
    ('MAC', 'Macau', 'Chinês e Português'),
    ('MKD', 'Macedônia, República da', 'Macedónio'),
    ('MDG', 'Madagascar', 'Francês e Malgaxe'),
    ('MYS', 'Malásia', 'Malaio'),
    ('MWI', 'Malawi', 'Inglês'),
    ('MDV', 'Maldivas', 'Divehi'),
    ('MLI', 'Mali', 'Francês'),
    ('MLT', 'Malta', 'Inglês'),
    ('FLK', 'Malvinas, Ilhas', 'Inglês'),
    ('IMN', 'Man, Ilha de', 'Inglês e Manx'),
    ('MNP', 'Marianas Setentrionais', 'Inglês, Chamorro, Carolínio e Japonês'),
    ('MAR', 'Marrocos', 'Árabe'),
    ('MHL', 'Marshall, Ilhas', 'Inglês'),
    ('MTQ', 'Martinica', 'Francês'),
    ('MUS', 'Maurícia', 'Inglês'),
    ('MRT', 'Mauritânia', 'Árabe'),
    ('MYT', 'Maiote', 'Francês'),
    ('UMI', 'Menores Distantes dos Estados Unidos, Ilhas', NULL),
    ('MEX', 'México', 'Espanhol ou Castelhano'),
    ('MMR', 'Myanmar (antiga Birmânia),', 'Birmanês'),
    ('FSM', 'Micronésia, Estados Federados da', 'Inglês'),
    ('MOZ', 'Moçambique', 'Português'),
    ('MDA', 'Moldávia', 'Moldavo'),
    ('MCO', 'Mônaco', 'Francês'),
    ('MNG', 'Mongólia', 'Mongol'),
    ('MNE', 'Montenegro', 'Sérvio'),
    ('MSR', 'Montserrat', 'Inglês'),
    ('NAM', 'Namíbia', 'Inglês'),
    ('NRU', 'Nauru', 'Nauruano'),
    ('NPL', 'Nepal', 'Nepalês'),
    ('NIC', 'Nicarágua', 'Espanhol'),
    ('NER', 'Níger', 'Francês'),
    ('NGA', 'Nigéria', 'Inglês'),
    ('NIU', 'Niue', '    Niueano e Inglês'),
    ('NFK', 'Norfolk, Ilha', 'Inglês e Norfuk'),
    ('NOR', 'Noruega', 'Norueguês'),
    ('NCL', 'Nova Caledônia', 'Francês'),
    ('NZL', 'Nova Zelândia', 'Inglês'),
    ('OMN', 'Omã', 'Árabe'),
    ('NLD', 'Países Baixos (Holanda),', 'Neerlandês'),
    ('PLW', 'Palau', 'Inglês'),
    ('PSE', 'Palestina', NULL),
    ('PAN', 'Panamá', 'Espanhol'),
    ('PNG', 'Papua-Nova Guiné', 'Inglês'),
    ('PAK', 'Paquistão', 'Pumjabi'),
    ('PRY', 'Paraguai', 'Espanhol'),
    ('PER', 'Peru', 'Espanhol'),
    ('PCN', 'Pitcairn, Ilhas', 'Inglês'),
    ('PYF', 'Polinésia Francesa', 'Francês'),
    ('POL', 'Polônia', 'Polonês'),
    ('PRI', 'Porto Rico', 'Inglês'),
    ('PRT', 'Portugal', 'Português'),
    ('QAT', 'Qatar', 'Árabe'),
    ('KEN', 'Quênia', 'Quisvaili'),
    ('KGZ', 'Quirguistão', 'Quirguiz'),
    ('GBR', 'Reino Unido da Grã-Bretanha e Irlanda do Norte', 'Inglês'),
    ('REU', 'Reunião, Ilhas', 'Francês e Crioulo'),
    ('ROU', 'Romênia', 'Romeno'),
    ('RWA', 'Ruanda', 'Francês'),
    ('RUS', 'Rússia', 'Russo'),
    ('ESH', 'Saara Ocidental', 'Árabe e Espanhol'),
    ('ASM', 'Samoa Americana', 'Inglês'),
    ('WSM', 'Samoa (Samoa Ocidental),', 'Inglês e Samoano'),
    ('SPM', 'São Pedro e Miquelão', 'Francês'),
    ('SLB', 'Salomão, Ilhas', 'Inglês'),
    ('KNA', 'São Cristóvão e Névis', 'Inglês'),
    ('SMR', 'San Marino', 'Italiano'),
    ('STP', 'São Tomé e Príncipe', 'Português'),
    ('VCT', 'São Vicente e Granadinas', 'Inglês'),
    ('SHN', 'Santa Helena', 'Inglês'),
    ('LCA', 'Santa Lúcia', 'Inglês e Francês'),
    ('SEN', 'Senegal', 'Francês'),
    ('SLE', 'Serra Leoa', 'Inglês'),
    ('SRB', 'Sérvia', 'Sérvio'),
    ('SYC', 'Seichelles', 'Inglês'),
    ('SGP', 'Cingapura', 'Inglês'),
    ('SYR', 'Síria', 'Árabe'),
    ('SOM', 'Somália', 'Somali'),
    ('LKA', 'Sri Lanka', 'Inglês'),
    ('SWZ', 'Suazilândia', 'Inglês'),
    ('SDN', 'Sudão', 'Árabe'),
    ('SWE', 'Suécia', 'Sueco'),
    ('CHE', 'Suíça', 'Alemão e Francês'),
    ('SUR', 'Suriname', 'Holandês'),
    ('SJM', 'Svalbard e Jan Mayen', NULL),
    ('THA', 'Tailândia', 'Tai'),
    ('TWN', 'Taiwan', 'Mandarim'),
    ('TJK', 'Tadjiquistão', 'Tadjique'),
    ('TZA', 'Tanzânia', 'Inglês'),
    ('ATF', 'Terras Austrais e Antárticas Francesas (TAAF),', 'Francês'),
    ('IOT', 'Território Britânico do Oceano Índico', 'Inglês'),
    ('TLS', 'Timor-Leste', 'Português'),
    ('TGO', 'Togo', 'Francês'),
    ('TKL', 'Toquelau', 'Toquelauano e Inglês'),
    ('TON', 'Tonga', 'Inglês'),
    ('TTO', 'Trinidad e Tobago', 'Inglês'),
    ('TUN', 'Tunísia', 'Árabe'),
    ('TCA', 'Turcos e Caicos, Ilhas', 'Inglês'),
    ('TKM', 'Turcomenistão', 'Turcomano'),
    ('TUR', 'Turquia', 'Turco'),
    ('TUV', 'Tuvalu', 'Inglês'),
    ('UKR', 'Ucrânia', 'Ucraniano'),
    ('UGA', 'Uganda', 'Inglês'),
    ('URY', 'Uruguai', 'Espanhol'),
    ('UZB', 'Uzbequistão', 'Uzbequi'),
    ('VUT', 'Vanuatu', 'Francês e Inglês'),
    ('VAT', 'Vaticano', 'Italiano e Latim'),
    ('VEN', 'Venezuela', 'Espanhol'),
    ('VNM', 'Vietnã', 'Vietnamita'),
    ('VIR', 'Virgens Americanas, Ilhas', 'Inglês'),
    ('VGB', 'Virgens Britânicas, Ilhas', 'Inglês'),
    ('WLF', 'Wallis e Futuna, Ilhas', 'Francês e Wallisiano'),
    ('ZMB', 'Zâmbia', 'Inglês'),
    ('ZWE', 'Zimbabwe', 'Inglês');
GO


-- Mostra os valores inseridos na tabela PAISES
SELECT CodPais    AS 'Código do País',
       NomePais   AS 'Nome',
       IdiomaPais AS 'Idioma Principal'
FROM PAISES;
GO


-- Insere 30 registros na tabela VIAGENS
INSERT INTO VIAGENS VALUES 
    (001, '2010-10-12', '2010-12-12', 5350.00, 'VGB'),
    (002, '2010-09-14', '2010-12-22', 8900.00, 'VNM'),
    (003, '2010-12-05', '2011-12-05', 18525.35, 'UKR'),
    (004, '2010-08-11', '2011-05-21', 12350.25, 'TUR'),
    (005, '2010-06-25', '2010-08-25', 7520.00, 'TKL'),
    (006, '2010-03-16', '2011-03-16', 14255.35, 'USA'),
    (007, '2010-12-01', '2010-12-30', 3250.00, 'TLS'),
    (008, '2010-10-12', '2010-12-30', 9500.00, 'THA'),
    (009, '2010-06-21', '2010-09-05', 9250.00, 'RUS'),
    (010, '2010-09-10', '2010-10-02', 6525.00, 'SEN'),
    (011, '2010-07-27', '2011-11-15', 12355.00, 'QAT'),
    (012, '2010-09-04', '2011-10-02', 14200.00, 'CHE'),
    (013, '2010-08-02', '2012-05-02', 16100.00, 'SYR'),
    (014, '2010-06-04', '2011-10-22', 15300.00, 'NZL'),
    (015, '2010-11-04', '2010-12-30', 6250.50, 'MRT'),
    (016, '2010-11-05', '2012-11-05', 22850.25, 'USA'),
    (017, '2010-12-02', '2012-12-30', 18600.10, 'MEX'),
    (018, '2010-11-10', '2012-03-02', 19000.50, 'DNK'),
    (019, '2010-11-11', '2010-12-20', 8200.00, 'GTM'),
    (020, '2010-08-19', '2010-10-20', 7500.00, 'COG'),
    (021, '2010-07-19', '2010-11-19', 8900.50, 'FRA'),
    (022, '2011-01-05', '2012-01-05', 15650.25, 'MEX'),
    (023, '2011-01-08', '2012-01-08', 11850.95, 'USA'),
    (024, '2011-01-10', '2012-01-10', 15850.95, 'USA'),
    (025, '2010-08-02', '2011-08-02', 16550.20, 'USA'),
    (026, '2010-09-05', '2011-03-20', 14750.25, 'USA'),
    (027, '2011-03-15', '2012-04-20', 13560.65, 'THA'),
    (028, '2010-08-15', '2012-10-20', 19500.80, 'USA'),
    (029, '2011-01-01', '2011-12-01', 12520.25, 'USA'),
    (030, '2011-02-20', '2012-02-20', 11950.65, 'IND');
GO


-- Mostra os valores inseridos na tabela VIAGENS
SELECT * FROM VIAGENS;
GO


-- Insere 50 registros na tabela ALUNOS
INSERT INTO ALUNOS VALUES 
    ('Maria Cristina', '1985-10-12', 'Rua João XXIII, 15 - São Paulo', '1155686899', 'F', 'BRA', 001),
    ('Ana Paula Lima', '1980-12-01', 'Rua Mauro Silva, 1908 - São Paulo', '1156923232', 'F', 'BRA', 002),
    ('Carlos Renato', '1979-05-10', 'Av. Faria Lima, 347 - São Paulo', '1156121010', 'M', 'BRA', 003),
    ('Hugo Silva', '1975-10-02', 'Av. da Consolação, 1216 - São Paulo', '1154788901', 'M', 'BRA', 004),
    ('Marcos Antônio', '1985-10-23', 'Rua Agripino Lopes, 100 - São Paulo', '1156010201', 'M', 'BRA', 005),
    ('Gislaine Silva', '1983-11-06', 'Av. Nelson Dávila, 2345 - São José dos Campos', '1234598910', 'F', 'BRA', 006),
    ('Antônio Pereira', '1979-06-18', 'Rua Joaquim Nabuco, 18 - Jacareí', '1234966852', 'M', 'BRA', 007),
    ('Jair Lopes', '1982-12-14', 'Rua Pedro XIII, Santa Isabel', '1236691857', 'M', 'BRA', 008),
    ('Miguel Firmino', '1982-05-12', 'Av. Colinas, 2340 - São José dos Campos', '1234581212', 'M', 'BRA', 009),
    ('Marta da Silva', '1982-06-15', 'Rua Alfredo Miragaia, 321 - Taubaté', '1234568989', 'F', 'BRA', 010),
    ('Jorge Augusto', '1985-06-19', 'Rua Califórnia, 3451 - São Paulo', '1158988810', 'M', 'BRA', 011),
    ('Renato César', '1981-10-22', 'Rua Cafezal, 10 - Cafezal do Sul', '4488562323', 'M', 'BRA', 012),
    ('Júlio Antunes', '1981-11-23', 'Rua do Descanso, 99 - Camaçari', '7196521010', 'M', 'BRA', 013),
    ('Márcio Gomes', '1986-11-24', 'Rua Miguel Pereira, 15 - São Paulo', '1156451212', 'M', 'BRA', 014),
    ('Carlos Pereira', '1986-12-24', 'Rua Maria Augusta, 290 - São Paulo', '1158457525', 'M', 'BRA', 015),
    ('Carlos Barreto', '1986-02-21', 'Rua Augusta, 90 - São Paulo', '1156322558', 'M', 'BRA', 016),
    ('Simone Gomes', '1985-02-20', 'Rua A, 18 - Campos do Jordão', '1296895959', 'F', 'BRA', 017),
    ('José Aurélio', '1987-03-26', 'Rua Canarinho, 789 - São Paulo', '1186574512', 'M', 'BRA', 018),
    ('Juliana Marcondes', '1988-07-27', 'Av. da Consolação, 3450 - São Paulo', '1155125566', 'F', 'BRA', 019),
    ('Jezebel Lima', '1983-07-29', 'Av. Califórnia, 2553 - São Paulo', '1154332332', 'F', 'BRA', 020),
    ('Geisa Lima', '1982-09-29', 'Rua Constantino Pereira, 130 - São Paulo', '1155847889', 'F', 'BRA', 020),
    ('Ana Mara da Silva', '1985-10-30', 'Av. Costa e Silva, 109 - Cruzeiro', '1236658956', 'F', 'BRA', 015),
    ('Pedro Costa', '1985-12-30', 'Av. Francisco Teixeira, 1218 - Campos do Jordão', '1236631225', 'M', 'BRA', 005),
    ('Miriam Pereira', '1986-01-30', 'Av. Matheus da Costa Pinto, 1801 - Campos do Jordão', '1236621515', 'F', 'BRA', 002),
    ('Marcos Manuel', '1977-01-12', 'Rua Anísio Teixeira, 555 - Campos do Jordão', '1236621859', 'M', 'BRA', 001),
    ('Jairo Pereira', '1977-03-13', 'Rua Pedro Augusto, 318 - Cruzeiro', '1236661518', 'M', 'BRA', 001),
    ('Cristina Rocha', '1979-08-14', 'Av. Nelson Lima, 347 - São Paulo', '1153212102', 'F', 'BRA', 009),
    ('Ágatha Silva', '1975-08-15', 'Av. Faria Lima, 448 - São Paulo', '1156020303', 'F', 'BRA', 015),
    ('Mariana Lopes', '1975-09-18', 'Rua Califórnia, 1009 - São Paulo', '1154121111', 'F', 'BRA', 015),
    ('César Augusto', '1975-10-19', 'Rua Augusta, 235 - São Paulo', '1154189898', 'M', 'BRA', 019),
    ('Melissa Pereira', '1975-10-21', 'Rua Américo Vespúcio, 56 - São Paulo', '1156887110', 'F', 'BRA', 012),
    ('Jéssica Patrícia', '1985-10-12', 'Rua Brigadeiro Jordão, 199 - Campos do Jordão', '1236625307', 'F', 'BRA', 011),
    ('Patrícia Silva', '1982-11-12', 'Rua Periquito, 24 - Campos do Jordão', '1236620181', 'F', 'BRA', 011),
    ('Maria Duarte', '1982-12-10', 'Rua F, 341 - Campos do Jordão', '1236631118', 'F', 'BRA', 011),
    ('Marcelo Augusto', '1984-09-22', 'Av. Frei Orestes Girardi, 899 - Campos do Jordão', '1236635696', 'M', 'BRA', 013),
    ('Cristiano Leite', '1984-08-25', 'Rua Gumercindo Lopes, 566 - São Paulo', '1158871771', 'M', 'BRA', 016),
    ('Alberto Carlos', '1983-07-26', 'Av. Jorge Aparecido, 641 - Rio de Janeiro', '2124565353', 'M', 'BRA', 018),
    ('Jaime Augusto', '1983-05-15', 'Rua São Leopoldo, 11 - Rio de Janeiro', '2125896060', 'M', 'BRA', 003),
    ('Leandro Leite', '1982-06-15', 'Av. do Povo, 3489 - Rio de Janeiro', '2156894510', 'M', 'BRA', 009),
    ('Mônica Silva', '1978-04-17', 'Rua Americana, 5200 - Rio de Janeiro', '2189562121', 'F', 'BRA', 009),
    ('Marília dos Santos', '1984-04-15', '', '2134588585', 'F', 'BRA', 004),
    ('Guilherme dos Santos', '1978-10-11', 'Av. Brasil, 1008 - São Paulo', '1155661010', 'M', 'BRA', 001),
    ('Heidi Lima', '1978-08-11', 'Rua César Conceição, 12 - Santo Antônio do Pinhal', '1236645605', 'F', 'BRA', 002),
    ('Amílcar Júnior', '1976-04-10', 'Rua Senador Kennedy, 901 - São Paulo', '1155640290', 'M', 'BRA', 008),
    ('Alexandro Duarte', '1974-05-29', 'Rua Maria Cíntia - Cruzeiro', '1236661515', 'M', 'BRA', 011),
    ('Maurício dos Santos', '1988-04-13', 'Rua Marta Silva - Jacareí', '1236665650', 'M', 'BRA', 016),
    ('Mary Ann Duarte', '1989-04-13', 'Av. Brasil, 6320 - São Paulo', '1158854516', 'F', 'BRA', 017),
    ('Gabriela Pereira', '1983-07-29', 'Rua Franco Silva, 1599 - São Paulo', '1159404014', 'F', 'BRA', 018),
    ('André César', '1984-12-30', 'Rua Militar, 349 - Rio de Janeiro', '2128002525', 'M', 'BRA', 014),
    ('Edson Lopes', '1979-01-11', 'Av. Pedro Silva, 3047 - Rio de Janeiro', '2126900099', 'M', 'BRA', 014);
GO


-- Mostra os valores inseridos na tabela ALUNOS, exceto a data de nascimento e o telefone
SELECT CodAluno   AS 'Código',
       NomeAluno  AS 'Nome do Aluno',
       Endereco   AS 'Endereço',
       Genero     AS 'Gênero',
       PaisOrigem AS 'Origem',
       CodViagem  AS 'Código da Viagem'
FROM ALUNOS;
GO


-- Insere 20 registros na tabela ALUNOSCOPIA
INSERT INTO AlunosCOPIA VALUES 
    ('Maria Cristina', '1985-10-12', 'Rua João XXIII, 15 - São Paulo', '1155686899', 'F', 'BRA', 001),
    ('Ana Paula Lima', '1980-12-01', 'Rua Mauro Silva, 1908 - São Paulo', '1156923232', 'F', 'BRA', 002),
    ('Felipe Neto', '1975-11-23', 'Rua da Preguiça, 70 - São Paulo', '8996521919', 'M', 'BRA', 015),
    ('Carlos Eduardo', '1966-11-24', 'Rua Miguel Pereira, 150 - São Paulo', '1156651210', 'M', 'BRA', 015),
    ('Carlos Pereira', '1986-12-24', 'Rua Maria Augusta, 290 - São Paulo', '1158457525', 'M', 'BRA', 015),
    ('Cristiano Leite', '1984-08-25', 'Rua Gumercindo Lopes, 566 - São Paulo', '1158871771', 'M', 'BRA', 016),
    ('Alberto Carlos', '1983-07-26', 'Av. Jorge Aparecido, 641 - Rio de Janeiro', '2124565353', 'M', 'BRA', 018),
    ('Maria Rita', '1993-05-15', 'Av. Marcos Lima, 110 - Florianópolis', '4825906066', 'F', 'BRA', 003),
    ('Leandro Leite', '1982-06-15', 'Av. do Povo, 3489 - Rio de Janeiro', '2156894510', 'M', 'BRA', 009),
    ('Mônica Silva', '1978-04-17', 'Rua Americana, 5200 - Rio de Janeiro', '2189562121', 'F', 'BRA', 009),
    ('Emerson Soares', '1994-04-15', '', '4834588585', 'M', 'BRA', 018),
    ('Melissa Lima', '1988-10-11', 'Rua da Cegonha, 124 - São Paulo', '1155661010', 'F', 'BRA', 001),
    ('Jéssica Santos', '1968-08-20', 'Rua do Periquito, 99 - Florianópolis', '4846685615', 'F', 'BRA', 015),
    ('Edson Renato', '1966-04-10', 'Rua da Gaivota, 1501 - São Paulo', '1155640290', 'M', 'BRA', 011),
    ('Alex Silva', '1984-05-29', 'Rua do Xarope - Cruzeiro', '1236661515', 'M', 'BRA', 012),
    ('Maurício dos Santos', '1988-04-13', 'Rua Marta Silva - Jacareí', '1236665650', 'M', 'BRA', 016),
    ('Avelino Júnior', '1985-04-13', 'Rua da Relíquia, 24 - Tremembé', '1258854516', 'M', 'BRA', 017),
    ('Gabriela Pereira', '1983-07-29', 'Rua Franco Silva, 1599 - São Paulo', '1159404014', 'F', 'BRA', 018),
    ('André César', '1984-12-30', 'Rua Militar, 349 - Rio de Janeiro', '2128002525', 'M', 'BRA', 014),
    ('Edson Lopes', '1979-01-11', 'Av. Pedro Silva, 3047 - Rio de Janeiro', '2126900099', 'M', 'BRA', 014);
GO


-- Mostra os valores inseridos na tabela AlunosCOPIA, exceto a data de nascimento e o telefone
SELECT CodAluno   AS 'Código',
       NomeAluno  AS 'Nome do Aluno',
       Endereco   AS 'Endereço',
       Genero     AS 'Gênero',
       PaisOrigem AS 'Origem',
       CodViagem  AS 'Código da Viagem'
FROM AlunosCOPIA;
GO


--------------------------------------------------------------------------------
--Parte do código gerado na aula
--------------------------------------------------------------------------------


SELECT  name        AS 'Nome da Tabela',
        create_date AS 'Data de Criação'
FROM sys.tables;
GO

SELECT TABLE_NAME AS "Nome da Tabela"
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND 
        TABLE_CATALOG = 'INTERCAMBIO_alp';
GO

SELECT  CodPais     AS 'Código do País',
        NomePais    AS 'Nome do País',
        IdiomaPais  AS 'Idioma Principal'
FROM PAISES;
GO

SELECT * FROM VIAGENS;
GO

SELECT 
    CodAluno    AS 'Código',
    NomeAluno   AS 'Nome do Aluno',
    Endereco    AS 'Endereço',
    Genero      AS 'Gênero',
    PaisOrigem  AS 'Origem',
    CodViagem   AS 'Código da Viagem'
FROM ALUNOS;
GO 

SELECT 
    CodAluno    AS 'Código',
    NomeAluno   AS 'Nome do Aluno',
    Endereco    AS 'Endereço',
    Genero      AS 'Gênero',
    PaisOrigem  AS 'Origem',
    CodViagem   AS 'Código da Viagem'
FROM ALUNOSCOPIA;
GO 

-- realiza a união, exibindo os registros duplicados
SELECT 
    CodAluno    AS 'Código',
    NomeAluno   AS 'Nome do Aluno',
    Genero      AS 'Gênero'
FROM ALUNOS
    UNION ALL
SELECT 
    CodAluno    AS 'Código',
    NomeAluno   AS 'Nome do Aluno',
    Genero      AS 'Gênero'
FROM AlunosCOPIA
ORDER BY CodAluno, NomeAluno;
GO

SELECT 
    CodAluno    AS 'Código',
    NomeAluno   AS 'Nome do Aluno',
    Genero      AS 'Gênero',
    CodViagem   AS 'Código da Viagem'
FROM ALUNOSCOPIA;
GO 


-- Retorna somente os registros que existem nas duas consultas

SELECT 
    CodAluno    AS 'Código',
    NomeAluno   AS 'Nome do Aluno',
    Genero      AS 'Gênero'
FROM ALUNOS
    INTERSECT
SELECT 
    CodAluno    AS 'Código',
    NomeAluno   AS 'Nome do Aluno',
    Genero      AS 'Gênero'
FROM AlunosCOPIA
ORDER BY CodAluno, NomeAluno;
GO


-- O MINUS/EXCEPT Retorna somente os registeros que existem na primeira consulta

SELECT 
    CodAluno    AS 'Código',
    NomeAluno   AS 'Nome do Aluno',
    Genero      AS 'Gênero'
FROM ALUNOS
    EXCEPT
SELECT 
    CodAluno    AS 'Código',
    NomeAluno   AS 'Nome do Aluno',
    Genero      AS 'Gênero'
FROM AlunosCOPIA
ORDER BY CodAluno, NomeAluno;
GO


-- Exibe os dados dos países utilizados como destinos nas viagens dos alunos, cujo código seja 'USA'

SELECT CodPais      AS 'Código do País',
       NomePais     AS 'Nome do País',
       IdiomaPais   AS 'Idioma'
FROM PAISES
WHERE CodPais = (
    SELECT DISTINCT PaisDestino
    FROM VIAGENS 
    WHERE PaisDestino = 'USA'
);
GO

-- Exibe os dados dos países utilizados com destino nas viagens dos alunos cadastrados

SELECT CodPais      AS 'Código do País',
       NomePais     AS 'Nome do País',
       IdiomaPais   AS 'Idioma'
FROM PAISES
WHERE CodPais IN(
    SELECT PaisDestino FROM VIAGENS
);
GO

SELECT P.CodPais AS 'Código',
    P.NomePais   AS 'País de Destino',
    COUNT(CodPais) AS 'Total de Viagens'
FROM PAISES P INNER JOIN ViAGENS V 
    ON P.CodPais = V.PaisDestino
GROUP BY P.CodPais, P.NomePais
HAVING COUNT(P.CodPais) >= (
    SELECT COUNT(PaisDestino) FROM VIAGENS
    WHERE PaisDestino = 'MEX'
);
GO


USE INTERCAMBIO_alp;
GO

--DECLARANDO AS VARIAVEIS EM T-SQL
DECLARE @dia AS INT,
		@mes AS INT,
		@ano AS int,
		@data1 AS DATE,
		@data2 AS DATETIME;

--ATRIBUINDO VALORES
SET @dia = DAY(GETDATE());
SET @mes = MONTH(GETDATE());
SET @ano = YEAR(GETDATE());

SET @data1 = DATEFROMPARTS(@ano, @mes, @dia);
SET @data2 = DATETIMEFROMPARTS(@ano, @mes, @dia, 0, 0, 0, 0);

SELECT  @dia   AS 'Dia',
		@mes   AS 'Mês',
		@ano   AS 'Ano',
		@data1 AS 'Data 1',
		@data2 AS 'Data 2';
GO

--DECLARA DUAS DATAS
DECLARE @data1 AS DATE,
		@data2 AS DATE;

--ALTERA O FORMATO DE ENTRADA
SET DATEFORMAT DMY;

--ATRIBUI ALGUNS VALORES
SET @data1 = '01/01/2024';
SET @data2 = GETDATE();


SELECT  @data1 AS 'Data Inicial',
		@data2 AS 'Data de Hoje',
		DATEDIFF(DAY, @data1, @data2) AS 'Qtd. Dias',
		DATEDIFF(MONTH, @data1, @data2) AS 'Qtd. Meses',
		DATEDIFF(HOUR, @data1, @data2) AS 'Qtd. Horas';
GO

SELECT  GETDATE() AS 'Data Atual',
		DATEADD(MONTH, 5, GETDATE()) AS 'Proximos 5 Meses',
		EOMONTH(GETDATE(), 5) AS 'Final do mês (Daqui 5 meses)',
		SWITCHOFFSET(GETDATE(), '+10:00') AS 'Alteração de Fuso-horário (+10 Horas)';

SELECT  @@LANGUAGE AS 'Idioma Utilizado',
		@@DATEFIRST AS 'Primeiro dia da Semana';

--Demonstra a utilização do comando SELECT.. CASE
SELECT @@LANGUAGE AS 'Idioma Utilizado',
	CASE
		WHEN @@DATEFIRST = 1 THEN 'Segunda-Feira'
		WHEN @@DATEFIRST = 2 THEN 'Terça-Feira'
		WHEN @@DATEFIRST = 3 THEN 'Quarta-Feira'
		WHEN @@DATEFIRST = 4 THEN 'Quinta-Feira'
		WHEN @@DATEFIRST = 5 THEN 'Sexta-Feira'
		WHEN @@DATEFIRST = 6 THEN 'Sábado'
		WHEN @@DATEFIRST = 7 THEN 'Domingo'
	END AS 'Primeiro Dia da Semana'

SELECT * from sys.syslanguages;

--RETORNA INFORMAÇOES FORMATADAS SOBRE ALGUNS IDIOMAS
SELECT  langid AS 'ID do Idioma',
		dateformat AS 'Formato da Data',
		datefirst AS 'Primeiro dia da Semana',
		name AS 'Nome do Idioma',
		alias AS 'Nome Alternativo do Idioma',
		months AS 'Nome dos meses',
		shortmonths AS 'Abreviatura dos meses',
		days AS 'Nomes dos Dias'
	FROM sys.syslanguages
	WHERE alias IN ('English', 'Brazilian', 'German', 'Japanese', 'Russian');

--RETORNA INFORMAÇOES SOBRE ALGUNS IDIOMAS
EXEC SP_HELPLANGUAGE [Brazilian];
EXEC SP_HELPLANGUAGE [Japanese];
EXEC SP_HELPLANGUAGE [English];

--DECLARA VARIAVEL PARA ARMAZENAR A DATA ATUAL
DECLARE @data DATETIME;
SET @data = GETDATE();

--EXIBE INFORMAÇÕES SOBRE A DATA ATUAL
SELECT @data AS 'Data Atual',
		DATEPART(DAY, @data) AS 'Dia do Mês',
		DATENAME(DW, @data) AS 'Dia da Semana',
		DATEPART(MONTH, @data) AS 'Mês',
		DATENAME(MONTH, @data) AS 'Nome do Mês',
		DATEPART(YEAR, @data) AS 'Ano';
GO

--DECLARA VARIAVEL PARA ARMAZENAR A DATA ATUAL
DECLARE @data DATETIME;
SET @data = GETDATE();

SELECT @data AS 'Data Atual',
		DATENAME(DW, @data) AS 'Dia da Semana',
		DATENAME(WK, @data) AS 'Semana do Ano',
		DATENAME(M, @data) AS 'Nome do Mês',
		DATENAME(D, @data) AS 'Dia do Mês',
		DATENAME(DY, @data) AS 'Dia do Ano';
GO

------------------------------
SET LANGUAGE Brazilian;
GO
DECLARE @data DATETIME;
SET @data = GETDATE();

--EXIBE IDIOMA, DIA DA SEMANA E NOME DO MES
SELECT @@LANGUAGE AS 'Idioma',
		DATENAME (DW, @data) AS 'Dia da Semana',
		DATENAME (M, @data) AS 'Nome do Mês';

--
SET DATEFORMAT DMY;
IF ISDATE ('20/01/2015 00:10:50.000') = 1
	PRINT 'Data Válida!';
ELSE
	PRINT 'Data Inválida!';

--
SET DATEFORMAT MDY;
IF ISDATE ('20/01/2015 00:10:50.000') = 1
	PRINT 'Data Válida!';
ELSE
	PRINT 'Data Inválida!';

--
SET LANGUAGE us_english;
SET DATEFORMAT MDY;

--
SELECT ASCII ('A') AS 'ASCII: A',
		UNICODE('A') AS 'UNICODE: A',
		CHAR(65) AS 'CHAR: 65',
		NCHAR(65) AS 'NCHAR: 65',
		ASCII(N'私') AS 'ASCII: 私',
		UNICODE(N'私') AS 'UNICODE: 私',
		CHAR(31169) AS 'CHAR: 31169',
		NCHAR(31169) AS 'NCHAR: 31169',
		CHARINDEX('S', 'Microsoft SQL') AS 'CHARINDEX: S',
		CHARINDEX('SQL', 'Microsoft SQL') AS 'CHARINDEX: SQL';

SELECT 'Matheus' + 'Magalhaes' AS 'SPACE 1',
		'Matheus' + ' ' + 'Magalhaes' AS 'SPACE 2',
		'Matheus' + SPACE(10) + 'Magalhaes' AS 'SPACE 3',
		QUOTENAME('Matheus Magalhaes', '{') AS 'QUOTENAME 1',
		QUOTENAME('Matheus Magalhaes', '"') AS 'QUOTENAME 2',
		QUOTENAME('Matheus Magalhaes', '[') AS 'QUOTENAME 3',
		STR(100) AS 'STR 1',
		STR(100.0) AS 'STR 2',
		STR(100.45, 6, 2) AS 'STR 3',
		LEN('Matheus Magalhaes') AS 'LEN 1';

--DEMONSTRA PATINDEX
SELECT PATINDEX('soft', 'Microsoft SQL') AS 'PATINDEX 1',
		PATINDEX('%soft%', 'Microsoft SQL') AS 'PATINDEX 2';

--DEMONSTRA SOUNDEX E DIFFERENCE
SELECT SOUNDEX ('Matheus') AS 'SOUNDEX: Matheus',
		SOUNDEX ('Matthew') AS 'SOUNDEX: Matthew',
		SOUNDEX ('João') AS 'SOUNDEX: João',
		DIFFERENCE('Matheus', 'Matthew') AS 'DIFF 1',
		DIFFERENCE('Matheus', 'João') AS 'DIFF 2';

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


---
-- Conversão de uma data utilizando CAST e CONVERT
DECLARE @data AS DATE = '2024-01-25';

SELECT CAST(@data AS CHAR(20)) AS 'CAST (Padrão)',
       CONVERT(CHAR(20), @data) AS 'CONVERT (Padrão)',
       CONVERT(CHAR(20), @data, 101) AS 'EUA (mm/dd/aaaa)',
       CONVERT(CHAR(20), @data, 103) AS 'Brasil (dd/mm/aaaa)',
       CONVERT(CHAR(20), @data, 111) AS 'Japão (aaaa/mm/dd)';
GO


-- Demonstra a utilização do PARSE para converter data e dinheiro
SELECT PARSE('Quinta-feira, 25 de janeiro de 2024' AS DATE USING 'pt-BR') AS 'Data Brasileira',
       PARSE('Thursday, 25 January 2024' AS DATE USING 'en-US') AS 'Data Americana',
       PARSE('2024-01-25' AS DATETIME2) AS 'Data Padrão',
       PARSE('R$ 345,98' AS MONEY USING 'pt-BR') AS 'Dinheiro Brasileiro',
       PARSE('$ 345.98' AS MONEY USING 'en-US') AS 'Dinheiro Americano',
       PARSE('¥ 345.98' AS MONEY USING 'jp-JP') AS 'Dinheiro Japonês';
GO

--- 
-- quando for mudar o formato de dados da data, usa-se o: 
SET LANGUAGE english; 
GO


-- Exemplo de validação utilizando TRY_CAST, TRY_CONVERT e TRY_PARSE
DECLARE @data AS CHAR(10) = '25/01/2024';

SELECT TRY_CAST(@data AS DATE) AS 'TRY CAST',
       TRY_CONVERT(DATE, @data, 103) AS 'Brasil (dd/mm/aaaa)',
       TRY_CONVERT(DATE, @data, 101) AS 'EUA (mm/dd/aaaa)',
       TRY_PARSE(@data AS DATE) AS 'TRY PARSE';
GO
