----------------------------------------------Query 1----------------------------------------------

SELECT dia_semana, concelho, SUM(unidades) AS total_vendidos
FROM vendas
GROUP BY
	GROUPING SETS ( (dia_semana), (concelho), () )
HAVING 
    "11/10/2005" < CONCAT( CAST(dia_mes AS VARCHAR), "/", CAST(mes AS VARCHAR), "/", CAST(ano AS VARCHAR) ) AS data_reposicao
    AND
    data_reposicao < "21/07/2021"

----------------------------------------------Query 2----------------------------------------------

SELECT concelho, cat, dia_semana, SUM(unidades) AS total_vendidos
FROM vendas
WHERE 
    (distrito = 'Lisboa')
GROUP BY
	GROUPING SETS ( (concelho), (cat), (dia_semana), () )