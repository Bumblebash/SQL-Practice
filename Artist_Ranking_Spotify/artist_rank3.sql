
/** Assume there are three Spotify tables: artists, songs, and global_song_rank, which contain information about the artists, songs, and music charts, respectively.

Write a query to find the top 5 artists whose songs appear most frequently in the Top 10 of the global_song_rank table. 
Display the top 5 artist names in ascending order, along with their song appearance ranking.

If two or more artists have the same number of song appearances, they should be assigned the same ranking, and the rank numbers should be continuous 
(i.e. 1, 2, 2, 3, 4, 5). If you've never seen a rank order like this before, do the rank window function tutorial. 
**/

USE PRACTICE;

SELECT artists.artist_name,
DENSE_RANK() OVER (

ORDER BY COUNT(songs.song_id) DESC
) AS artist_rank
FROM artists
INNER JOIN songs 
ON artists.artist_id = songs.artist_id
INNER JOIN global_song_rank AS ranking
 ON songs.song_id = ranking.song_id
 WHERE ranking.rank <=10
GROUP BY artists.artist_name;