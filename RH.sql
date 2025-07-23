CREATE DATABASE db_empresa;
USE db_empresa;

-- TABELA COLABORADOR
CREATE TABLE tb_colaborador(
	idColaborador INT PRIMARY KEY AUTO_INCREMENT,
    nomeColaborador VARCHAR(255) NOT NULL,
    dataNascimento DATE NOT NULL,
    emailColaborador VARCHAR(255) NOT NULL,
    telefoneColaborador VARCHAR(12) NOT NULL,
	nacionalidadeColaborador VARCHAR(50) NOT NULL,
    cargoColaborador VARCHAR(255) NOT NULL,
    salarioColaborador DECIMAL(10,2) NOT NULL
);

SELECT * FROM tb_colaborador;

-- AJUSTES NO TELEFONE NO COLABORADOR
ALTER TABLE tb_colaborador
MODIFY telefoneColaborador VARCHAR(20) NOT NULL;

-- INCEERT DOS DADOS
INSERT INTO tb_colaborador
(nomeColaborador, dataNascimento, emailColaborador, telefoneColaborador, nacionalidadeColaborador, cargoColaborador, salarioColaborador) value
("Lucas", '2000-07-04', "luc@email.com", "11 99999-9999", "Brasileiro", "Gerente", 10000.00),
("Alceu", '1999-03-17', "alceu@email.com", "11 54549-4445", "Brasileiro", "Desenvolvedor front-end", 3500.00),
("Fabiola", '2004-08-26', "fabiola011@email.com", "11 88888-8888", "Brasileira", "Desenvolvedor back-end", 4000.00),
("Paula", '1999-08-18', "paulinhavieira@email.com", "11 1111-2222", "Brasileira", "Gerente de Projetos", 7000.00),
("Larissa", '2003-02-02', "lari@email.com", "11 22222-2222", "Brasileira", "Estagiaria", 2500.00);

-- SALARIO MAIOR QUE 3500
SELECT * FROM tb_colaborador WHERE salarioColaborador > 3500;

-- SALARIO MENOR QUE 3500
SELECT * FROM tb_colaborador WHERE salarioColaborador < 3500;

-- ATUALIZANDO O SALARIO
UPDATE tb_colaborador
SET salarioColaborador = 3000.00
WHERE idColaborador = 5;
