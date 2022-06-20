-- (RI-1) Uma Categoria nao pode estar contida em si propria --
DELIMITER //

DROP TRIGGER IF EXISTS RI1
CREATE TRIGGER RI1 
BEFORE UPDATE OR INSERT ON tem_outra
FOR EACH ROW
BEGIN 
    IF NEW.super_categoria = NEW.categoria THEN
        RAISERROR ('Categoria nao pode estar contida em si própria');
    END IF
END

DELIMITER ;

-- (RI-4) O número de unidades repostas num Evento de Reposição 
--        não pode exceder o número de unidades especificado no Planograma --
DELIMITER //

DROP TRIGGER IF EXISTS RI4
CREATE TRIGGER RI4 
BEFORE UPDATE OR INSERT ON evento_reposicao
FOR EACH ROW
BEGIN 
    DECLARE max_unidades INTEGER;

    SELECT unidades INTO max_unidades
    FROM planograma
    WHERE planograma.ean = NEW.ean
      AND planograma.nro = NEW.nro
      AND planograma.num_serie = NEW.num_serie
      AND planograma.fabricante = NEW.num_serie;
    
    IF NEW.unidades > max_unidades THEN
        RAISERROR ('Numero de unidades nao deve excede as especificadas no Planograma.')
    END IF
END

DELIMITER ;

-- (RI-5) Um Produto só pode ser reposto numa Prateleira que 
--        apresente (pelo menos) uma das Categorias desse produto --
DELIMITER //

DROP TRIGGER IF EXISTS RI5
CREATE TRIGGER RI5 
BEFORE UPDATE OR INSERT ON evento_reposicao
FOR EACH ROW
BEGIN 
    DECLARE categ_prateleira VARCHAR(50);
    DECLARE categs_produto CURSOR FOR 
        SELECT nome FROM tem_categoria WHERE ean = NEW.ean;
    DECLARE categoria VARCHAR(50);
    DECLARE valido BIT(1) DEFAULT FALSE;
    
    OPEN categs_produto;
    FETCH NEXT FROM categs_produto INTO categoria 
    WHILE @@FETCH_STATUS = 0 
        BEGIN
            IF categoria = categoria_prat THEN
                SET valido = TRUE;
                BREAK;
            END IF;
            FETCH NEXT FROM categs_produto INTO categoria 
        END
    IF valido = FALSE THEN
        RAISERROR ('Produto nao pode ser reposto nesta Prateleira.') ;
    END IF
END

DELIMITER ;