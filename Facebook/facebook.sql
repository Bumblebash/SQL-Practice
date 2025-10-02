USE Practice;

SELECT *FROM page_likes;
SELECT * FROM pages;

/** SUB QUERY SCENARIO **/

/** Assume you're given two tables containing data about
Facebook Pages and their respective likes (as in "Like a Facebook Page").
Write a query to return the IDs of the Facebook pages that have zero likes. 
The output should be sorted in ascending order based on the page IDs.**/

SELECT page_id  FROM pages
  WHERE page_id   NOT IN 
		( SELECT page_id FROM page_likes)
  ORDER BY page_id ASC;

  /** Note: Used NOT IN to filter out facebook pages by ids  without likes **/