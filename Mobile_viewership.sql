USE Practice;

SELECT *FROM viewership_data;

--First Question
/** Write a query that calculates the total viewership for laptops and mobile devices where 
mobile is defined as the sum of tablet and phone viewership. Output the total viewership for 
laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.**/

SELECT SUM(CASE WHEN device_type  IN('phone', 'tablet')	THEN 1 ELSE 0 END)
		AS mobile_reviews,
		SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END)
		AS laptop_reviews
FROM viewership_data;


