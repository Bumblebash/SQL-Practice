USE PRACTICE;
SELECT * FROM  artists;
select * From global_song_rank;
SELECT * FROM songs;

--RANKING OF Artists by Top 10 appaearance in the Music Chart
WITH appearance_cte AS(
            SELECT song_id, COUNT(rank) AS appearance  FROM global_song_rank
             WHERE rank <=10
             GROUP BY song_id
 ),
--SELECT * from appearance_cte;
 artist_id_cte AS(
             SELECT s.artist_id, a.song_id, a.appearance
             FROM appearance_cte a 
             LEFT JOIN songs s 
             ON a.song_id = s.song_id
 ),
 --SELECT * from artist_id_cte;
 total_appearance_cte AS(
                    SELECT a.artist_id, SUM(a.appearance) As total_appearance,
                    DENSE_RANK() OVER (ORDER BY SUM(a.appearance) DESC) AS artist_ranked 
                    FROM artist_id_cte a
                    GROUP BY a.artist_id
                   ),
       --  SELECT * FROM total_appearance_cte;

 final1_rank_cte AS(
                 SELECT
                    TOP 5 t.artist_id, t.total_appearance, t.artist_ranked, a.artist_name 
                    FROM  total_appearance_cte t
                    LEFT JOIN artists a
                    ON t.artist_id = a.artist_id       
 ),
        --SELECT * FROM final1_rank_cte;

final2_rank_cte AS(

            SELECT 
            f.artist_ranked, ar.artist_name
            FROM final1_rank_cte f
            LEFT JOIN artists ar 
                ON f.artist_id = ar.artist_id
            ORDER BY ar.artist_name ASC           
)
SELECT * FROM final2_rank_cte;


 final3_ranked_cte AS(
          SELECT g.artist_name, g.artist_ranked 
          FROM final2_rank_cte g
 )
    SELECT  * FROM final3_ranked_cte;