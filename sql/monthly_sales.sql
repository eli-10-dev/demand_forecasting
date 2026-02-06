SELECT
	EXTRACT('month' FROM date) AS MONTH,
	ROUND(AVG(sales), 2) AS monthly_avg_sales
FROM food_sales
GROUP BY month
ORDER BY month;
