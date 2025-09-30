Use Practice;

SELECT * FROM goodreads;
SELECT * from deliveries;
SELECT * FROM orders;

/** Changing Data Types (goodreads) **/ 
alter table goodreads alter column book_id bigint;
alter table goodreads alter column year_released INT;
alter table goodreads alter column book_rating  decimal(18,2);
alter table goodreads alter column awards_won  smallint;
alter table goodreads alter column number_of_reviews  INT;
alter table goodreads alter column price  decimal(18,2);


/**Changing Data types (deliveries) **/
alter table deliveries alter column delivery_id INT;
alter table deliveries alter column order_id INT;
alter table deliveries alter column delivery_date datetime2(0);
alter table deliveries alter column delivery_status nvarchar(50);


/**Changing Data types (orders) **/
alter table orders alter column order_date datetime2;



   /*SQL INNER JOIN */
     /*  how many books priced at $20 and above have been ordered, and who the buyers are.*/
     SELECT   customer_id,   COUNT(quantity) AS Book_total FROM  ORDERS
                    INNER JOIN goodreads ON ORDERS.book_id = goodreads.book_id
                    WHERE price>= 20
                    GROUP BY Customer_id
                    ;

             SELECT 
  orders.order_id, 
  orders.customer_id, 
  goodreads.book_title, 
  orders.quantity
FROM goodreads
INNER JOIN orders
  ON goodreads.book_id = orders.book_id -- Columns with same data type (integer)
WHERE goodreads.price >= 20;


/** LEFT JOIN EXAMPLE **/ 
/** List All books and how many times they ordered, Include books with Zero orders **/

SELECT g.book_id , g.book_title ,
         COALESCE( SUM(o.quantity),0) AS total_ordered
FROM goodreads g
            LEFT JOIN orders o
            ON g.book_id = o.book_id
GROUP BY g.book_id, g.book_title
ORDER BY total_ordered DESC;



/**Suppose we want to retrieve all the orders along with their corresponding deliveries information.**/
SELECT o.order_id, o.book_id, d.delivery_id, d.delivery_status FROM orders o
       LEFT JOIN deliveries d
       ON o.order_id = d.order_id;
 