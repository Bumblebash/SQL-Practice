SELECT * FROM pharmacy_sales;

----changing datatypes 
ALTER TABLE pharmacy_sales  ALTER COLUMN  total_sales decimal(18,2);
ALTER TABLE pharmacy_sales  ALTER COLUMN   cogs decimal(18,2);



---Write a query to find the top 3 most profitable drugs sold, 
---and how much profit they made. Assume that there are no ties in the profits.
---Display the result from the highest to the lowest total profit.

SELECT Top  3   drug, (total_sales - cogs) As Net_profit FROM pharmacy_sales 

	ORDER BY (total_sales - cogs)  DESC
	;

	SELECT drug, (total_sales-cogs) As Profits_made FROM pharmacy_sales
    
    ORDER BY Profits_made DESC 
;

---Write a query to identify the manufacturers associated with the drugs
---that resulted in losses for CVS Health and calculate the total amount of losses incurred.

---Output the manufacturer's name, the number of drugs associated with losses, and the total losses in absolute value. 
---Display the results sorted in descending order with the highest losses displayed at the top.
SELECT manufacturer, COUNT(drug) As Total_drugs, SUM(cogs - total_sales) As Total_loss
		FROM pharmacy_sales
		WHERE cogs > total_sales 
		GROUP BY manufacturer
		ORDER BY Total_loss DESC;
