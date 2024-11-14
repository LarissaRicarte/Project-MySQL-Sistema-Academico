-- create
CREATE TABLE professores (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(40) NOT NULL,
  especializacao VARCHAR(20) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  salario FLOAT NOT NULL
);

CREATE TABLE salas (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(40) NOT NULL,
  capacidade INTEGER DEFAULT(20),
  bloco VARCHAR(40) NOT NULL
);

CREATE TABLE cursos (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(40) NOT NULL,
  n_semestres INTEGER DEFAULT(8),
  ch INTEGER DEFAULT(64),
  area VARCHAR(20) NOT NULL
);

CREATE TABLE alunos (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(40) NOT NULL,
  matricula VARCHAR(10) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  idCurso int NOT NULL,
  foreign key (idCurso) references cursos(id)
);

CREATE TABLE disciplinas (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  ch INTEGER DEFAULT(64),
  semestre INTEGER NOT NULL,
  nome VARCHAR(10),
  idCurso int,
  foreign KEY (idCurso) references cursos(id)
);

CREATE TABLE turmas (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  cod_turma VARCHAR(10) NOT NULL,
  capacidade INTEGER DEFAULT(20),
  modalidade VARCHAR(3) NOT NULL,
  turno CHAR NOT NULL,
  idDisciplina INT,
  idSala INT,
  idProfessor INT,
  foreign KEY (idDisciplina) references disciplinas(id),
  foreign KEY (idSala) references salas(id),
  foreign KEY (idProfessor) references professores(id)
);

CREATE TABLE alunos_turmas (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  idAluno INT,
  foreign KEY (idAluno) references alunos(id),
  idTurma INT,
  foreign KEY (idTurma) references turmas(id),
  nota FLOAT
);



-- INSERINDO DADOS
-- Inserir cursos
INSERT INTO cursos (nome, n_semestres, ch, area) VALUES
('Engenharia de Software', 8, 3200, 'Tecnologia'),
('Direito', 10, 4000, 'Humanas'),
('Medicina', 12, 4800, 'Saúde'),
('Arquitetura', 10, 3600, 'Artes'),
('Administração', 8, 2800, 'Negócios');

-- Inserir professores
INSERT INTO professores (nome, especializacao, cpf, salario) VALUES
('Ana Silva', 'Tecnologia', '123.456.789-01', 6789.99),
('Carlos Lima', 'Direito', '234.567.890-12', 4567.88),
('Beatriz Santos', 'Saúde', '345.678.901-23', 8907.88),
('Daniel Costa', 'Artes', '456.789.012-34', 10987.99),
('Fernanda Souza', 'Negócios', '567.890.123-45', 4345.77),
('Gustavo Almeida', 'Tecnologia', '678.901.234-56', 6543.55),
('Heloisa Rocha', 'Humanas', '789.012.345-67', 7898.55),
('Isabela Ribeiro', 'Saúde', '890.123.456-78', 9764.88);

-- Inserir alunos
INSERT INTO alunos (nome, matricula, cpf, idCurso) VALUES
('Lucas Pereira', '2022001', '111.222.333-44', 1),
('Mariana Oliveira', '2022002', '222.333.444-55', 2),
('João Fernandes', '2022003', '333.444.555-66', 3),
('Amanda Rocha', '2022004', '444.555.666-77', 4),
('Bruno Costa', '2022005', '555.666.777-88', 5),
('Carolina Azevedo', '2022006', '666.777.888-99', 1),
('Felipe Martins', '2022007', '777.888.999-00', 2),
('Laura Almeida', '2022008', '888.999.000-11', 3),
('Gabriel Souza', '2022009', '999.000.111-22', 4),
('Vanessa Lima', '2022010', '000.111.222-33', 5),
('Lucas Vendaval', '2022011', '111.232.443-44', 1),
('Marilene Oliveira', '2022012', '222.773.844-00', 2),
('Paulo Fernandes', '2022013', '354.574.895-66', 3);

-- Inserir salas
INSERT INTO salas (nome, capacidade, bloco) VALUES
('Sala A', 30, 'Bloco 1'),
('Sala B', 25, 'Bloco 2'),
('Sala C', 20, 'Bloco 1'),
('Sala D', 40, 'Bloco 3'),
('Sala E', 35, 'Bloco 2');

-- Inserir disciplinas
INSERT INTO disciplinas (ch, semestre, nome, idCurso) VALUES
(64, 1, 'História', 1),
(80, 2, 'Geografia', 2),
(96, 1, 'Matemática', 3),
(72, 2, 'Português', 4),
(88, 1, 'Química', 5),
(64, 3, 'Biologia', 1),
(80, 4, 'Artes', 2);

-- Inserir turmas
INSERT INTO turmas (cod_turma, capacidade, modalidade, turno, idDisciplina,
idSala, idProfessor) VALUES
('T01', 20, 'P', 'M', 1, 1, 1),
('T02', 25, 'P', 'T', 2, 2, 2),
('T03', 20, 'O', 'N', 3, NULL, 3),
('T04', 30, 'P', 'M', 4, 4, 4),
('T05', 30, 'O', 'T', 2, NULL, 4);

-- Matricular alunos em turmas
INSERT INTO alunos_turmas (idAluno, idTurma, nota) VALUES
(1, 1, 8.7),
(1, 2, 9.5),
(2, 2, 4.6),
(2, 3, 5.6),
(3, 1, 9.8),
(3, 4, 9.3),
(4, 3, 7.2),
(4, 4, 2.3),
(5, 1, 4.5),
(5, 2, 8.4),
(6, 2, 9.3),
(6, 3, 2.3),
(7, 1, 4.8),
(7, 4, 9.3),
(8, 2, 2.1),
(8, 3, 10.0),
(9, 3, 3.9),
(9, 4, 10.0),
(10, 1, 9.4),
(10, 2, 3.8),
(12, 5, 9.2);
