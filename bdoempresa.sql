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

