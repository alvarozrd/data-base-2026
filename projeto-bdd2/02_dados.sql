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


-- PROFESSORES (8 registros fictícios; o professor 8 so participa de bancas)
INSERT INTO PROFESSORES VALUES
    (1, '1000001', 'Marcos Vinícius Almeida', 'marcos.almeida@exemplo.edu.br', 'Doutor', '2012-02-01', '35990000001'),
    (2, '1000002', 'Renata Cavalcante Souza', 'renata.souza@exemplo.edu.br', 'Mestre', '2014-08-18', NULL),
    (3, '1000003', 'Sérgio Luiz Marques', 'sergio.marques@exemplo.edu.br', 'Doutor', '2010-03-15', '35990000003'),
    (4, '1000004', 'Luciana Prates Barros', 'luciana.barros@exemplo.edu.br', 'Doutor', '2016-02-22', NULL),
    (5, '1000005', 'Otávio Bastos Freire', 'otavio.freire@exemplo.edu.br', 'Mestre', '2018-07-02', '35990000005'),
    (6, '1000006', 'Helena Carvalho Mendonça', 'helena.mendonca@exemplo.edu.br', 'Doutor', '2011-09-12', '35990000006'),
    (7, '1000007', 'Roberto Kenji Tanaka', 'roberto.tanaka@exemplo.edu.br', 'Especialista', '2019-02-11', NULL),
    (8, '1000008', 'Patrícia Nogueira Lins', 'patricia.lins@exemplo.edu.br', 'Mestre', '2020-03-09', '35990000008');
GO


-- ALUNOS (20 registros fictícios; o aluno 20 ainda nao possui producao)
INSERT INTO ALUNOS VALUES
    (1, 1, 'CJ9000001', 'Ana Beatriz Moura', 'ana.moura@aluno.exemplo.edu.br', '2021-02-01'),
    (2, 1, 'CJ9000002', 'Bruno Henrique Lopes', 'bruno.lopes@aluno.exemplo.edu.br', '2021-02-01'),
    (3, 1, 'CJ9000003', 'Camila Ferreira Dias', 'camila.dias@aluno.exemplo.edu.br', '2021-08-02'),
    (4, 1, 'CJ9000004', 'Diego Martins Rocha', 'diego.rocha@aluno.exemplo.edu.br', '2022-02-01'),
    (5, 1, 'CJ9000005', 'Eduarda Nunes Prado', 'eduarda.prado@aluno.exemplo.edu.br', '2022-02-01'),
    (6, 1, 'CJ9000006', 'Felipe Augusto Vaz', 'felipe.vaz@aluno.exemplo.edu.br', '2022-08-01'),
    (7, 1, 'CJ9000007', 'Gabriela Torres Leal', 'gabriela.leal@aluno.exemplo.edu.br', '2023-02-01'),
    (8, 1, 'CJ9000008', 'Henrique Salles Braga', 'henrique.braga@aluno.exemplo.edu.br', '2023-02-01'),
    (9, 2, 'CJ9000009', 'Isabela Cardoso Melo', 'isabela.melo@aluno.exemplo.edu.br', '2021-02-01'),
    (10, 2, 'CJ9000010', 'João Pedro Antunes', 'joao.antunes@aluno.exemplo.edu.br', '2022-02-01'),
    (11, 2, 'CJ9000011', 'Karina Duarte Pinto', 'karina.pinto@aluno.exemplo.edu.br', '2022-02-01'),
    (12, 2, 'CJ9000012', 'Lucas Gabriel Faria', 'lucas.faria@aluno.exemplo.edu.br', '2023-02-01'),
    (13, 2, 'CJ9000013', 'Marina Siqueira Reis', 'marina.reis@aluno.exemplo.edu.br', '2023-02-01'),
    (14, 2, 'CJ9000014', 'Nicolas Barbosa Cunha', 'nicolas.cunha@aluno.exemplo.edu.br', '2024-02-01'),
    (15, 3, 'CJ9000015', 'Olívia Mendes Teixeira', 'olivia.teixeira@aluno.exemplo.edu.br', '2021-02-01'),
    (16, 3, 'CJ9000016', 'Paulo Ricardo Alves', 'paulo.alves@aluno.exemplo.edu.br', '2022-02-01'),
    (17, 3, 'CJ9000017', 'Rafaela Campos Neri', 'rafaela.neri@aluno.exemplo.edu.br', '2022-02-01'),
    (18, 4, 'CJ9000018', 'Samuel Oliveira Brito', 'samuel.brito@aluno.exemplo.edu.br', '2021-02-01'),
    (19, 4, 'CJ9000019', 'Tatiana Gomes Ribeiro', 'tatiana.ribeiro@aluno.exemplo.edu.br', '2022-02-01'),
    (20, 4, 'CJ9000020', 'Vinícius Prado Lacerda', 'vinicius.lacerda@aluno.exemplo.edu.br', '2024-02-01');
GO


