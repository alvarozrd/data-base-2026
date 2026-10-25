--------------------------------------------------------------------------------
-- 02_dados.sql
-- Projeto Final - Banco de Dados 2 (CJOBDD2) - IFSP Campos do Jordao
-- Autor: Alvaro Pereira (CJ3037916)
--
-- Insere dados FICTICIOS de teste nas 15 tabelas. A ordem respeita as chaves
-- estrangeiras: primeiro as tabelas de apoio e pessoas, depois PRODUCOES e,
-- por ultimo, as tabelas associativas e o historico.
--------------------------------------------------------------------------------

USE ProducaoAcademica_CJ3037916;
GO


-- CURSOS (5 registros; o curso 5 nao possui alunos nem producoes)
INSERT INTO CURSOS VALUES
    (1, 'Tecnologia em Análise e Desenvolvimento de Sistemas', 'Superior'),
    (2, 'Técnico em Informática', 'Técnico'),
    (3, 'Técnico em Edificações', 'Técnico'),
    (4, 'Licenciatura em Física', 'Superior'),
    (5, 'Especialização em Ensino de Ciências', 'Pós-graduação');
GO


-- AREAS_TEMATICAS (7 registros)
INSERT INTO AREAS_TEMATICAS VALUES
    (1, 'Banco de Dados', 'Modelagem, implementação e consulta de dados'),
    (2, 'Engenharia de Software', 'Desenvolvimento, testes e manutenção de sistemas'),
    (3, 'Redes e Segurança', 'Infraestrutura de redes e segurança da informação'),
    (4, 'Inteligência Artificial', 'Aprendizado de máquina e visão computacional'),
    (5, 'Ensino de Física', 'Metodologias e recursos para o ensino de Física'),
    (6, 'Construção Civil', 'Materiais, conforto e manutenção de edificações'),
    (7, 'Gestão e Empreendedorismo', 'Organização, negócios e inovação');
GO


-- TIPOS_PRODUCAO (5 registros; o tipo 5 ainda nao foi utilizado)
INSERT INTO TIPOS_PRODUCAO VALUES
    (1, 'Iniciação Científica', 'Projeto de pesquisa com orientação docente'),
    (2, 'TCC', 'Trabalho de Conclusão de Curso'),
    (3, 'Artigo', 'Artigo científico publicado em periódico ou congresso'),
    (4, 'Projeto de Extensão', 'Ação voltada à comunidade externa'),
    (5, 'Relatório Técnico', 'Documento técnico de desenvolvimento ou pesquisa');
GO


-- VEICULOS_PUBLICACAO (6 registros fictícios)
INSERT INTO VEICULOS_PUBLICACAO VALUES
    (1, 'Revista Mantiqueira de Computação', 'Periódico', 'Nacional'),
    (2, 'Congresso Regional de Tecnologia da Mantiqueira', 'Congresso', 'Regional'),
    (3, 'Simpósio de Iniciação Científica do Campus', 'Evento interno', 'Institucional'),
    (4, 'Revista Brasileira de Ensino de Ciências Aplicadas', 'Periódico', 'Nacional'),
    (5, 'International Conference on Applied Informatics', 'Congresso', 'Internacional'),
    (6, 'Jornada de Extensão e Cultura', 'Evento interno', 'Institucional');
GO


-- PALAVRAS_CHAVE (15 registros)
INSERT INTO PALAVRAS_CHAVE VALUES
    (1, 'banco de dados'),
    (2, 'modelagem de dados'),
    (3, 'SQL'),
    (4, 'engenharia de software'),
    (5, 'testes de software'),
    (6, 'aprendizado de máquina'),
    (7, 'redes de computadores'),
    (8, 'segurança da informação'),
    (9, 'ensino de Física'),
    (10, 'educação'),
    (11, 'construção civil'),
    (12, 'sustentabilidade'),
    (13, 'extensão'),
    (14, 'empreendedorismo'),
    (15, 'visão computacional');
GO


-- REFERENCIAS (13 registros)
-- Os registros 1 a 8 correspondem a obras citadas nos relatorios anteriores e
-- no modelo institucional. Os registros 9 a 13 sao FICTICIOS (apenas para teste).
-- Date e Machado ficam sem ano porque o ano nao consta nos materiais.
INSERT INTO REFERENCIAS VALUES
    (1, 'ELMASRI, Ramez; NAVATHE, Shamkant B. Sistemas de banco de dados. 6. ed. São Paulo: Pearson Addison-Wesley, 2011.', 'Livro', 2011, NULL),
    (2, 'HEUSER, Carlos Alberto. Projeto de banco de dados. 6. ed. Porto Alegre: Bookman, 2009.', 'Livro', 2009, NULL),
    (3, 'SOMMERVILLE, Ian. Engenharia de software. 9. ed. São Paulo: Pearson Prentice Hall, 2011.', 'Livro', 2011, NULL),
    (4, 'GUEDES, Gilleanes T. A. UML 2: uma abordagem prática. 3. ed. São Paulo: Novatec, 2018.', 'Livro', 2018, NULL),
    (5, 'DATE, C. J. Introdução a sistemas de bancos de dados.', 'Livro', NULL, NULL),
    (6, 'MACHADO, F. N. R. Banco de dados: projeto e implementação.', 'Livro', NULL, NULL),
    (7, 'ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS - ABNT. NBR 6023: informação / referências / elaboração. Rio de Janeiro, 2002.', 'Norma', 2002, NULL),
    (8, 'ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS - ABNT. NBR 6024: numeração progressiva das seções de um documento. Rio de Janeiro, 1989.', 'Norma', 1989, NULL),
    (9, 'AUTOR FICTÍCIO A. Aprendizado de máquina aplicado à educação. Revista Exemplo, 2022. (referência fictícia para teste)', 'Artigo', 2022, NULL),
    (10, 'AUTOR FICTÍCIO B. Segurança em redes locais de pequeno porte. Anais Exemplo, 2021. (referência fictícia para teste)', 'Artigo', 2021, NULL),
    (11, 'AUTOR FICTÍCIO C. Empreendedorismo e juventude. Revista Exemplo, 2020. (referência fictícia para teste)', 'Artigo', 2020, NULL),
    (12, 'AUTOR FICTÍCIO D. Práticas de ensino de ciências e tecnologia. Anais Exemplo, 2023. (referência fictícia para teste)', 'Artigo', 2023, NULL),
    (13, 'AUTOR FICTÍCIO E. Desempenho térmico e materiais em edificações. Revista Exemplo, 2019. (referência fictícia para teste)', 'Artigo', 2019, NULL);
GO


