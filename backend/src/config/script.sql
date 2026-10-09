CREATE SCHEMA IF NOT EXISTS gerenciar_evento ;
USE gerenciar_evento ;

CREATE TABLE locais (
  id_locais INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL,
  endereco VARCHAR(200) NOT NULL,
  capacidade_maxima INT NOT NULL,
  cidade VARCHAR(100) NOT NULL
  );

CREATE TABLE eventos (
  id_eventos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(200) NOT NULL,
  data_evento DATE NOT NULL,
  horario TIME NOT NULL,
  locais_id INT NOT NULL,
  CONSTRAINT fk_locais_id FOREIGN KEY (locais_id) REFERENCES locais(id_locais) ON DELETE CASCADE
  );

CREATE TABLE participantes (
  id_participantes INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL,
  telefone CHAR(12) NOT NULL
  );

CREATE TABLE inscricoes (
  id_inscricoes INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  locais_id INT NOT NULL,
  evento_id INT NOT NULL,
  participante_id INT NOT NULL,
  CONSTRAINT fk_locais_incricao_id FOREIGN KEY (locais_id) REFERENCES locais(id_locais) ON DELETE CASCADE,
  CONSTRAINT fk_eventos_id FOREIGN KEY (evento_id) REFERENCES eventos(id_eventos) ON DELETE CASCADE,
  CONSTRAINT fk_participantes_id FOREIGN KEY (participante_id) REFERENCES participantes(id_participantes) ON DELETE CASCADE
  );
  
  INSERT INTO locais (nome, endereco, capacidade_maxima, cidade) VALUES
  ('Catapinbas', 'Rua Takamasa Nomuro', 1788, 'Gui'),
  ('Westguy', 'Rua Jorge da Silva', 450, 'Desgraça'),
  ('South Park', 'Rua Gunter Leave', 99999, 'Torânia');
  
  INSERT INTO eventos (nome, descricao, data_evento, horario, locais_id) VALUES
  ('Feira de Tecnologia', 'Feira de demonstração de novas tecnologias', '2026-08-27', '13:00', 1),
  ('G3', 'Lugar que demonstra novos jogos e suas inovações', '2026-09-12', '09:30', 2),
  ('Carne de matar', 'Assados de carne no geral', '2026-10-23', '17:15', 3);
  
  INSERT INTO participantes (nome, email, telefone) VALUES
  ('Josoáres Gil', 'fanfarao@gmai.com', '4798563-1238'),
  ('Tonhão do Baril', 'sanduiche@gmail.com', '4790231-7985'),
  ('Maria Gunslink', 'mariahdad@gmail.com', '4798203-6425');
  
  INSERT INTO inscricoes (locais_id, evento_id, participante_id) VALUES
  (1,1,1),
  (2,2,2),
  (3,3,3);