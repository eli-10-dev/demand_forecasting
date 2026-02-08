- Data type changes
  collapsed:: true
	- Date (varchar -> date)
	  collapsed:: true
		- ALTER TABLE food_sales
		  ALTER COLUMN date TYPE DATE
		  USING TO_DATE(date, 'YYYY-MM-DD');
- Standardizing values
  collapsed:: true
	- No standardization was done, all values were numerical and did not need to be manipulated.
- Null values
  collapsed:: true
	- No null values were found. Therefore, all rows are retained.
- Invalid values
  collapsed:: true
	- I have decided that the rows with mismatching sales + stock != previous stock is not invalid. No product names were provided, and it is possible that the decrease in products may be due to expiration.
	- I duplicated the main dataset and excluded the 16 rows that have a value of 0 for their stock columns. The dataset's rows are reduced from 937 to 921.
	  collapsed:: true
- Duplicates
  collapsed:: true
	- No duplicate values are found. Therefore, all rows are retained.
- Summary
  collapsed:: true
	- Only changes done is data type change for the column "date", all 937 rows are retained.