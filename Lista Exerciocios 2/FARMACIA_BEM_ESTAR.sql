CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao_categoria VARCHAR(255) NOT NULL
);

CREATE TABLE tb_produtos(
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(255) NOT NULL,
    descricao_produto VARCHAR(255) NOT NULL,
    quantidade_produto VARCHAR(255) NOT NULL,
    validade DATE NOT NULL,
    preco DECIMAL(10,2) NOT NULL
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
("Higiene", "Produtos de higiene pessoal"),
("Vitaminas", "Suplementos vitamínicos e minerais"),
("Medicamentos", "Remédios com e sem prescrição"),
("Dermocosméticos", "Cuidados com a pele e cabelos"),
("Infantil", "Produtos para bebês e crianças");

-- MOSTRANDO TABELA tb_produtos
SELECT* FROM tb_produtos;

-- INSERINDO DADOS tb_produtos
INSERT INTO tb_produtos (nome_produto, descricao_produto, quantidade_produto, validade, preco, categoria_id) VALUES
("Dipirona 500mg", "Analgésico e antitérmico", 20, '2026-01-10', 12.50, 1),
("Sabonete Antisséptico", "Sabonete para uso diário", 30, '2025-10-15', 7.90, 2),
("Paracetamol 750mg", "Alívio de dor e febre", 25, '2025-12-20', 9.50, 1),
("Vitamina C 1000mg", "Reforço imunológico", 15, '2026-03-01', 35.00, 3),
("Shampoo Antiqueda", "Fortalece os fios", 12, '2025-08-15', 52.00, 4),
("Pomada para Assadura", "Uso infantil", 18, '2025-06-01', 16.90, 5),
("Multivitamínico A-Z", "Suplemento completo", 10, '2027-01-01', 61.90, 3),
("Protetor Solar FPS 60", "Alta proteção UVA/UVB", 8, '2026-12-01', 59.90, 4);

-- PRODUTO MAIOR QUE 50
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- PRODUTO EM 5 E 60
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

-- BUSCA COM A LETRA C
SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

-- INNER JOIN - UNINDO tb_produtos COM tb_categorias
SELECT 
    p.id_produto,
    p.nome_produto,
    p.descricao_produto,
    p.quantidade_produto,
    p.validade,
    p.preco,
    c.nome_categoria,
    c.descricao_categoria
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c
ON p.categoria_id = c.id_categoria;

-- INNER JOIN - PRODUTOS INFANTIL
SELECT 
    p.id_produto,
    p.nome_produto,
    p.descricao_produto,
    p.quantidade_produto,
    p.validade,
    p.preco,
    c.nome_categoria
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c
ON p.categoria_id = c.id_categoria
WHERE c.nome_categoria = "Infantil";

