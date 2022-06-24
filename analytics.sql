----------------------------------------------Query 1----------------------------------------------

SELECT dia_semana, concelho, SUM(unidades) AS total_vendidos
FROM vendas
WHERE CONCAT( CAST(ano AS VARCHAR), '-', CAST(mes AS VARCHAR), '-', CAST(dia_mes AS VARCHAR) )
    BETWEEN '2006-12-25' AND '2021-07-21'
GROUP BY
	GROUPING SETS ( (dia_semana), (concelho), () );

----------------------------------------------Query 2----------------------------------------------

SELECT concelho, cat, dia_semana, SUM(unidades) AS total_vendidos
FROM vendas
WHERE
    distrito = 'Lisboa'
GROUP BY
	GROUPING SETS ( (concelho), (cat), (dia_semana), () );
