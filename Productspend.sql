USE Practice
go 

SELECT * FROM [dbo].[product_spend3];

SELECT SUM(spend) As Total_spend  ,  category FROM product_spend3
GROUP BY category;

UPDATE product_spend3 SET spend = '299.98' where user_id = '7';
ALTER TABLE product_spend3 ALTER column  spend decimal(10,2);



