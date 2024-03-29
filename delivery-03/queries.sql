------------------------------------------------------------------
-- Qual o nome do retalhista (ou retalhistas) responsáveis pela -- 
--          reposição do maior número de categorias?            --
------------------------------------------------------------------

SELECT nome_ret
FROM retalhista NATURAL JOIN responsavel_por
GROUP BY nome_ret 
HAVING COUNT(DISTINCT nome_cat) >= ALL ( 
        SELECT COUNT(DISTINCT nome_cat) 
        FROM responsavel_por
        GROUP BY tin );

-- ## Expected: Tio Ze Manel
        
----------------------------------------------------------------        
-- Qual o nome do ou dos retalhistas que são responsáveis por --
--               todas as categorias simples?                 --
----------------------------------------------------------------

SELECT nome_ret
FROM retalhista  
        NATURAL JOIN responsavel_por 
        NATURAL JOIN categoria_simples
GROUP BY nome_ret
HAVING COUNT(DISTINCT nome_cat) = ( 
        SELECT COUNT(*) 
        FROM categoria_simples );

-- ## Expected: Tio Ze Manel

-------------------------------------------------------
-- Quais os produtos (ean) que nunca foram repostos? --
-------------------------------------------------------

SELECT ean
FROM produto
WHERE ean NOT IN (SELECT ean FROM evento_reposicao);

-- ## Expected: 2662602572197 -> Pastel de Nata
--              4832423897296 -> Leite UCAL Chocolate


------------------------------------------------------------
-- Quais os produtos (ean) que foram repostos sempre pelo --
--                  mesmo retalhista?                     --
------------------------------------------------------------

SELECT ean
FROM evento_reposicao
GROUP BY ean
HAVING COUNT(DISTINCT tin) = 1;

-- ## Expected: 3274673078338 -> Red Bull
--              4040298751684 -> Lays Presunto
--              7499448750431 -> Perna de frango
--              8601139975576 -> Hamburguer


