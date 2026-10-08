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


