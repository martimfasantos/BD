DROP TABLE IF EXISTS evento_reposicao;
DROP TABLE IF EXISTS responsavel_por;
DROP TABLE IF EXISTS retalhista;
DROP TABLE IF EXISTS planograma;
DROP TABLE IF EXISTS prateleira;
DROP TABLE IF EXISTS instalada_em;
DROP TABLE IF EXISTS ponto_de_retalho;
DROP TABLE IF EXISTS IVM;
DROP TABLE IF EXISTS tem_categoria;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS tem_outra;
DROP TABLE IF EXISTS super_categoria;
DROP TABLE IF EXISTS categoria_simples;
DROP TABLE IF EXISTS categoria;

CREATE TABLE categoria (
    nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE categoria_simples (
    nome VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (nome) REFERENCES categoria(nome)
);

CREATE TABLE super_categoria (
    nome VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (nome) REFERENCES categoria(nome)
);

CREATE TABLE tem_outra (
    super_categoria VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (super_categoria) REFERENCES super_categoria(nome),
    FOREIGN KEY (categoria) REFERENCES categoria(nome),
    CONSTRAINT CHK_category CHECK (super_categoria != categoria) -- RI-RE5 --
);

CREATE TABLE produto (
    ean CHAR(13) PRIMARY KEY,
    cat VARCHAR(50) NOT NULL, 
    descr VARCHAR(200),
    FOREIGN KEY (cat) REFERENCES categoria(nome)
);
    
CREATE TABLE tem_categoria (
    ean CHAR(13) NOT NULL,
    nome VARCHAR(50) NOT NULL, 
    PRIMARY KEY (ean, nome),
    FOREIGN KEY (ean) REFERENCES produto(ean),
    FOREIGN KEY (nome) REFERENCES categoria(nome)
);

CREATE TABLE IVM (
    num_serie SERIAL NOT NULL,
    fabricante VARCHAR(50) NOT NULL, 
    PRIMARY KEY (num_serie, fabricante)
);

CREATE TABLE ponto_de_retalho (
    nome VARCHAR(50) PRIMARY KEY,
    distrito VARCHAR(50) NOT NULL,
    concelho VARCHAR(50) NOT NULL
);

CREATE TABLE instalada_em (
    num_serie SERIAL NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    local VARCHAR(50) NOT NULL,
    PRIMARY KEY (num_serie, fabricante),
    FOREIGN KEY (num_serie, fabricante) REFERENCES IVM(num_serie, fabricante),
    FOREIGN KEY (local) REFERENCES ponto_de_retalho(nome)
);

CREATE TABLE prateleira (
    nro INTEGER NOT NULL,
    num_serie SERIAL NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    altura FLOAT,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (nro, num_serie, fabricante),
    FOREIGN KEY (num_serie, fabricante) REFERENCES IVM(num_serie, fabricante),
    FOREIGN KEY (nome) REFERENCES categoria(nome)
);

CREATE TABLE planograma (
    ean CHAR(13) NOT NULL,
    nro INTEGER NOT NULL,
    num_serie SERIAL NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    faces INTEGER,
    unidades INTEGER,
    loc VARCHAR(50),
    PRIMARY KEY (ean, nro, num_serie, fabricante),
    FOREIGN KEY (ean) REFERENCES produto(ean),
    FOREIGN KEY (nro, num_serie, fabricante) REFERENCES prateleira(nro, num_serie, fabricante)
);

CREATE TABLE retalhista (
    tin CHAR(9) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    UNIQUE(nome)    -- RI-RE7 --
);

CREATE TABLE responsavel_por (
    nome_cat VARCHAR(50) NOT NULL,
    tin CHAR(9) NOT NULL,
    num_serie SERIAL NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    PRIMARY KEY (num_serie, fabricante),
    FOREIGN KEY (num_serie, fabricante) REFERENCES IVM(num_serie, fabricante),
    FOREIGN KEY (tin) REFERENCES retalhista(tin),
    FOREIGN KEY (nome_cat) REFERENCES categoria(nome)
);

CREATE TABLE evento_reposicao (
    ean CHAR(13) NOT NULL,
    nro INTEGER NOT NULL,
    num_serie SERIAL NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    instante TIMESTAMP,
    unidades INTEGER,
    tin CHAR(9) NOT NULL,
    PRIMARY KEY (ean, nro, num_serie, fabricante, instante),
    FOREIGN KEY (ean, nro, num_serie, fabricante) REFERENCES planograma(ean, nro, num_serie, fabricante),
    FOREIGN KEY (tin) REFERENCES retalhista(tin)
);


---- Categoria ---- 
INSERT INTO categoria VALUES ('Comida');
INSERT INTO categoria VALUES ('Bebida');
INSERT INTO categoria VALUES ('Take Away');
INSERT INTO categoria VALUES ('Snacks');
INSERT INTO categoria VALUES ('Bebidas Zero');
INSERT INTO categoria VALUES ('Bebidas Energeticas');
 
---- Super Categoria ---- 
INSERT INTO super_categoria VALUES ('Comida');
INSERT INTO super_categoria VALUES ('Bebida');

---- Categoria Simples ---- 
INSERT INTO categoria_simples VALUES ('Take Away');
INSERT INTO categoria_simples VALUES ('Snacks');
INSERT INTO categoria_simples VALUES ('Bebidas Zero');
INSERT INTO categoria_simples VALUES ('Bebidas Energeticas');
 
---- tem_outra ---- 
INSERT INTO tem_outra VALUES ('Comida', 'Take Away');
INSERT INTO tem_outra VALUES ('Comida', 'Snacks');
INSERT INTO tem_outra VALUES ('Bebida', 'Bebidas Zero');
INSERT INTO tem_outra VALUES ('Bebida', 'Bebidas Energeticas');
 
---- Produto ---- 
INSERT INTO produto VALUES ('7499448750431', 'Take Away', 'Perna de frango');
INSERT INTO produto VALUES ('8601139975576', 'Take Away', 'Hamburguer');
INSERT INTO produto VALUES ('4040298751684', 'Snacks', 'Lays Presunto');
INSERT INTO produto VALUES ('6466097307924', 'Bebidas Zero', 'Coca-Cola Zero');
INSERT INTO produto VALUES ('3274673078338', 'Bebidas Energeticas', 'Red Bull');
INSERT INTO produto VALUES ('2662602572197', 'Comida', 'Pastel de Nata');
INSERT INTO produto VALUES ('4832423897296', 'Bebida', 'Leite UCAL Chocolate');
 
---- tem_categoria ---- 
INSERT INTO tem_categoria VALUES ('2662602572197', 'Comida');
INSERT INTO tem_categoria VALUES ('7499448750431', 'Take Away');
INSERT INTO tem_categoria VALUES ('4040298751684', 'Snacks');
INSERT INTO tem_categoria VALUES ('4832423897296', 'Bebida');
INSERT INTO tem_categoria VALUES ('6466097307924', 'Bebidas Zero');
INSERT INTO tem_categoria VALUES ('3274673078338', 'Bebidas Energeticas');
INSERT INTO tem_categoria VALUES ('8601139975576', 'Take Away');
 
---- IVM ---- 
INSERT INTO IVM VALUES ('123', 'Tecnovending');
INSERT INTO IVM VALUES ('234', 'Tecnovending');
INSERT INTO IVM VALUES ('345', 'Activeblue');
INSERT INTO IVM VALUES ('456', 'Activeblue');
INSERT INTO IVM VALUES ('567', 'Tecnovending');
INSERT INTO IVM VALUES ('678', 'Tecnovending');
 
---- Ponto de Retalho ---- 
INSERT INTO ponto_de_retalho VALUES ('Pingo Doce Telheiras', 'Lisboa', 'Lisboa');
INSERT INTO ponto_de_retalho VALUES ('Lidl Vilamoura', 'Faro', 'Albufeira');
INSERT INTO ponto_de_retalho VALUES ('Continente Cascais', 'Lisboa', 'Cascais');
INSERT INTO ponto_de_retalho VALUES ('Continente Praia da Rocha', 'Faro', 'Portimao');
 
---- instalada_em ---- 
INSERT INTO instalada_em VALUES ('123', 'Tecnovending', 'Pingo Doce Telheiras');
INSERT INTO instalada_em VALUES ('234', 'Tecnovending', 'Lidl Vilamoura');
INSERT INTO instalada_em VALUES ('345', 'Activeblue', 'Continente Cascais');
INSERT INTO instalada_em VALUES ('456', 'Activeblue', 'Continente Praia da Rocha');
INSERT INTO instalada_em VALUES ('567', 'Tecnovending', 'Pingo Doce Telheiras');
INSERT INTO instalada_em VALUES ('678', 'Tecnovending', 'Pingo Doce Telheiras');
 
---- Prateleira ---- 
INSERT INTO prateleira VALUES ('1', '123', 'Tecnovending', '0.2', 'Take Away');
INSERT INTO prateleira VALUES ('2', '234', 'Tecnovending', '0.5', 'Snacks');
INSERT INTO prateleira VALUES ('3', '567', 'Tecnovending', '0.3', 'Bebidas Zero');
INSERT INTO prateleira VALUES ('4', '678', 'Tecnovending', '0.7', 'Bebidas Energeticas');
INSERT INTO prateleira VALUES ('5', '345', 'Activeblue', '0.3', 'Snacks');
INSERT INTO prateleira VALUES ('6', '456', 'Activeblue', '0.3', 'Take Away');
INSERT INTO prateleira VALUES ('7', '456', 'Activeblue', '0.9', 'Bebidas Zero');
INSERT INTO prateleira VALUES ('8', '456', 'Activeblue', '0.4', 'Comida');
 
---- Planograma ---- 
INSERT INTO planograma VALUES ('7499448750431', '1', '123', 'Tecnovending', '3', '100', 'cima');
INSERT INTO planograma VALUES ('8601139975576', '1', '123', 'Tecnovending', '4', '59', 'baixo');
INSERT INTO planograma VALUES ('4040298751684', '2', '234', 'Tecnovending', '7', '45', 'esquerda');
INSERT INTO planograma VALUES ('6466097307924', '3', '567', 'Tecnovending', '10', '44', 'direita');
INSERT INTO planograma VALUES ('3274673078338', '4', '678', 'Tecnovending', '2', '40', 'cima');
INSERT INTO planograma VALUES ('4040298751684', '5', '345', 'Activeblue', '9', '55', 'baixo');
INSERT INTO planograma VALUES ('7499448750431', '6', '456', 'Activeblue', '4', '23', 'esquerda');
INSERT INTO planograma VALUES ('6466097307924', '7', '456', 'Activeblue', '3', '56', 'direita');
INSERT INTO planograma VALUES ('2662602572197', '8', '456', 'Activeblue', '1', '5', 'direita');
 
---- Retalhista ---- 
INSERT INTO retalhista VALUES ('257399892', 'Tio Ze Manel');
INSERT INTO retalhista VALUES ('257399823', 'Joao Pecados');
 
---- responsavel_por ---- 
INSERT INTO responsavel_por VALUES ('Take Away', '257399892', '123', 'Tecnovending');
INSERT INTO responsavel_por VALUES ('Snacks', '257399892', '234', 'Tecnovending');
INSERT INTO responsavel_por VALUES ('Bebidas Zero', '257399892', '567', 'Tecnovending');
INSERT INTO responsavel_por VALUES ('Bebidas Energeticas', '257399892', '678', 'Tecnovending');
INSERT INTO responsavel_por VALUES ('Snacks', '257399892', '345', 'Activeblue');
INSERT INTO responsavel_por VALUES ('Bebidas Zero', '257399823', '456', 'Activeblue');
 
---- Evento de Reposicao ---- 
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '123', 'Tecnovending', '2005-12-21 21:35:14', '43', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '1', '123', 'Tecnovending', '2004-04-17 04:56:05', '42', '257399892');
INSERT INTO evento_reposicao VALUES ('4040298751684', '2', '234', 'Tecnovending', '2004-04-17 04:56:05', '42', '257399892');
INSERT INTO evento_reposicao VALUES ('4040298751684', '2', '234', 'Tecnovending', '2003-05-01 04:56:05', '13', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '3', '567', 'Tecnovending', '2012-07-22 14:26:25', '28', '257399892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '4', '678', 'Tecnovending', '2012-07-22 14:26:25', '28', '257399892');
INSERT INTO evento_reposicao VALUES ('4040298751684', '5', '345', 'Activeblue', '2020-11-19 11:22:06', '44', '257399892');
INSERT INTO evento_reposicao VALUES ('7499448750431', '6', '456', 'Activeblue', '2020-11-19 11:22:06', '44', '257399892');
INSERT INTO evento_reposicao VALUES ('7499448750431', '6', '456', 'Activeblue', '2020-11-17 00:05:11', '10', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '7', '456', 'Activeblue', '2020-11-19 11:22:06', '44', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '7', '456', 'Activeblue', '2020-12-08 02:04:03', '12', '257399823');
