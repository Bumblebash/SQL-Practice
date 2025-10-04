USE Practice;

Select * from posts;

/*Change datatype for postdate */
alter table posts alter column post_date datetime2(0);

/** Given a table of Facebook posts, 
for each user who posted at least twice in 2021, write a query to find the number of 
days between each user’s first post of the year and last post of the year in the year 2021. 
Output the user and number of the days between each user's first and last post.*/

SELECT user_id, DATEDIFF(DAY, MIN(post_date), MAX(post_date)) As total_day_difference FROM posts
		WHERE  YEAR(post_date) = 2021
		GROUP BY user_id
		HAVING COUNT(*) >=2;

