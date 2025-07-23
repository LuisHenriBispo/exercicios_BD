CREATE DATABASE tb_ecommerce;
USE tb_ecommerce;

CREATE TABLE tb_produtoJardinagem(
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nomeProduto VARCHAR(255) NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL,
    preco DECIMAL(6,2) NOT NULL
);

SELECT * FROM tb_produtoJardinagem;

-- PRODUTOS INCERIDOS
INSERT INTO tb_produtoJardinagem 
(nomeProduto, categoria, descricao, quantidade, preco) VALUES
("Pá de Jardinagem", "Ferramentas", "Pá metálica pequena com cabo de madeira", 100, 45.00),
("Tesoura de Poda", "Ferramentas", "Tesoura de poda com lâmina de aço inox", 50, 89.90),
("Sementes de Tomate", "Sementes", "Pacote com 50g de sementes de tomate", 200, 12.00),
("Adubo Orgânico", "Fertilizantes", "Adubo natural para crescimento de plantas", 75, 120.00),
("Mangueira 30m", "Irrigação", "Mangueira flexível com esguicho, 30 metros", 40, 299.90),
("Carrinho de Mão", "Equipamentos", "Carrinho de mão com estrutura reforçada", 20, 650.00),
("Kit Jardinagem Completo", "Kits", "Kit com 5 ferramentas e luvas", 60, 189.90),
("Estufa Doméstica", "Cultivo", "Estufa para cultivo em ambientes pequenos", 10, 850.00);

-- PRODUTOS MAIOR QUE 500
SELECT * FROM tb_produtoJardinagem WHERE preco > 500;

-- PRODUTOS MENOR QUE 500
SELECT * FROM tb_produtoJardinagem WHERE preco < 500;

-- ATUALIZANDO O PRECO DE UM PRODUTO
UPDATE tb_produtoJardinagem
SET preco = 250.00
WHERE idProduto = 5;