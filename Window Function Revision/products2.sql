USE PRACTICE;

SELECT * from product_spend;


--Top 2 products bought by price per category 

WITH product_cte AS(
SELECT category, product, SUM(spend) As Total_spend,
RANK() OVER ( PARTITION BY category ORDER by SUM(spend) DESC) AS ranked_products
FROM product_spend
 --WHERE YEAR(transaction_date) = 2022
 GROUP BY category, product
)
SELECT * FROM product_cte;
SELECT  category,product, spend, transaction_date
			FROM product_cte 
			WHERE ranked_products < = 2
			ORDER BY category ASC , spend DESC ;


			SELECT DISTINCT(product), SUM(spend) AS Total_spend, category 
				FROM product_spend
				WHERE category = 'furniture'
				GROUP BY category, product
				ORDER BY SUM(spend) DESC;



	SELECT  Distinct(product), spend, user_id
	FROM  product_spend 
	WHERE category = 'appliance';


-- Most bought Item per category
WITH most_bought_cte AS(
SELECT category, COUNT(product) As Total_items,product,
DENSE_RANK() OVER (PARTITION BY category order by COUNT(product) DESC) AS ranked_products 
FROM  product_spend
GROUP BY category, product
)
 --SELECT * FROM most_bought_cte;
SELECT category, product, Total_items  FROM most_bought_cte
 WHERE ranked_products <= 1;

 SELECT DISTINCT(category) FROM product_spend;





 SUM(spend) OVER (
     PARTITION BY product
     ORDER BY transaction_date) AS running_total