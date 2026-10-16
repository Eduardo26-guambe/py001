CREATE DATABASE IF NOT EXISTS voto_sysdb;
USE voto_sysdb;

-- Tabela de usuários com campos para recuperação de palavra-passe
CREATE TABLE IF NOT EXISTS user(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(150) NOT NULL,
    reset_token VARCHAR(255) DEFAULT NULL,
    reset_expires DATETIME DEFAULT NULL
);

-- Tabelas de candidatos atualizadas com foto, descrição e propostas ajustadas para estudantes (19-25 anos)
CREATE TABLE IF NOT EXISTS pres (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(25) NOT NULL,
    foto VARCHAR(255),
    descricao TEXT,
    propostas TEXT
);

CREATE TABLE IF NOT EXISTS sec (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(25) NOT NULL,
    foto VARCHAR(255),
    descricao TEXT,
    propostas TEXT
);

CREATE TABLE IF NOT EXISTS est (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(25) NOT NULL,
    foto VARCHAR(255),
    descricao TEXT,
    propostas TEXT
);

-- Inserir candidatos da Presidência (19-25 anos)
INSERT INTO pres (id, nome, foto, descricao, propostas) VALUES 
(1, 'Dércia Guambe', 'pic/dercia.jpg', 'Estudante universitária de 21 anos, líder visionária e apaixonada por gestão de projetos cívicos e inovação académica.', 'Digitalização total dos processos académicos, maior transparência financeira e criação de bolsas de apoio estudantil.'),
(2, 'Dalton Nhambio', 'pic/dalton.jpg', 'Estudante de engenharia de 22 anos, focado em inovação tecnológica, modernização de sistemas e otimização de infraestruturas no campus.', 'Melhoria da rede de Wi-Fi no campus, otimização dos laboratórios de informática e suporte a startups criadas por estudantes.'),
(3, 'Cristêncio Cristiano', 'pic/cris.jpg', 'Estudante de direito e ativista comunitário de 23 anos, incansável na defesa dos direitos e do bem-estar dos colegas.', 'Criação de cantinas universitárias mais acessíveis, espaços de estudo abertos 24 horas e implementação de apoio psicológico gratuito.'),
(4, 'Néima Filomena', 'pic/neima.jpg', 'Estudante de ciências políticas de 20 anos, especialista em comunicação institucional e integração estudantil.', 'Fóruns mensais abertos com a reitoria, maior rigor e justiça na atribuição de subsídios e incentivo ao desporto inclusivo.');

-- Inserir candidatos da Secretaria (19-25 anos)
INSERT INTO sec (id, nome, foto, descricao, propostas) VALUES 
(1, 'Credson de Sousa', 'pic/credson.jpg', 'Estudante de administração de 22 anos, organizado e rigoroso na gestão documental e secretariado digital.', 'Desburocratização de requerimentos online e atendimento automatizado via portal do estudante.'),
(2, 'Ginalda Vilanculos', 'pic/ginalda.jpg', 'Estudante de gestão de 20 anos, especialista em organização de arquivos em nuvem e atendimento rápido.', 'Redução do tempo de resposta de documentos para 24 horas e transição para arquivo digital seguro.'),
(3, 'Birlêndio Artur', 'pic/birlendio.jpg', 'Estudante de informática aplicada de 24 anos, focado em eficiência administrativa e suporte técnico aos estudantes.', 'Criação de uma plataforma unificada para pedidos desmaterializados de declarações e certificados.'),
(4, 'Binélvia Pololo', 'pic/binelvia.jpg', 'Estudante de secretariado executivo de 21 anos, dedicada à inovação nos fluxos de trabalho administrativos.', 'Atendimento via chat integrado e eliminação total de formulários impressos no campus.');

-- Inserir candidatos da Estatística (19-25 anos)
INSERT INTO est (id, nome, foto, descricao, propostas) VALUES 
(1, 'Herminio Cumbane', 'pic/herminio.jpg', 'Estudante de estatística e ciência de dados de 22 anos, apaixonado por análise preditiva e métricas universitárias.', 'Relatórios de transparência trimestrais publicados em dashboards interativos acessíveis a todos os alunos.'),
(2, 'Benilva da Fátima', 'pic/benilva.jpg', 'Estudante de economia de 23 anos, especialista em previsão orçamental e avaliação de desempenho financeiro.', 'Auditoria estatística rigorosa e transparente de todos os orçamentos participativos da associação.'),
(3, 'Lucas Francísco', 'pic/lucas.jpg', 'Estudante de ciências sociais de 21 anos, pesquisador de dados com forte foco no impacto estudantil.', 'Estudos estatísticos regulares de impacto sobre as medidas e projetos adotados pela associação de estudantes.'),
(4, 'Vasco Limeme', 'pic/vasco.jpg', 'Estudante de engenharia informática de 25 anos, analista de dados orientado para a melhoria contínua de processos.', 'Disponibilização de indicadores públicos em tempo real sobre a execução de projetos e promessas.');

-- Tabelas de votos com restrição de voto único por usuário
CREATE TABLE IF NOT EXISTS p_votos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    p_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (p_id) REFERENCES pres(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    UNIQUE(user_id)
);

CREATE TABLE IF NOT EXISTS s_votos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    s_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (s_id) REFERENCES sec(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    UNIQUE(user_id)
);

CREATE TABLE IF NOT EXISTS e_votos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    e_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (e_id) REFERENCES est(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    UNIQUE(user_id)
);

CREATE TABLE IF NOT EXISTS credencial(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user VARCHAR(50) NOT NULL UNIQUE,
    chave VARCHAR(150) NOT NULL
);


mysql --host=mysql-23d30934-eduardomanuelguambe26-b804.i.aivencloud.com \
      --port=11337 \
      --user=avnadmin \
      --password='AVNS_W0LtYipOgMMnr8qb5wF' \
      --ssl-mode=REQUIRED \
      defaultdb