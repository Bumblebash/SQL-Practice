USE Practice1;


SELECT * FROM user_transactions;

-- Change data type of columns
ALTER TABLE user_transactions ALTER COLUMN transaction_id INT NOT NULL;
ALTER TABLE user_transactions ALTER COLUMN product_id INT;
ALTER TABLE user_transactions ALTER COLUMN spend decimal(18,2);
ALTER TABLE user_transactions ALTER COLUMN transaction_date DATETIME2(0);

--ASSIGN PRIMARY KEY
ALTER TABLE user_transactions ADD PRIMARY KEY(transaction_id);

--Checkoout the new data types 
EXEC sp_help user_transactions;


--Assume you're given a table containing information about Wayfair user transactions for different products.
--Write a query to calculate the year-on-year growth rate for the total spend of each product, grouping the results by product ID.
--The output should include the year in ascending order, product ID, current year's spend, previous year's spend and year-on-year growth percentage, rounded to 2 decimal places.
WITH previous_spend_cte AS(
SELECT
    YEAR(transaction_date) As Date, 
	transaction_id,	
	product_id, 
	spend As Current_spend, 
	 LAG(spend) OVER (PARTITION BY product_id ORDER BY YEAR(transaction_date), product_Id ASC) As previous_spend
	FROM user_transactions
	)
SELECT Date, product_id, Current_spend, previous_spend,
  COALESCE (CAST((ROUND(((Current_spend- previous_spend) / previous_spend) * 100,2)) AS Decimal(10,2)),0)  As Y_0_Y_Growth_percentage
  FROM previous_spend_cte;