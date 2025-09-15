use Practice

SELECT *FROM [dbo].[trades];

--Change some data types 
ALTER TABLE trades ALTER   COLUMN price DECIMAL(10,2);

SELECT date FROM trades;

---
--changing data types for date 
ALTER TABLE trades ALTER COLUMN date  DATETIME2(0) NOT NULL;

---Checking out the trades table 
SELECT * FROM users;

--changing some data types
ALTER TABLE users ALTER COLUMN  signup_date DATETIME2(0) NOT NULL;


---Write a query to retrieve the top three cities
---that have the highest number of completed trade orders listed in descending order. 
---Output the city name and the corresponding number of completed trade orders.

/** Creating a stored procedure**/
create proc uspReturnbesttradingcities
 as

SELECT Top 3  city, COUNT(*) As highest_trades  FROM users 
		JOIN trades 
		ON users.user_id = trades.user_id 
		WHERE STATUS = 'Completed'
		GROUP BY city
		ORDER BY COUNT(*) DESC 
		;


SELECT COUNT(DISTINCT user_id) As users FROM trades;






-- Executing a Stored Procedure to retrieve results
exec  uspReturnbesttradingcities


