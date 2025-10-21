USE PRACTICE;
----- Find genres with above-average concert performance
--Start of CTE 
WITH genre_revenue_cte AS (
		SELECT  
		genre,
		 AVG(concert_revenue) AS avg_revenue FROM concerts
		GROUP BY   genre
		) 
--- End Of CTE

SELECT 
		 g.genre,
		 g.avg_revenue,
		 SUM(c.concert_revenue) AS total_revenue,
		 COUNT(c.concert_id) As total_concerts
	FROM genre_revenue_cte  g
	 JOIN concerts c
	ON g.genre = c.genre
	WHERE  c.concert_revenue > g.avg_revenue 
	GROUP BY g.genre, g.avg_revenue;


--- Column Creation  and Aggregation
SELECT 
	DISTINCT(artist_name),
	genre,
	concert_revenue,
	(SELECT AVG(concert_revenue) FROM concerts)  AS avg_concerts_revenue,
	(SELECT MAX(concert_revenue) FROM concerts) AS max_concert_revenue
    FROM concerts
	GROUP BY genre, concert_revenue, artist_name
	;


--IN , NOT IN and EXISTS 
	
SELECT artist_name, concert_revenue
FROM  concerts 
WHERE  artist_id IN (
 SELECT artist_id FROM concerts WHERE 
			concert_revenue > 500000
);


---Correlated Sub-Query(Postable)
SELECT 
concert_id,
	artist_name,
	genre,
	concert_revenue
FROM concerts AS c1 
WHERE concert_revenue =(
	SELECT MAX (concert_revenue)
	FROM concerts AS c2
WHERE c1.genre = c2.genre
);