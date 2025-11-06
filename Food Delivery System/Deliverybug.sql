USE PRACTICE;


SELECT * FROM deliveries 
	CROSS JOIN concerts;


--Checking out our data 
Select * from complaints;

--Assigning primary Key to order_id
ALTER TABLE complaints  ADD PRIMARY KEY(order_id);



--Zomato is a leading online food delivery service that connects users with various restaurants and cuisines, allowing them to browse menus,
--place orders, and get meals delivered to their doorsteps.
--Recently, Zomato encountered an issue with their delivery system. Due to an error in the delivery driver instructions, each item's order was swapped 
--with the item in the subsequent row. As a data analyst, you're asked to correct this swapping error and return the proper pairing of order ID and item.
--If the last item has an odd order ID, it should remain as the last item in the corrected data. For example, if the last item is Order ID 7 Tandoori Chicken,
--then it should remain as Order ID 7 in the corrected data.
--In the results, return the correct pairs of order IDs and items.

/** Delivery system Bug (Data Mis-alignment ) **/

/** SQL solution **/

WITH ordered_cte  AS(
      SELECT 
			order_id,
			item,
			LEAD(item) OVER(ORDER BY order_id) AS next_item,
			LAG(item) OVER(order BY order_id) AS prev_item
	 FROM complaints 
				)
		SELECT 
			order_id AS corrected_order,
			CASE WHEN (order_id % 2)= 1 
			AND next_item IS NOT NULL 
			THEN next_item
			WHEN (order_id %  2) = 0
			THEN prev_item
		ELSE item 
		END AS item 
	From ordered_cte
	ORDER BY corrected_order;







