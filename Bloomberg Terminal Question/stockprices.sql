USE PRACTICE1;
SELECT * FROM stockprice;

--Change datatypes
ALTER TABLE stockprice ALTER COLUMN date DATETIME2(0); 
ALTER TABLE stockprice ALTER COLUMN open_price decimal(8,2);
ALTER TABLE stockprice ALTER COLUMN high decimal(8,2);
ALTER TABLE stockprice ALTER COLUMN low decimal(8,2);
ALTER TABLE stockprice ALTER COLUMN closing_price decimal (8,2);


--Renaming Column
EXEC sp_rename 'stockprice.[open]', 'open_price', 'COLUMN';
EXEC sp_rename 'stockprice.[close]', 'closing_price', 'COLUMN';

--show data types of the table 
EXEC sp_help stockprice;

--1. Calculate the difference in closing prices between consecutive months.
WITH previous_cte AS(
SELECT date, ticker, closing_price, 
			COALESCE (LAG(closing_price, 1)
			OVER (
			PARTITION BY ticker ORDER BY date	
			), 0) As Previous_close_price
FROM stockprice
WHERE YEAR(date) = 2023
),
--SELECT  * FROM previous_cte;
difference2 AS (
SELECT date, ticker , closing_price, Previous_close_price, closing_price - Previous_close_price As difference_
FROM previous_cte
)
Select date, ticker, closing_price, Previous_close_price, difference_,  
--(difference_ / Previous_close_price) * 100 AS Y_O_Y_growth from difference2;
		CASE WHEN Previous_close_price = 0 THEN 0
		ELSE (difference_ / Previous_close_price) * 100
		END AS Y_O_Y_growth
FROM difference2;


--2. Calculate the difference between the closing price of the current month and the closing price from 3 months prior.
With previous_month_px AS(
SELECT  date, ticker, closing_price,
        COALESCE(LAG(closing_price, 3)
        OVER (
		PARTITION BY ticker ORDER BY date
		),0) As previous_closing_month_price	 
		FROM  stockprice
		)

SELECT date , closing_price ,previous_closing_month_price, closing_price - previous_closing_month_price AS Diiference_in_px
 FROM previous_month_px


 SELECT
  date,
  closing_price,
  LEAD(closing_price) OVER (ORDER BY date) AS next_month_close,
  LEAD(closing_price) OVER (ORDER BY date) - closing_price as difference
FROM stockprice
WHERE YEAR(date) = 2023
  AND ticker = 'GOOG';