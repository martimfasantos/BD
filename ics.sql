-- RI-1 --
$$
DROP TRIGGER IF EXISTS RI1
CREATE TRIGGER RI1 
BEFORE INSERT ON tem_outra
FOR EACH ROW 
    BEGIN 
        DECLARE x INT;
        SET x = ( -- RECURSAO??
                );
        IF x > 0 THEN
            RAISERROR ('Categoria nao pode estar contida em si própria');
        END IF
    END
$$

-- RI-4 --
$$
DROP TRIGGER IF EXISTS RI4
CREATE TRIGGER RI4 
BEFORE INSERT ON evento_reposicao
FOR EACH ROW
    BEGIN 
        DECLARE x BIT;
        SET x = (SELECT NEW.unidades > planograma.unidades
                FROM planograma
                GROUP BY ean
                HAVING planograma.ean = NEW.ean
                    AND planograma.nro = NEW.nro
                    AND planograma.num_serie = NEW.num_serie
                    AND planograma.fabricante = NEW.num_serie
                );
        IF x = TRUE THEN
            RAISERROR ('Numero de unidades nao deve excede as especificadas no Planograma.')
        END IF
    END
$$

-- RI-5 --
$$
DROP TRIGGER IF EXISTS RI5
CREATE TRIGGER RI5 
BEFORE INSERT ON evento_reposicao
FOR EACH ROW
    BEGIN 
        DECLARE x INT;
        SET x = (SELECT COUNT(*)
                 FROM prateleira, produto
                 WHERE prateleira.nro = NEW.nro
                    AND prateleira.num_serie = NEW.num_serie
                    AND prateleira.fabricante = NEW.num_serie
                    AND produto.ean = NEW.ean
                    AND produto.cat = prateleira.nome
                );
        IF x = 0 THEN
            RAISERROR ('Produto nao pode ser reposto nesta Prateleira.') ;
        END IF
    END
$$
