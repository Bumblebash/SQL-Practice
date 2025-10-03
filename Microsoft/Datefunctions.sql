USE PRACTICE;

SELECT * FROM messages_table;

/* renaming the table column name */
EXEC sp_rename 'messages_table.[content]', 'Content', 'COLUMN';

/* renaming A table */
/*sp stands for stored procedures */
EXEC sp_rename 'messages', 'messages_table';

/** Changing the Data type **/
alter table messages_table alter column sent_date DATETIME2(0);

/*Write a query to identify the top 2 Power Users who sent the highest number of messages
on Microsoft Teams in August 2022.
Display the IDs of these 2 users along with the total number of messages they sent. 
Output the results in descending order based on the count of the messages.*/

SELECT TOP 2(sender_id), COUNT(content) As Total_messages_sent FROM messages_table
				WHERE YEAR(sent_date) = 2022
				AND MONTH(sent_date) = 8
				GROUP BY sender_id
				ORDER BY Total_messages_sent DESC;

/*Option 2 for Mysql */
SELECT sender_id, COUNT(Content) As Total_messages  FROM messages_table
WHERE EXTRACT(YEAR FROM sent_date) = 2022
AND EXTRACT(MONTH FROM sent_date) = 8
GROUP BY sender_id
ORDER BY  Total_messages DESC LIMIT 2;


/*Current Date And Time in SQL */
SELECT 
	message_id,
	sent_date,
	CAST(GETDATE()  AS date) AS [current_date],
	CAST(GETDATE() AS TIME) AS [current_time],
	current_timestamp As [current_timestamp]
FROM messages_table;
