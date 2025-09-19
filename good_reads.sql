USE Practice1;


SELECT * FROM good_reads;


ALTER table good_reads alter column book_title varchar(50);
ALTER table good_reads alter column author varchar(50);
ALTER table good_reads alter column book_genre varchar(50);
ALTER table good_reads alter column year_released DATE;
ALTER table good_reads alter column country nvarchar(50);
ALTER table good_reads alter column publication nvarchar(50);
ALTER table good_reads alter column book_rating decimal(10,2);
ALTER table good_reads alter column number_of_reviews bigint;



SELECT *FROM good_reads
WHERE book_title IS NOT NULL;


SELECT COALESCE(book_rating, 0) AS Good_ratings
FROM good_reads;