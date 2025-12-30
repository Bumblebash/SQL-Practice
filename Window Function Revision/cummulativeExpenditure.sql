USE PRACTICE;

SELECT * FROM product_spend;


--BUSINESS QUESTION 
/** Question 1 **/ 
--Is Revenue(Spend) increasing or decreasing over time?(per Category per month)
--1. Monthly Revenue Trend(FOUNDATION)


--MONTH OVER MONTH GROWTH 
/**Month Over Month Growth**/ 
SELECT 
    DATEFROMPARTS(YEAR(transaction_date), MONTH(transaction_date), 1) AS date,   -- full date for ordering
    FORMAT(transaction_date, 'MMM') AS month,                                    -- short month name (Jan, Feb...)
    category,
    SUM(spend) AS monthly_revenue
FROM product_spend
GROUP BY 
    DATEFROMPARTS(YEAR(transaction_date), MONTH(transaction_date), 1),
    FORMAT(transaction_date, 'MMM'),
    category
ORDER BY date;

/**Month Over Month Trends Per Category **/
WITH monthly_revenue AS (
 SELECT 
        FORMAT(transaction_date, 'MMMM') AS month, YEAR(transaction_date) AS year, category, SUM(spend) AS revenue 
        FROM product_spend
        GROUP BY YEAR(transaction_date), category,   FORMAT(transaction_date, 'MMMM')
)
SELECT category, year, month, revenue, COALESCE(revenue - LAG(revenue) OVER (PARTITION BY category ORDER BY year), 0) AS M_O_M_Growth
FROM monthly_revenue;



---YEAR OVER YEAR GROWTH (YoY)
--Qurestion 2: Is Revenue(Spend) increasing or decreasing over time?(per Category per month)

/** Year Over Year Growth **/
---Yearly Revenue Trend(FOUNDATION)
SELECT YEAR(transaction_date) AS year,
category,
SUM(spend) AS revenue, COALESCE(LAG(spend) OVER (PARTITION BY category ORDER BY YEAR(transaction_date)), 0) As Previous_revenue
FROM product_spend
GROUP BY YEAR(transaction_date), category, spend
;

--Y_O_Y_Growth(Per Category)
WITH yearly_revenue AS(
 SELECT
    YEAR(transaction_date) AS year,
    category,
    SUM(spend) AS revenue
  FROM product_spend
   GROUP BY YEAR(transaction_date), category
   )
   --SELECT * from yearly_revenue;
   SELECT category , year, revenue, COALESCE (revenue - LAG(revenue) OVER (PARTITION BY category ORDER BY year), 0) AS Y_O_Y_Growth
   FROM yearly_revenue
   ;

   --Y_O_Y_Growth(Per Product)
   WITH yearly_revenue AS(
 SELECT
    YEAR(transaction_date) AS year,
    product,
    SUM(spend) AS revenue
  FROM product_spend
   GROUP BY YEAR(transaction_date), product
   )
   --SELECT * from yearly_revenue;
   SELECT product , year, revenue, COALESCE (revenue - LAG(revenue) OVER (PARTITION BY product ORDER BY year), 0) AS Y_O_Y_Growth
   FROM yearly_revenue
   ;


   --QUESTION 3: (Slow Moving Products)
   --Identify Slow  moving products
   SELECT 
        product,
        COUNT(*) AS total_sales,
        SUM(spend) AS total_revenue
   FROM product_spend
   GROUP BY product
   ORDER BY total_revenue ASC, total_sales ASC;


   --QUESTION 5(Cummulative Revenue)
   --Generate the Cummulative revenue per Product

   SELECT 
           transaction_date,
           product,
           spend,
           SUM(spend) OVER (
                PARTITION BY product 
                ORDER BY transaction_date    
           ) AS cummulative_revenue
    FROM product_spend
;


--Genreate the Cummulative Revenue per Category
SELECT 
        transaction_date,
        category,
        spend,
        SUM(spend) OVER (
            PARTITION BY category
            ORDER BY transaction_date  
        ) AS cummulative_revenue
FROM product_spend;