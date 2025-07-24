CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao_categoria VARCHAR(255) NOT NULL
);

CREATE TABLE tb_produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(255) NOT NULL,
    descricao_produto TEXT NOT NULL,
    peso_kg DECIMAL(5,2) NOT NULL,
    preco_kg DECIMAL(10,2) NOT NULL
);

-- MODIFICANDO A TABELA
ALTER TABLE tb_produtos ADD COLUMN categoria_id INT;

-- CHAVE ESTRANGEIRA
ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id_categoria);

-- MOSTRANDO TABELA tb_categorias
SELECT* FROM tb_categorias;

-- INSERINDO DADOS tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
("Carnes Bovinas", "Cortes tradicionais de boi"),
("Embutidos", "Produtos como linguiça e salsicha"),
("Aves", "Carnes de frango, pato, peru, etc."),
("Exóticas", "Carnes especiais ou não convencionais"),
("Carnes Suínas", "Cortes derivados de porco");

-- MOSTRANDO TABELA tb_produtos
SELECT* FROM tb_produtos;

-- INSERINDO DADOS tb_produtos
INSERT INTO tb_produtos (nome_produto, descricao_produto, peso_kg, preco_kg, categoria_id) VALUES
("Picanha", "Corte nobre bovino com capa de gordura", 1.2, 89.90, 1),
("Costela Bovina", "Ideal para churrasco ou panela", 2.5, 39.90, 1),
("Linguiça Toscana", "Embutido artesanal temperado", 1.0, 24.50, 4),
("Filé de Peito de Frango", "Corte limpo e sem osso", 1.0, 18.90, 3),
("Lombo Suíno", "Corte macio do porco", 1.3, 29.90, 2),
("Frango Inteiro", "Frango congelado com pele e osso", 2.0, 15.50, 3),
("Javali Moído", "Carne exótica para preparo gourmet", 0.8, 100.00, 5),
("Pernil Suíno", "Corte ideal para assados", 3.0, 27.90, 2);

-- PRODUTO MAIOR QUE 100
SELECT * FROM tb_produtos WHERE preco_kg > 100.00;

-- PRODUTO EM 70 E 150
SELECT * FROM tb_produtos WHERE preco_kg BETWEEN 70.00 AND 150.00;

-- BUSCA COM A LETRA C
SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

-- INNER JOIN - UNINDO tb_produtos COM tb_categorias
SELECT 
    p.id_produto,
    p.nome_produto,
    p.descricao_produto,
    p.peso_kg,
    p.preco_kg,
    c.nome_categoria,
    c.descricao_categoria
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c
ON p.categoria_id = c.id_categoria;

-- INNER JOIN - PRODUTOS Carnes Bovinas
SELECT 
    p.id_produto,
    p.nome_produto,
    p.descricao_produto,
    p.peso_kg,
    p.preco_kg,
    c.nome_categoria
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c
ON p.categoria_id = c.id_categoria
WHERE c.nome_categoria = "Carnes Bovinas";
