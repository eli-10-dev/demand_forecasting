SELECT
	EXTRACT('year' FROM date) AS year,
	EXTRACT('month' FROM date) AS month,
	ROUND(AVG(sales), 2) AS monthly_avg_sales
FROM food_sales
GROUP BY year, month
ORDER BY year, month;
