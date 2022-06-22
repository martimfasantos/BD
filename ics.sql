DROP TRIGGER IF EXISTS ri1 ON tem_outra;
DROP TRIGGER IF EXISTS ri4 ON evento_reposicao;
DROP TRIGGER IF EXISTS ri5 ON evento_reposicao;

---------------------------------------------------------------
-- (RI-1) Uma Categoria nao pode estar contida em si propria --
---------------------------------------------------------------

CREATE OR REPLACE FUNCTION nao_contem() RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.super_categoria = NEW.categoria THEN
        RAISE EXCEPTION 'Categoria nao pode estar contida em si própria';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ri1 
BEFORE UPDATE OR INSERT ON tem_outra
FOR EACH ROW EXECUTE PROCEDURE nao_contem();


-----------------------------------------------------------------------------
-- (RI-4) O número de unidades repostas num Evento de Reposição            -- 
--        não pode exceder o número de unidades especificado no Planograma --
-----------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION nao_excede() RETURNS TRIGGER AS
$$
DECLARE max_unidades INTEGER;
BEGIN
    SELECT unidades INTO max_unidades
    FROM planograma
    WHERE planograma.ean = NEW.ean
      AND planograma.nro = NEW.nro
      AND planograma.num_serie = NEW.num_serie
      AND planograma.fabricante = NEW.num_serie;
    
    IF NEW.unidades > max_unidades THEN
        RAISE EXCEPTION 'Numero de unidades nao deve excede as especificadas no Planograma: %', max_unidades;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ri4 
BEFORE UPDATE OR INSERT ON evento_reposicao
FOR EACH ROW EXECUTE PROCEDURE nao_excede();


--------------------------------------------------------------------
-- (RI-5) Um Produto só pode ser reposto numa Prateleira que      --
--        apresente (pelo menos) uma das Categorias desse produto --
--------------------------------------------------------------------

CREATE OR REPLACE FUNCTION apresenta_categoria() RETURNS TRIGGER AS
$$
DECLARE 
    categ_prateleira VARCHAR(50);
    categs_produto CURSOR FOR 
        SELECT nome FROM tem_categoria WHERE ean = NEW.ean;
    categoria VARCHAR(50);
BEGIN
    SELECT nome
    INTO categ_prateleira
    FROM prateleira
    WHERE nro = NEW.nro 
        AND num_serie = NEW.num_serie 
        AND fabricante = NEW.fabricante;
    
    OPEN categs_produto;
    LOOP
        FETCH NEXT FROM categs_produto INTO categoria;
        EXIT WHEN NOT FOUND; 

        IF categoria = categoria_prat THEN
            RETURN NEW;
        END IF;

    END LOOP;
    CLOSE categs_produto;
        
    RAISE EXCEPTION 'Produto nao pode ser reposto nesta Prateleira.';
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ri5
BEFORE UPDATE OR INSERT ON evento_reposicao
FOR EACH ROW EXECUTE PROCEDURE apresenta_categoria();