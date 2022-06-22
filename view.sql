----------------------------------------------View----------------------------------------------

CREATE VIEW vendas(ean, cat, ano, trimestre, mes, dia_mes, dia_semana, distrito, concelho, unidades) AS
SELECT p.ean, c.nome as cat,
        EXTRACT(YEAR FROM er.instante) AS ano,
        EXTRACT(QUARTER FROM er.instante) AS trimestre,
        EXTRACT(MONTH FROM er.instante) AS mes,
        EXTRACT(DAY FROM er.instante) AS dia_mes,
        EXTRACT(DOW FROM er.instante) AS dia_semana,
        pr.distrito, pr.concelho, er.unidades
FROM produto AS p, 
     categoria AS c,
     ponto_de_retalho AS pr, 
     evento_reposicao AS er;