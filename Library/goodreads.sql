Use Practice;

SELECT * FROM goodreads;
SELECT * from deliveries;
SELECT * FROM orders;

/** Changing Data Types (goodreads) **/ 
alter table goodreads alter column book_id INT;
alter table goodreads alter column year_released DATE;
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
alter table orders alter column order_date datetime2(0);
alter table orders alter column order_id  INT;
alter table orders alter column book_id  INT;
alter table orders alter column customer_id  INT;

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
SELECT o.order_id, o.book_id, d.delivery_id, d.delivery_date, d.delivery_status FROM orders o
       LEFT JOIN deliveries d
       ON o.order_id = d.order_id;

/** Flipping the table positions**/
 SELECT o.order_id, o.book_id, d.delivery_id, d.delivery_date, d.delivery_status FROM deliveries d
                    LEFT JOIN orders o
                    ON d.order_id = o.order_id; 



/**RIGHT JOIN **/
SELECT o.order_id, o.book_id, d.delivery_id, d.delivery_date, d.delivery_status FROM deliveries d
                   RIGHT JOIN orders o
                   ON d.order_id = o.order_id;


/** Display all books priced ≥ 20 even if they have no orders (those orders columns will be NULL).**/
SELECT o.order_id, o.customer_id, g.book_title
FROM orders o
RIGHT JOIN goodreads g
  ON o.book_id = g.book_id
WHERE g.price >= 20;




/** SQL Full OUTER JOIN **/

SELECT o.order_id, o.customer_id, o.order_date, o.quantity, 
       d.delivery_id,  d.delivery_date,  d.delivery_status
FROM orders o  
FULL OUTER JOIN deliveries d
        ON o.order_id = d.order_id
        ORDER BY  d.delivery_id, o.order_id;

/** INNER JOIN **/
/** List orders for books priced >= $ 20 **/
SELECT o.order_id, o.book_id,  g.book_title, g.price FROM orders o
        INNER JOIN goodreads g
        ON o.book_id = g.book_id
        WHERE g.price >= 20
        ORDER BY g.price DESC;
        

SELECT 
  g.book_title, 
  o.quantity
FROM goodreads AS g
INNER JOIN orders AS o 
  ON g.book_id = o.book_id
    where o.quantity > 2;

/** Retrieve book titles, their authors, and the order dates for books 
released after 2015 and ordered in quantities greater than 1.**/
    SELECT 
  g.book_title, g.book_id,
  g.author, 
  o.order_date, o.quantity
FROM goodreads AS g
INNER JOIN orders AS o 
  ON g.book_id = o.book_id
    WHERE DATEPART(year, g.year_released) > 2015
    AND o.quantity > 1;



/** Retrieve order IDs and their corresponding delivery status 
where the delivery status is either 'Delivered' or 'Shipped'.**/

/** Joining 3 tables at Once **/
SELECT o.order_id, d.delivery_status, g.book_title FROM orders o
 JOIN deliveries d ON  o.order_id = d.order_id
 JOIN goodreads g ON g.book_id = o.book_id 
 WHERE d.delivery_status IN ('Delivered', 'Shipped');

 /** Retrieve book titles, their authors, and the order dates for books released after 2015 and ordered 
 in quantities greater than 1.**/
 SELECT g.book_title, g.author, o.order_date, o.quantity FROM goodreads g 
                JOIN orders o ON g.book_id = o.book_id
                WHERE quantity > 1
                AND YEAR(g.year_released) > 2015;


/**Example 4: Joining all three tables with a condition on book_rating and delivery_status**/
/*Retrieve the book titles, their average ratings, order dates, 
and delivery statuses for books with a rating higher than 4.0 that have been delivered.*/
SELECT g.book_title, g.book_rating , o.order_date, d.delivery_status
        FROM goodreads g JOIN orders o
        ON g.book_id = o.book_id
        JOIN deliveries d 
        ON o.order_id = d.order_id
WHERE g.book_rating > 4
AND d.delivery_status = 'Delivered';



/* Example (you want all books priced ≥ $20 and show orders if present):*/
SELECT g.book_title, SUM(COALESCE(o.quantity,0)) AS qty_ordered 
 FROM goodreads g
 LEFT JOIN orders o 
 ON g.book_id = o.book_id 
 WHERE g.price >= 20
 GROUP BY book_title;

 SELECT *FROM orders;
  SELECT *FROM deliveries;

  /** LEFT JOIN BUT specific on the right table(Filtering the right table)*/
 SELECT o.book_id, o.order_id, d.delivery_date , d.delivery_status
 FROM orders o
 LEFT  JOIN deliveries d
  ON o.order_id = d.order_id
   AND d.delivery_status = 'Delivered';

   /*LEFT JOIN becomes INNER JOIN, through filtering with the WHERE clause 
   to return only Delivered rows **/
    SELECT o.book_id, o.order_id, d.delivery_date , d.delivery_status
 FROM orders o
 LEFT  JOIN deliveries d
  ON o.order_id = d.order_id
   WHERE d.delivery_status = 'Delivered';


/**Anti-Join **/
--Book that dont have orders yet(Books not yet sold) 
SELECT g.book_title, g.book_id, o.order_id
        FROM goodreads g
        LEFT JOIN orders o
        ON g.book_id = o.book_id
        WHERE o.order_id IS NULL ;

SELECT *from orders;


/*SEMI JOIN */
-- customers who ordered any book priced >= 20
---/*Premium Customers*/
SELECT DISTINCT o.customer_id, SUM(o.quantity) AS total_books_ordered 
FROM orders o
WHERE EXISTS (
  SELECT 1 FROM goodreads g
  WHERE  g.book_id = o.book_id 
  AND  g.price >= 20
)
GROUP BY o.customer_id
;


/*Option 2  In case book_id is a unique key*/
--Recognise Premium Customers
SELECT o.customer_id, SUM(o.quantity) AS total_books_ordered
    FROM orders o 
  JOIN goodreads g
    ON o.book_id = g.book_id
    WHERE g.price >= 20
    GROUP BY o.customer_id
    ORDER BY total_books_ordered DESC;



--12/01/2024
--Finding Books in the same Genre 
SELECT 
    b1.genre,
    b1.book_title AS current_book,
    b2.book_title AS suggested_book1,
    b3.book_title AS suggested_book2
FROM goodreads AS b1
INNER JOIN goodreads AS b2
        ON b1.genre = b2.genre
INNER JOIN goodreads AS b3
        ON b1.genre = b3.genre
WHERE b1.book_id != b3.book_id AND
b1.book_id != b2.book_id AND 
b2.book_id != b3.book_id
ORDER BY b1.book_title;




