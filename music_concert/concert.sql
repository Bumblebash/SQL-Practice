USE PRACTICE;

/*DROP TABLE */
 DROP TABLE concerts;

/* Changing Datatypes */
ALTER TABLE concerts alter column concert_id INT NOT NULL;
ALTER TABLE concerts alter column concert_revenue decimal(18,2);

/* Assigning Primary Key */
alter table concerts ADD PRIMARY KEY(concert_id);

SELECT *FROM concerts;

/** Identify genres dominated by a few very large concerts (Concerts that consstitute a large slice
of  total genre revenew? **/

/* USE OF CTE */
-- start of a CTE 
WITH genre_revenue_cte AS (
		SELECT  
		genre,
		 AVG(concert_revenue) AS avg_revenue FROM concerts
		GROUP BY   genre
		) 
--- End Of CTE
--Checking out CTE results 
--SELECT * from genre_revenue_cte; 
SELECT 
		 g.genre,
		 g.avg_revenue,
		 COUNT(c.concert_id) As total_concerts
	FROM genre_revenue_cte  g
	 JOIN concerts c
	ON g.genre = c.genre
	WHERE  c.concert_revenue > g.avg_revenue
	GROUP BY g.genre, g.avg_revenue;


/* USE OF CTE */
-- start of a CTE 
WITH genre_revenue_cte AS (
		SELECT  
		genre,
		 SUM(concert_revenue) AS total_revenue FROM concerts
		GROUP BY   genre
		) 
--- End Of CTE
--Checking out CTE results 
--SELECT * from genre_revenue_cte; 
SELECT 
		 g.genre,
		 g.total_revenue,
		 AVG(c.concert_revenue) As avg_concert_revenue
	FROM genre_revenue_cte  g
	 JOIN concerts c
	ON g.genre = c.genre
	WHERE  c.concert_revenue > g.total_revenue * 0.5
	GROUP BY g.genre, g.total_revenue;



			SELECT  
		genre,
		 AVG(concert_revenue) AS avg_revenue,
		 SUM(concert_id) As total_concerts
		 FROM concerts
		 WHERE  concert_revenue > avg_revenue 
		GROUP BY   genre;

SELECT
  genre,
  AVG(concert_revenue) AS avg_revenue,
  COUNT(concert_id) AS total_concerts
FROM concerts
WHERE concert_revenue > (SELECT AVG(concert_revenue) FROM concerts)
GROUP BY genre;

-- Single Value Comparison in WHERE Clauses 

SELECT DISTINCT (artist_name)
FROM concerts
	WHERE concert_revenue >(
	SELECT AVG(concert_revenue) FROM concerts 
	);



