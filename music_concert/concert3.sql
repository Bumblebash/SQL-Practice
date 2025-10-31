USE PRACTICE;

select  *from concerts;

--Write a query to rank the artists within each genre based on their revenue per member and extract the top revenue-generating artist from each genre. Display the
--output of the artist name, genre, concert revenue, number of members, and revenue per band member, sorted by the highest revenue per member within each genre.

WITH ranked_concerts_cte AS (
SELECT artist_name,
		genre,
		number_of_members,
		CAST((concert_revenue / number_of_members) AS FLOAT) AS revenue_per_member,
		RANK()OVER (PARTITION BY genre
		ORDER BY (concert_revenue / number_of_members)
					DESC
					) As ranked_artists
FROM concerts)

		SELECT artist_name,
				genre,
				number_of_members,
				revenue_per_member
				FROM ranked_concerts_cte 
				WHERE ranked_artists = 1 
				ORDER BY revenue_per_member DESC;





