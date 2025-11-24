USE PRACTICE;

-- Calculate the average expenditure by product
select * from product_spend;

SELECT user_id, category, product,spend,
ROUND(AVG(spend)OVER(PARTITION BY user_id  ORDER BY transaction_date) ,2)As Average_expenditure, transaction_date
FROM product_spend;

----Lowest expenditure on a product per cateory
SELECT  distinct(product),category, spend,
MIN(spend)OVER( PARTITION  BY product) As Least_spend
From product_spend;

--Highewst value within a window
SELECT  distinct(product),category, spend,
MAX(spend)OVER( PARTITION  BY product) As max_spend_per_product
From product_spend;

--Returning only one Most Expensive item per category
WITH premium_product_cte AS(
SELECT product, category, spend, MAX(spend) As max_spend,
DENSE_RANK() OVER ( PARTITION BY category ORDER BY MAX(spend) DESC) AS ranked_products
From product_spend
GROUP BY category, product, spend
)
--SeLECT * from premium_product_cte;
SELECT  product, category, spend 
FROM premium_product_cte
WHERE ranked_products < =1;

---Returning the most Expensive product by product
WITH premium_products_cte As(
SELECT product, category, spend, MAX(spend) As Max_price,
RANK() OVER(PARTITION by product ORDER BY MAX(spend) DESC) As ranked_products
FROM product_spend
GROUP BY product, category, spend
)
--SELECT * from premium_products_cte;

SELECT product, category, spend
FROM premium_products_cte
WHERE  ranked_products <=1;


--Finding out first and last product purchased in each category by transaction_date 
SELECT category, product, user_id,spend, transaction_date,
FIRST_VALUE(product) OVER(ORDER BY transaction_date
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) As First_purchase,
LAST_VALUE(product) OVER(ORDER BY transaction_date
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) As Last_purchase
FROM product_spend;


--Finding out first and Last product  purchase made by each user ordered by tranaction_date 
SELECT DISTINCT(user_id),category, spend, transaction_date,
FIRST_VALUE(product) OVER(
	PARTITION BY user_id ORDER BY transaction_date 
	ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	) As First_purchase,
LAST_VALUE(product) OVER (
	PARTITION BY user_id ORDER BY transaction_date
	ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	) As Last_purchase 
FROM product_spend;


