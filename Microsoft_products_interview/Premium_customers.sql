USE PRACTICE1;


SELECT * FROM customer_contracts;
SELECT * FROM products_table;
-- Step 1 
/** Renaming data table **/
EXEC sp_rename 'products_table', 'products';
Select *from products;

--Step 2: Assigning Primary Keys 

--Confirm wether we have no duplicate values for product_id column values 
SELECT product_id , COUNT(product_id) AS Occurences 
FROM products 
GROUP BY product_id 
HAVING COUNT(product_id) > 1;

--No Duplicate Values 

---i) Assign Primary key to product_id(products table)
ALTER TABLE products  ADD PRIMARY KEY(product_id);

--Confirm No duplicates for customer_contracts (product_id)
SELECT customer_id , COUNT(customer_id) AS Occurences 
FROM customer_contracts
GROUP BY customer_id 
HAVING COUNT(customer_id) > 1;

--There are Duplicates in the Customer_contracts table
--ii) Assign foreign key on product_id 
ALTER TABLE customer_contracts
ADD CONSTRAINT fk_product
FOREIGN KEY(product_id)
REFERENCES products(product_id);


/**BUSINESS QUESTION**/
---A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product 
--from every product category listed in the products table.
--Write a query that identifies the customer IDs of these Supercloud customers.?

--Start of CTE
WITH customer_contracts_cte AS (
	SELECT customer_id,
	product_id
	FROM customer_contracts
	GROUP BY customer_id, product_id
)
--End of CTE 
-- SELECT * FROM customer_contracts_cte;
SELECT 
	  c.customer_id
   FROM customer_contracts_cte c
   LEFT JOIN products p
   ON c.product_id = p.product_id
   WHERE p.product_category IN ('Analytics', 'Compute', 'Containers')
   GROUP BY c.customer_id
   HAVING COUNT(DISTINCT(p.product_category)) = 3;


--Method II(No cte)
SELECT c.customer_id
FROM customer_contracts c
LEFT JOIN products p
ON c.product_id = p.product_id
WHERE p.product_category IN ('Analytics', 'Compute', 'Containers')
GROUP BY c.customer_id
HAVING COUNT(DISTINCT(p.product_category)) = 3;

SELECT DISTINCT * FROM customer_contracts;




