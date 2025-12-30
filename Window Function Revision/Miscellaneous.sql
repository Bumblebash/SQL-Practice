USE PRACTICE;


   SELECT  DISTINCT(Category) FROM product_spend;

   SELECT category, product, SUM(spend) AS total_spend  FROM product_spend
   GROUP BY product, category
   ORDER BY total_spend DESC;


   --Confirm Revenue for Television in Year 2024
   SELECT product, spend FROM product_spend
   WHERE product = 'television'AND year(transaction_date) = 2024;


   SELECT product, COUNT(*) AS Frequency, SUM(spend) AS Total_expenditure 
   FROM product_spend
   GROUP BY product;




   WITH yearly_revenue AS (
  SELECT
    YEAR(transaction_date) AS year,
    product,
    SUM(spend) AS revenue
  FROM product_spend
  GROUP BY YEAR(transaction_date), product
)
SELECT
  product,
  year,
  revenue,
  revenue - LAG(revenue) OVER (PARTITION BY product ORDER BY year) AS yoy_growth
FROM yearly_revenue;



SELECT
  transaction_date,
  product,
  spend,
  SUM(spend) OVER (
    PARTITION BY product
    ORDER BY transaction_date
    --ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_revenue
FROM product_spend;