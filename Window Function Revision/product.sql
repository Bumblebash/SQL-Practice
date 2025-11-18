USE PRACTICE;

SELECT * FROM product_spend;


-- Change Data Types 
ALTER TABLE product_spend ALTER COLUMN user_id INT NOT NULL;

ALTER TABLE product_spend ALTER COLUMN spend DECIMAL(18,2);

ALTER TABLE product_spend ALTER COLUMN transaction_date DATETIME2(0);


--Assume you're given a table containing data on Amazon customers and their spending on products in different category, 
--write a query to identify the top two highest-grossing products within 
--each category in the year 2022. The output should include the category, product, and total spend.

WITH ranked_products_cte AS(
	SELECT  category, product, spend As Total_spend,
	 DENSE_RANK() OVER (
	 PARTITION BY category
	 ORDER BY spend DESC ) As rank_in_category, transaction_date
	 FROM product_spend
	 WHERE YEAR(transaction_date) = 2022
	 )
Select * FROM ranked_products_cte

	 SELECT  product, category, Total_spend, transaction_date
	 FROM ranked_products_cte 
	WHERE rank_in_category < = 2
	ORDER BY  category ASC, Total_spend DESC;



	Select Distinct(category) From product_spend;