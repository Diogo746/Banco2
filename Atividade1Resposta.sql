CREATE SCHEMA	universidade;

USE universidade;

CREATE TABLE  professores(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
departamento VARCHAR(100),
data_contratacao DATE
);

ALTER TABLE professores
ADD salario DECIMAL(10, 2);

ALTER TABLE professores
DROP COLUMN departamento;

CREATE TABLE disciplinas(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
carga_horaria INT,
FOREIGN KEY (id_professor) REFERENCES professores(id)
);

ALTER TABLE disciplinas
ADD descricao VARCHAR(255);

DROP TABLE disciplinas; 

CREATE TABLE departamento (
id  INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
bloco VARCHAR(100),
data_criacao DATE
);

INSERT INTO departamento (nome, bloco, data_criacao)
VALUES
( 'Engenharia', 'Bloco E', '2005-03-15'),
( 'Administração', 'Bloco F', '2010-06-20');

ALTER TABLE professores
ADD salario DECIMAL(10, 2);

ALTER TABLE professores
ADD bloco VARCHAR (100);

CREATE TABLE  empregados(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
departamento VARCHAR(100),
data_contratacao DATE,
salario DECIMAL(10, 2)
);

INSERT INTO empregados (nome, data_contratacao, salario, departamento)
VALUES
( 'Lucas Fernandes',  '2022-09-01', 7500.00,  'Tecnologia da Informação');

CREATE TABLE biblioteca.livro (
id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100),
data_publicacao YEAR,
categoria VARCHAR(50),
ISBN VARCHAR(50),
FOREIGN KEY (id_editora) REFERENCES editora(id)
);

INSERT INTO biblioteca.livro (titulo, data_publicacao, categoria, ISBN, editora)
VALUES
('Banco de Dados Avançado', 2021, 'Banco de Dados', '123456789', 'Novatec');

INSERT INTO empregados (nome, data_contratacao, salario, departamento)
VALUES
( 'Carlos Júnior', '2023-08-11', 4000.00, 'Tecnologia da Informação');

UPDATE empregados
SET salario = 5500.00
WHERE nome = 'Carlos Júnior';

CREATE TABLE editora (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
cidade VARCHAR(50)
);


UPDATE editora
SET cidade = 'Brasília'
WHERE nome = 'Intrinseca'; 

INSERT INTO professores (nome, departamento, data_contratacao, salario) 
VALUES ('Mariana Barbosa', 'Tecnologia da Informação', '2023-03-22', 4500.00);

DELETE FROM professores
WHERE nome = 'Mariana Barbosa';

DELETE FROM biblioteca.livro
WHERE data_publicacao < '2015-01-01';

SELECT * FROM professores
ORDER BY salario DESC;

SELECT * FROM professores
WHERE salario > 5000.00
AND data_contratacao < '2020-01-01';

SELECT departamento, COUNT(*) AS quantidade_empregados
FROM professores
GROUP BY departamento;

SELECT departamento, SUM(salario) AS total_salarios
FROM professores
GROUP BY departamento;

SELECT MAX(salario) AS maior_salario
FROM professores;

SELECT livro.titulo, editora.nome AS editora
FROM livro
JOIN editora ON livro.editora_id = editora.id;

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) 
);

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_livro INT,
    data_devolucao DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id),
    FOREIGN KEY (id_livro) REFERENCES livros(id)
);

SELECT alunos.nome AS aluno, livros.titulo AS livro, emprestimos.data_devolucao
FROM Emprestimos
JOIN Alunos ON Emprestimos.id_aluno = alunos.id
JOIN Livros ON Emprestimos.id_livro = livros.id;


SELECT livros.titulo AS livro, alunos.nome AS aluno
FROM emprestimos
JOIN alunos ON emprestimos.id_aluno = alunos.id
JOIN livros ON emprestimos.id_livro = livros.id;

SELECT departamento, AVG(salario) AS media_salarial
FROM professores
GROUP BY departamento;

CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

SELECT DISTINCT autores.nome AS autor
FROM livros
JOIN autores ON livros.id_autor = autores.id
JOIN editora ON livros.editora_id = editora.id
WHERE editora.nome = 'Novatec';






