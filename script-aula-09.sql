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
