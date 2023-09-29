DROP VIEW IF EXISTS vendas;

--------------------------------------------------------------------
--------------|             VIEW vendas             |---------------
--------------------------------------------------------------------

CREATE VIEW vendas(ean, cat, ano, trimestre, mes, dia_mes, dia_semana, distrito, concelho, unidades) AS
SELECT  ean, nome_cat,
        EXTRACT(YEAR FROM instante) AS ano,
        EXTRACT(QUARTER FROM instante) AS trimestre,
        EXTRACT(MONTH FROM instante) AS mes,
        EXTRACT(DAY FROM instante) AS dia_mes,
        EXTRACT(DOW FROM instante) AS dia_semana,
        distrito, concelho, unidades
FROM evento_reposicao 
        NATURAL JOIN tem_categoria
        NATURAL JOIN instalada_em 
        NATURAL JOIN ponto_de_retalho;