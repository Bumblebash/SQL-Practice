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




 SELECT 
 product,
 spend,
 transaction_date,
 SUM(spend) OVER (
     PARTITION BY product
     ORDER BY transaction_date) AS running_total
	FROM product_spend; 


	 SELECT 
 product,
 spend,
 transaction_date,
 SUM(spend) OVER (
     PARTITION BY product
     ORDER BY transaction_date) AS running_total
	FROM product_spend; 


	SELECT
  transaction_date,
  product,
  spend,
  SUM(spend) OVER (
    PARTITION BY product) AS running_total
FROM product_spend;


--Counting the number of rows using partition with no specified Column
SELECT product, category ,
COUNT(*) OVER(
) As row_number
FROM product_spend;

--Counting the number of rows using parttion specifying one Column
SELECT DISTINCT(category),
COUNT(*) OVER (PARTITION by category) as Category_count
From product_spend;

--Counting the number of products present per product and category at the same time 

SELECT  DISTINCT(product), category,
COUNT(*) OVER (PARTiTION BY product, category) As Total_number_sold
FROM product_spend
ORDER BY category ASC
;
 


 ---Cummulative Expenditure of each user by user_id over time
 SELECT user_id,product, category, transaction_date,spend As Money_spent,
 SUM(spend) OVER(PARTiTION BY user_id order By transaction_date) As cummulative_expenditure
 From product_spend;

 ---Premium Customers
 WITH customer_spend_cte As (
 SELECT user_id, product, category, transaction_date, spend AS Money_spent,
 SUM(spend) OVER(PARTITION BY user_id order BY transaction_date) AS cummulative_expenditure
 -- DENSE_RANK() OVER (PARTiTION BY user_id order by Money_spent DESC) As ranked_customers
 From product_spend
 )
 --SELECT * From customer_spend_cte;
 SELECT  DISTINCT(user_id), SUM(Money_spent) As Total_expenditure,
 DENSE_RANK() OVER (PARTiTION BY user_id order by SUM(Money_spent) DESC) As ranked_customers
 FROM customer_spend_cte
 GROUP BY user_id
 ORDER BY Total_expenditure DESC;


 WITH Ranked_customers_cte AS(
 SELECT DISTINCT(user_id) , SUM(spend) As Total_expenditure,
 DENSE_RANK() over ( ORDER BY SUM(spend) DESC) As ranked_customers 
 FROM product_spend
 GROUP BY user_id 
 )
 --SELECT * FROM Ranked_customers_cte;
 SELECT user_id, Total_expenditure
 FROM Ranked_customers_cte
 WHERE ranked_customers <=10
 ORDER BY Total_expenditure DESC;


 --Total Number of Unique Clients or Customers Present 

 SELECT COUNT(DISTINCT(user_id)) FROM product_spend;




 SELECT 
  user_id,
  category, 
  product,
  transaction_date,
  spend,
  ROUND(AVG(spend) OVER (
    PARTITION BY user_id ORDER BY transaction_date),2) AS rolling_avg_spend
FROM product_spend;



---Average Expenditure per User
SELECT user_id,
category,product, spend,
SUM(spend) OVER(
PARTITION BY user_id  ORDER BY transaction_date) AS  cummulative_expenditure ,
transaction_date
FROM product_spend;
