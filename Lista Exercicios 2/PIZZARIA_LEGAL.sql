CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao_categoria VARCHAR(255) NOT NULL
);

CREATE TABLE tb_pizzas (
    id_pizza INT PRIMARY KEY AUTO_INCREMENT,
    nome_pizza VARCHAR(255) NOT NULL,
    ingredientes VARCHAR(255) NOT NULL,
    tamanho_pizza VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- MODIFICANDO A TABELA
ALTER TABLE tb_pizzas ADD COLUMN categoria_id INT;

-- CHAVE ESTRANGEIRA
ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_categorias
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id_categoria);

-- MOSTRANDO TABELA tb_categorias
SELECT* FROM tb_categorias;

-- INSERINDO DADOS tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
("Tradicional", "Pizzas salgadas com sabores clássicos"),
("Vegetariana", "Pizzas sem ingredientes de origem animal"),
("Doce", "Pizzas com recheio doce"),
("Especial", "Sabores exclusivos da casa"),
("Premium", "Pizzas gourmet com ingredientes selecionados");

-- MOSTRANDO TABELA tb_pizzas
SELECT* FROM tb_pizzas;

-- INSERINDO DADOS tb_pizzas
INSERT INTO tb_pizzas (nome_pizza, ingredientes, tamanho_pizza, preco, categoria_id) VALUES
("Margherita", "Molho de tomate, mussarela, manjericão", "Média", 42.00, 1),
("Quatro Queijos", "Mussarela, gorgonzola, provolone, parmesão", "Grande", 48.50, 1),
("Frango com Catupiry", "Frango desfiado, catupiry, mussarela", "Grande", 47.00, 4),
("Chocolate com Morango", "Chocolate, morango, leite condensado", "Média", 55.00, 3),
("Veggie Mix", "Abobrinha, berinjela, cebola, pimentão", "Média", 44.90, 2),
("Pepperoni", "Molho, mussarela, pepperoni", "Grande", 50.00, 1),
("Brigadeiro", "Chocolate, granulado, leite condensado", "Média", 49.00, 3),
("Camarão Premium", "Camarão, requeijão, alho poró", "Grande", 89.90, 5);

-- PIZZAS VALOR MAIOR DE 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- PIZZAS VALOR ENTRE 50,00 e 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- PIZZAS COM NOME COM A LETRA M
SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

-- INNER JOIN - UNINDO tb_pizzas COM tb_categorias
SELECT 
    p.id_pizza,
    p.nome_pizza,
    p.ingredientes,
    p.tamanho_pizza,
    p.preco,
    c.nome_categoria
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c
ON p.categoria_id = c.id_categoria;

-- INNER JOIN - PIZZAS DOCE
SELECT 
    p.id_pizza,
    p.nome_pizza,
    p.preco,
    c.nome_categoria
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c
ON p.categoria_id = c.id_categoria
WHERE c.nome_categoria = "Doce";
