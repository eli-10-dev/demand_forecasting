WITH cte AS (
	SELECT
		DATE_TRUNC('week', date) AS week_start,
		EXTRACT('year' FROM date) AS year,
		ROUND(AVG(sales), 2) AS avg_sales
	FROM food_sales
	GROUP BY week_start, year
	ORDER BY week_start
)
SELECT
	year,
	EXTRACT('week' FROM week_start) AS week,
	avg_sales
FROM cte;
