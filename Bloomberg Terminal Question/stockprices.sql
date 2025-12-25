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
)
--SELECT  * FROM previous_cte;

SELECT date, ticker , closing_price, Previous_close_price, closing_price - Previous_close_price As difference_
FROM previous_cte;


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