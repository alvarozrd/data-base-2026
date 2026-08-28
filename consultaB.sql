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

SELECT * FROM ##TabelaB;