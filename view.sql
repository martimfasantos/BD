----------------------------------------------View----------------------------------------------

CREATE VIEW vendas(ean, cat, ano, trimestre, mes, dia_mes, dia_semana, distrito, concelho, unidades) AS
SELECT p.ean, c.nome as cat,
        dt.ano, dt.trimestre, dt.mes, dt.dia_mes, dt.dia_semana,
        pr.distrito, pr.concelho, er.unidades
FROM produto AS p, categoria AS c,
        (SELECT
        EXTRACT(YEAR FROM evento_reposicao.instante) AS ano,
        EXTRACT(QUARTER FROM evento_reposicao.instante) AS trimestre,
        EXTRACT(MONTH FROM evento_reposicao.instante) AS mes,
        EXTRACT(DAY FROM evento_reposicao.instante) AS dia_mes,
        EXTRACT(DOW FROM evento_reposicao.instante) AS dia_semana
        FROM evento_reposicao) AS dt,
        ponto_de_retalho AS pr, evento_reposicao AS er;