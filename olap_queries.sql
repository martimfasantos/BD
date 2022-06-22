----------------------------------------------Query 1----------------------------------------------

SELECT dia_semana, concelho, SUM(unidades) AS total_vendidos
FROM vendas
WHERE 
	(ano > EXTRACT(YEAR FROM TIMESTAMP 'input1'
	AND   mes > EXTRACT(MONTH FROM TIMESTAMP 'input1'
	AND   dia_mes > EXTRACT(DAY FROM TIMESTAMP 'input1') 

	AND

	(ano < EXTRACT(YEAR FROM TIMESTAMP 'input2'
	AND   mes < EXTRACT(MONTH FROM TIMESTAMP 'input2'
	AND   dia_mes < EXTRACT(DAY FROM TIMESTAMP 'input2')

GROUP BY
	GROUPING SETS ( (dia_semana), (concelho), () )

----------------------------------------------Query 2----------------------------------------------

SELECT concelho, cat, dia_semana, SUM(unidades) AS total_vendidos
FROM
WHERE (distrito = 'Lisboa')
GROUP BY
	GROUPING SETS ( (concelho), (cat), (dia_semana), () )