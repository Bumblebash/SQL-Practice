USE PRACTICE;


SELECT * FROM user_transaction;

--Update Datatypes
ALTER TABLE user_transaction ALTER COLUMN transaction_date datetime2(0);
ALTER TABLE user_transaction  ALTER COLUMN spend decimal(10,2);

/**This is the same question as problem #13 in the SQL Chapter of Ace the Data Science Interview!

Assume you're given a table on Walmart user transactions. Based on their most recent transaction date, 
write a query that retrieve the users along with the number of products they bought.

Output the user's most recent transaction date, user ID, and the number of products, sorted in chronological order by the transaction date.**/

WITH latest_cte AS (
	SELECT user_id, product_id, transaction_date,
	RANK()OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rank1
	FROM user_transaction
)

	SELECT user_id, transaction_date, COUNT(user_id) As total_items
	FROM latest_cte
	WHERE rank1 = 1
	GROUP BY user_id, transaction_date;