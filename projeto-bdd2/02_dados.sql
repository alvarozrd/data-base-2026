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


-- PRODUCOES (30 registros fictícios)
-- Colunas: IdProducao, IdCurso, IdArea, IdTipo, IdVeiculo, Titulo, Resumo,
--          Ano, DataRegistro, Situacao, LinkArquivo
INSERT INTO PRODUCOES VALUES
    (1, 1, 1, 2, NULL, 'Modelagem relacional para um sistema de reservas de hospedagem', 'Propõe o projeto de dados de um sistema de reservas de pequenas pousadas.', 2023, '2023-03-10', 'Concluída', '/repositorio/p0001.pdf'),
    (2, 1, 2, 2, NULL, 'Aplicação web para gestão de manutenção predial', 'Desenvolve uma aplicação web para registrar e acompanhar chamados de manutenção.', 2024, '2024-02-15', 'Concluída', '/repositorio/p0002.pdf'),
    (3, 1, 4, 3, 1, 'Classificação de textos acadêmicos com aprendizado de máquina', 'Compara algoritmos de classificação aplicados a resumos de trabalhos acadêmicos.', 2024, '2024-03-05', 'Publicada', '/repositorio/p0003.pdf'),
    (4, 1, 3, 1, 3, 'Análise de vulnerabilidades em redes Wi-Fi institucionais', 'Investiga falhas de configuração em redes sem fio de uso institucional.', 2025, '2025-02-12', 'Concluída', '/repositorio/p0004.pdf'),
    (5, 1, 1, 1, 3, 'Padronização de metadados de produções científicas', 'Estuda metadados para descrever e recuperar produções científicas.', 2025, '2025-08-18', 'Em andamento', NULL),
    (6, 1, 2, 3, 2, 'Boas práticas de testes automatizados em projetos de pequeno porte', 'Apresenta práticas de teste de software adaptadas a equipes reduzidas.', 2024, '2024-04-22', 'Publicada', '/repositorio/p0006.pdf'),
    (7, 1, 4, 2, NULL, 'Chatbot para atendimento de dúvidas de matrícula', 'Desenvolve um assistente virtual para responder dúvidas frequentes de matrícula.', 2025, '2025-09-01', 'Em andamento', NULL),
    (8, 1, 1, 3, 5, 'Comparação de desempenho entre estratégias de consulta em bases acadêmicas', 'Compara o tempo de resposta de diferentes consultas em uma base de produções.', 2025, '2025-03-17', 'Publicada', '/repositorio/p0008.pdf'),
    (9, 1, 3, 4, 6, 'Oficina de segurança digital para a comunidade', 'Oficinas sobre senhas, golpes e uso seguro da internet para a comunidade externa.', 2024, '2024-05-06', 'Concluída', '/repositorio/p0009.pdf'),
    (10, 1, 2, 2, NULL, 'Sistema de agendamento para laboratórios de informática', 'Implementa o agendamento de laboratórios com controle de horários.', 2022, '2022-03-14', 'Concluída', '/repositorio/p0010.pdf'),
    (11, 1, 7, 4, NULL, 'Plataforma de divulgação de pequenos produtores locais', 'Cria uma vitrine digital para produtores da região.', 2026, '2026-03-09', 'Em andamento', NULL),
    (12, 1, 1, 2, NULL, 'Banco de dados para gestão de acervo bibliográfico', 'Projeto de banco de dados para o acervo de uma biblioteca escolar.', 2021, '2021-04-19', 'Cancelada', NULL),
    (13, 2, 2, 2, NULL, 'Aplicativo de lista de tarefas para estudantes', 'Aplicativo simples para organização de tarefas escolares.', 2023, '2023-03-13', 'Concluída', '/repositorio/p0013.pdf'),
    (14, 2, 3, 1, 3, 'Monitoramento de rede em laboratório escolar', 'Monitora o tráfego de rede de um laboratório para identificar gargalos.', 2024, '2024-03-11', 'Concluída', '/repositorio/p0014.pdf'),
    (15, 2, 4, 1, 3, 'Reconhecimento de padrões em imagens de plantas ornamentais', 'Testa técnicas de visão computacional para identificar espécies de plantas.', 2025, '2025-04-07', 'Em andamento', NULL),
    (16, 2, 1, 2, NULL, 'Cadastro de equipamentos do laboratório com banco relacional', 'Estrutura o cadastro de equipamentos e empréstimos de um laboratório.', 2022, '2022-03-21', 'Concluída', '/repositorio/p0016.pdf'),
    (17, 2, 2, 4, 6, 'Programação para jovens: introdução à lógica', 'Oficinas de lógica de programação para estudantes do ensino fundamental.', 2023, '2023-05-15', 'Concluída', '/repositorio/p0017.pdf'),
    (18, 2, 7, 3, 2, 'Empreendedorismo digital entre estudantes do ensino técnico', 'Analisa o interesse de estudantes técnicos por negócios digitais.', 2025, '2025-02-24', 'Publicada', '/repositorio/p0018.pdf'),
    (19, 2, 3, 2, NULL, 'Configuração segura de servidores domésticos', 'Propõe um guia de configuração segura para servidores de pequeno porte.', 2026, '2026-03-16', 'Em andamento', NULL),
    (20, 2, 4, 3, 1, 'Aplicações de visão computacional na educação', 'Revisa usos de visão computacional em atividades educacionais.', 2026, '2026-03-02', 'Concluída', '/repositorio/p0020.pdf'),
    (21, 3, 6, 2, NULL, 'Análise de umidade em edificações de clima de montanha', 'Avalia problemas de umidade em construções de região serrana.', 2023, '2023-03-20', 'Concluída', '/repositorio/p0021.pdf'),
    (22, 3, 6, 1, 3, 'Uso de materiais reciclados em blocos de concreto', 'Testa a resistência de blocos produzidos com resíduos reciclados.', 2024, '2024-04-08', 'Concluída', '/repositorio/p0022.pdf'),
    (23, 3, 6, 3, 4, 'Conforto térmico em habitações populares', 'Compara soluções de conforto térmico para moradias de baixo custo.', 2025, '2025-03-03', 'Publicada', '/repositorio/p0023.pdf'),
    (24, 3, 6, 4, 6, 'Orientação sobre manutenção preventiva residencial', 'Ações de orientação à comunidade sobre manutenção de moradias.', 2024, '2024-05-20', 'Concluída', '/repositorio/p0024.pdf'),
    (25, 3, 2, 2, NULL, 'Sistema de orçamento de obras com planilhas integradas', 'Propõe um sistema de orçamento para pequenas obras.', 2022, '2022-04-04', 'Cancelada', NULL),
    (26, 4, 5, 2, NULL, 'Experimentos de baixo custo para o ensino de ondas', 'Desenvolve experimentos acessíveis para aulas sobre ondas.', 2023, '2023-03-27', 'Concluída', '/repositorio/p0026.pdf'),
    (27, 4, 5, 1, 3, 'Simulações computacionais no ensino de eletromagnetismo', 'Avalia o uso de simulações em aulas de eletromagnetismo.', 2024, '2024-03-18', 'Concluída', '/repositorio/p0027.pdf'),
    (28, 4, 5, 3, 4, 'Ensino de astronomia com materiais acessíveis', 'Relata atividades de astronomia com materiais de baixo custo.', 2025, '2025-02-17', 'Publicada', '/repositorio/p0028.pdf'),
    (29, 4, 5, 4, 6, 'Clube de ciências itinerante', 'Atividades de ciências levadas a escolas da região.', 2025, '2025-05-12', 'Concluída', '/repositorio/p0029.pdf'),
    (30, 4, 5, 2, NULL, 'Avaliação de aprendizagem com mapas conceituais em Física', 'Investiga mapas conceituais como instrumento de avaliação.', 2026, '2026-03-23', 'Em andamento', NULL);
GO


-- AUTORIAS (alunos autores de cada producao)
INSERT INTO AUTORIAS VALUES
    (1, 1, 1), (1, 2, 2),
    (2, 3, 1),
    (3, 4, 1), (3, 5, 2),
    (4, 6, 1),
    (5, 7, 1), (5, 8, 2),
    (6, 2, 1), (6, 3, 2),
    (7, 5, 1),
    (8, 1, 1), (8, 4, 2),
    (9, 6, 1), (9, 7, 2), (9, 8, 3),
    (10, 8, 1),
    (11, 7, 1),
    (12, 3, 1),
    (13, 9, 1),
    (14, 10, 1), (14, 11, 2),
    (15, 12, 1),
    (16, 13, 1),
    (17, 9, 1), (17, 14, 2),
    (18, 11, 1), (18, 12, 2),
    (19, 13, 1), (19, 14, 2),
    (20, 10, 1),
    (21, 15, 1),
    (22, 16, 1), (22, 17, 2),
    (23, 15, 1), (23, 16, 2),
    (24, 17, 1),
    (25, 15, 1),
    (26, 18, 1),
    (27, 19, 1),
    (28, 18, 1), (28, 19, 2),
    (29, 18, 1), (29, 19, 2),
    (30, 19, 1);
GO


-- ORIENTACOES (toda producao possui ao menos um orientador)
INSERT INTO ORIENTACOES VALUES
    (1, 1, 'Orientador'), (1, 2, 'Coorientador'),
    (2, 2, 'Orientador'),
    (3, 4, 'Orientador'), (3, 1, 'Coorientador'),
    (4, 3, 'Orientador'),
    (5, 1, 'Orientador'),
    (6, 2, 'Orientador'), (6, 3, 'Coorientador'),
    (7, 4, 'Orientador'),
    (8, 1, 'Orientador'),
    (9, 3, 'Orientador'),
    (10, 2, 'Orientador'),
    (11, 7, 'Orientador'),
    (12, 1, 'Orientador'),
    (13, 2, 'Orientador'),
    (14, 3, 'Orientador'),
    (15, 4, 'Orientador'),
    (16, 1, 'Orientador'),
    (17, 7, 'Orientador'), (17, 2, 'Coorientador'),
    (18, 7, 'Orientador'),
    (19, 3, 'Orientador'),
    (20, 4, 'Orientador'),
    (21, 6, 'Orientador'),
    (22, 6, 'Orientador'), (22, 5, 'Coorientador'),
    (23, 6, 'Orientador'),
    (24, 6, 'Orientador'),
    (25, 2, 'Orientador'), (25, 6, 'Coorientador'),
    (26, 5, 'Orientador'),
    (27, 5, 'Orientador'), (27, 4, 'Coorientador'),
    (28, 5, 'Orientador'),
    (29, 5, 'Orientador'),
    (30, 5, 'Orientador');
GO


