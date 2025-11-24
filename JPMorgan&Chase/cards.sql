USE PRACTICE;

SELECT *from credit_cards;

--Distinct Cards in the dataset
SELECT DISTINCT(card_name) FROM credit_cards;


--Write a query that outputs the name of the credit card and  how many cards were issued in its launch month. The launch month is the ealiest record in the 
--monthly cards issued table for a given card. Order the results starting from highest issed ammount

WITH launch_month AS(
		SELECT card_name,
		MIN(issue_year * 1000 + issue_month) As first_date
	FROM  credit_cards
	GROUP BY card_name
),
--SELECT * FROM launch_month;
launch_data AS(
SELECT 
		c.card_name,c.issued_amount
FROM credit_cards c
JOIN launch_month l 
		ON c.card_name = l.card_name
	AND (c.issue_year * 1000 + c.issue_month) = l.first_date)
	
	--SELECT *from launch_data;

	SELECT card_name, issued_amount
	FROM launch_data
	ORDER BY issued_amount DESC;
