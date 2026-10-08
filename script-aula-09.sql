USE empresaCJ3037916;
GO

--DECLARANDO AS VARIAVEIS EM T-SQL
DECLARE @dia AS INT,
		@mes AS CHAR(20),
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

--DECLARA DUAS DATAS
DECLARE @data1 AS DATE,
		@data2 AS DATE;

--ALTERA O FORMATO DE ENTRADA
SET DATEFORMAT DMY;

--ATRIBUI ALGUNS VALORES
SET @data1 = '01/01/2024';
SET @data2 = GETDATE();


SET @data2 = GETDATE();


SELECT  @data1 AS 'Data Inicial',
		@data2 AS 'Data de Hoje',
		DATEDIFF(DAY, @data1, @data2) AS 'Qtd. Dias',
		DATEDIFF(MONTH, @data1, @data2) AS 'Qtd. Meses',
		DATEDIFF(HOUR, @data1, @data2) AS 'Qtd. Horas';

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

--DECLARA VARIAVEL PARA ARMAZENAR A DATA ATUAL
DECLARE @data DATETIME;
SET @data = GETDATE();

SELECT @data AS 'Data Atual',
		DATENAME(DW, @data) AS 'Dia da Semana',
		DATENAME(WK, @data) AS 'Semana do Ano',
		DATENAME(M, @data) AS 'Nome do Mês',
		DATENAME(D, @data) AS 'Dia do Mês',
		DATENAME(DY, @data) AS 'Dia do Ano';

------------------------------
SET LANGUAGE Brazilian;
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

