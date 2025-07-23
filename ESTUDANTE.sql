CREATE DATABASE db_escola;
USE db_escola;

CREATE TABLE tb_estudante(
	idEstudante INT PRIMARY KEY AUTO_INCREMENT,
    nomeEstudante VARCHAR(255) NOT NULL,
    dataNascimento date NOT NULL,
    idadeEstudante INT NOT NULL,
    sala VARCHAR(10) NOT NULL,
    nota DECIMAL(6,2) NOT NULL,
    situacaoEstudante VARCHAR(255) NOT NULL
);
SELECT * FROM tb_estudante;

INSERT INTO tb_estudante
(nomeEstudante, dataNascimento, idadeEstudante, sala, nota, situacaoEstudante) VALUES
("Julia", '2009-09-04', 16, "2A", 8.5, "Aprovado"),
("Brino", '2008-07-04', 17, "3D", 6.3, "Recuperação"),
("Larissa", '2008-07-04', 17, "3E", 9.4, "Aprovado"),
("Henrique", '2010-07-04', 15, "1F", 9.0, "Aprovado"),
("Alceu", '2010-07-04', 15, "1B", 7.2, "Aprovado"),
("João", '2009-07-04', 16, "2C", 5.8, "Recuperação"),
("Lara", '2008-07-04', 17, "3D", 3.5, "Reprovado"),
("Galhardo", '2010-07-04', 15, "1A", 7.8, "Aprovado"),
("Pamela", '2010-07-04', 15, "1C", 6.9, "Recuperação"),
("Mauri", '2008-07-05', 17, "3E", 8.9, "Aprovado"),
("Julio", '2008-07-04', 17, "3A", 4.2, "Reprovado");

-- NOTA MAIOR QUE 7
SELECT * FROM tb_estudante WHERE nota > 7.0;

-- NOTA MENOR QUE 7
SELECT * FROM tb_estudante WHERE nota < 7.0;

-- ATUALIZANDO A NOTA DO ESTUDANTE
UPDATE tb_estudante
SET nota =  7.5, situacaoEstudante = "Aprovada"
WHERE idEstudante = 7;
