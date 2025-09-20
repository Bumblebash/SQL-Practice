use Practice1;


SELECT *FROM superheroes;

/** Changing Data types **/
ALTER TABLE superheroes ALTER COLUMN followers bigint;
ALTER TABLE superheroes ALTER COLUMN posts int;
ALTER TABLE superheroes alter column engagement_rate decimal(18,2);
ALTER TABLE superheroes alter column avg_likes int;
alter table superheroes alter column avg_comments int;


/**Assigning popularity category using CASE statement
      And storing it in the userstoredprocedure**/
Create proc uspReturnMostpopularActors
AS 
SELECT 
    character,
	superhero_alias,
	platform,
	CASE 
		WHEN followers >= 500000 THEN 'Popular'

	END AS popularity_category
FROM superheroes;


/** Executing Stored procedure to retriece the most popular Actors **/
exec uspReturnMostpopularActors;



/** Handling Multiple Conditions with CASE Statement in SELECT **/
SELECT 
actor,
character,
CASE
	WHEN engagement_rate >= 8.0 THEN 'High Engagement'
	WHEN engagement_rate  BETWEEN 6.0 AND 7.9 THEN 'Moderate Engagement'
	WHEN engagement_rate < 6.0 THEN 'Low Engagement'
END AS engagement_category
FROM superheroes
WHERE platform IN ('Tiktok', 'Instagram');


/** Using CASE-ELSE Clause with CASE Statement in SELECT Statement **/
/** For characters with 700,000 or more followers, label them as "Highly Popular."
For characters with followers between 300,000 and 699,999, label them as "Moderately Popular."
For characters with fewer than 300,000 followers, label them as "Less Popular." 
END AS popularity Category **/

SELECT 
	actor,
	character,
	CASE 
		WHEN followers >= 700000 THEN 'Highly Popular'
		WHEN followers BETWEEN 300000 AND 699999 THEN 'Moderately Popular'
		WHEN followers < 300000 THEN 'Less popular'
END  AS Popularity_Category
FROM superheroes;


/** Likes Category
    "Super Likes" for characters with an average of 15,000 or more likes.
"Good Likes" for characters with an average between 5,000 and 14,999 likes (inclusive).
"Low Likes" for characters with an average of fewer than 5,000 likes. **/

SELECT 
	actor,
	character,
	avg_likes,
	CASE
		WHEN avg_likes >= 15000 THEN 'Super Likes'
		WHEN avg_likes BETWEEN 5000 AND 14999 THEN 'Good Likes'
		WHEN avg_likes < 5000 THEN 'Low Likes'
END AS Likes_Category 
FROM  superheroes
ORDER BY avg_likes DESC
;



/** Suppose we want to filter the marvel_avengers dataset based on the social media platforms,
but we want to include an option to filter based on different criteria for each platform.
We'll use the CASE statement in the WHERE clause to achieve this.
For Instagram, we're filtering actors with 500,000 or more followers.
For Twitter, we're filtering actors with 200,000 or more followers.
For other platforms, we're filtering actors with 100,000 or more followers.**/
SELECT 
    actor,
    character,
    platform
FROM superheroes
WHERE 
    (platform = 'Instagram' AND followers >= 500000)
    OR (platform = 'Twitter' AND followers >= 200000)
    OR (platform NOT IN ('Instagram','Twitter') AND followers >= 1000000);






	SELECT
  platform,
  COUNT(CASE 
    WHEN followers >= 500000 THEN 1
    ELSE NULL
  END) AS popular_actor_count,
  COUNT(CASE 
    WHEN followers < 500000 THEN 1
    ELSE NULL
  END) AS less_popular_actor_count
FROM superheroes
GROUP BY platform;





