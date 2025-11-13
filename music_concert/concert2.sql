USE PRACTICE;
select * From  concerts;
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

Select * from concerts;

---Correlated Sub-Query(Postable)
--Highest Grossing Concert Per Genre 
SELECT 
concert_id,
tickets_sold,
city,
sponsor,
label,
	artist_name,
    ticket_price_avg,
	genre,
	concert_revenue,
    profit
FROM concerts AS c1 
WHERE concert_revenue =(
	SELECT MAX (concert_revenue)
	FROM concerts AS c2
WHERE c1.genre = c2.genre
);


WITH revenue_per_member AS (
  SELECT
    artist_id,
    artist_name,
    genre,
    concert_revenue,
    number_of_members,
    -- prevent division-by-zero if number_of_members = 0 or NULL
    concert_revenue / NULLIF(number_of_members, 0) AS revenue_per_member
  FROM concerts
)
, ranked AS (
  SELECT
    artist_id,
    artist_name,
    genre,
    concert_revenue,
    number_of_members,
    revenue_per_member,
    ROW_NUMBER() OVER (PARTITION BY genre ORDER BY revenue_per_member DESC) AS rn
  FROM revenue_per_member
)
SELECT
  artist_name,
  concert_revenue,
  genre,
  number_of_members,
  revenue_per_member
FROM ranked
WHERE rn = 1
ORDER BY revenue_per_member DESC;


--Start of CTE & Window Function
WITH ranked_concerts_cte AS (
  SELECT
    artist_name,
    concert_revenue,
    genre,
    number_of_members,
   CAST(concert_revenue / number_of_members AS FLOAT )  AS revenue_per_member,
    RANK() OVER (
      PARTITION BY genre
      ORDER BY (concert_revenue / number_of_members) DESC) AS ranked_artists
  FROM concerts
)
---End Of CTE & Window Function
SELECT
  artist_name,
  concert_revenue,
  genre,
  number_of_members,
  revenue_per_member
FROM ranked_concerts_cte
WHERE ranked_artists = 1
ORDER BY revenue_per_member DESC;



SELECT DISTINCT(artist_name)
FROM concerts
WHERE concert_revenue > (
  SELECT AVG(concert_revenue) FROM concerts);




  SELECT artist_name
FROM concerts
WHERE artist_id IN (
  SELECT artist_id FROM concerts WHERE concert_revenue > 500000);









WITH ranked_concerts_cte AS (
  SELECT
    artist_name,
    concert_revenue,
    genre,
    number_of_members,
    (concert_revenue / number_of_members) AS revenue_per_member,
    RANK() OVER (
      PARTITION BY genre
      ORDER BY (concert_revenue / number_of_members) DESC) AS ranked_concerts
  FROM concerts
)

SELECT *
FROM ranked_concerts_cte;





SELECT
  artist_name,
  concert_revenue,
  genre,
  number_of_members,
  (concert_revenue / number_of_members) AS revenue_per_member,
  RANK() OVER (
    PARTITION BY genre
    ORDER BY (concert_revenue / number_of_members) DESC) AS ranked_concerts
FROM concerts;








WITH ranked_concerts_cte AS (
    SELECT 
    artist_name,
    concert_revenue,
    genre,
    number_of_members,
    CAST(concert_revenue/ number_of_members AS FLOAT) AS revenue_per_member,
    RANK()OVER(
           PARTITION BY genre 
           ORDER BY (concert_revenue/ number_of_members) DESC)
           AS ranked_artists
   FROM concerts  
    )


SELECT 
    artist_name,
    genre,
    number_of_members,
    revenue_per_member
FROM ranked_concerts_cte
WHERE ranked_artists = 1
ORDER BY revenue_per_member DESC;

SELECT DISTINCT(artist_name) as Total_artists FROM concerts;


SELECT 
  artist_name, 
  genre, 
  concert_revenue,
  (SELECT AVG(concert_revenue) FROM concerts) AS avg_concert_revenue,
  (SELECT MAX(concert_revenue) FROM concerts) AS max_concert_revenue
FROM concerts;






SELECT artist_name,
genre,
concert_revenue
FROM concerts c1
WHERE concert_revenue = (SELECT MAX(concert_revenue) FROM concerts
c2 WHERE c1.genre =  c2.genre)
;


