- Dataset Reference
	- Dataset Link: https://www.kaggle.com/datasets/tevecsystems/retail-sales-forecasting
- Dataset Overview
	- Rows and columns
		- The dataset contains 4 columns and 937 rows.
		- The data is from 01/01/2014 to 07/31/2016
- Data Integrity & Consistency Checks
	- Column values and data types
		- date - varchar
		- sales - int
			- The number of sold products on their respective dates.
		- stock - int
			- The stock of products remaining
		- price - float
			- The total price of the sold products in the sales column.
	- Null values
		- No null values or blank strings were found for all columns.
	- Invalid values
		- Query
			- WITH cte AS (
			  	SELECT 
			  		LAG(date) OVER(ORDER BY date) AS "previous_day",
			  		LAG(sales) OVER(ORDER BY date) AS "previous_sales",
			  		LAG(stock) OVER(ORDER BY date) AS "previous_stock",
			  		*
			  	FROM food_sales
			  )
			  SELECT * 
			  FROM cte
			  WHERE sales = 0 
			  	AND stock + sales = previous_stock
			  	AND price <> 0
			  	AND previous_day IS NOT NULL
		- 102 rows contained 0 for their sales column but had values in their price column.
			- 101 rows contained 0 = sales and price != 0.
			- 88 of these rows had a valid value where:
			  1. sales = 0
			  2. sales + stock = previous day's stock
			- 13 remaning rows had:
			  1. sales = 0
			  2. sales + stock <> previous day's stock
		- These values could be perishable goods that may have expired, decreasing stock without being sold.
		- There are days where the stock is 0, these rows would be exluded from the analysis because they don't contribute to showing the true demand.
	- Duplicates
		- There were no duplicates found that had the same values for all columns.