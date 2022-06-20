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
