--FAANG Stock Question ,write a SQL query to find the lowest price each stock ever
--opened at? Be sure to also order your results by price, in descending order. 
USE Practice 
GO

SELECT * FROM [dbo].[FAANG_Stocks];
DELETE   FROM FAANG_Stocks
WHERE date IS NULL;

SELECT ticker, MIN(open_px) As lowest_price FROM FAANG_Stocks 
	GROUP BY ticker 
	ORDER BY lowest_price DESC;

--renaming a column from a reserved word
EXEC sp_rename 'FAANG_Stocks.open', 'open_px', 'COLUMN';

--Adding a new Column
ALTER TABLE FAANG_Stocks ADD close_px decimal(10,2);
 

UPDATE   FAANG_Stocks
SET close_px = CASE ticker
    WHEN 'GOOG' THEN 71.71
    WHEN 'META' THEN 201.91
    WHEN 'MSFT' THEN 170.23
    WHEN 'AMZN' THEN 100.44
    WHEN 'NFLX' THEN 345.09
END
WHERE ticker IN ('GOOG', 'META', 'MSFT', 'AMZN', 'NFLX');


SELECT ticker, AVG(open_px) AS Average_open_px
    FROM FAANG_Stocks
    GROUP BY ticker
    HAVING  AVG(open_px) > 200;
   
--Changing the data type of open_px
ALTER TABLE FAANG_Stocks ALTER COLUMN open_px decimal(10,2) ;