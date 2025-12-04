USE PRACTICE;

SELECT * FROM policies;

SELECT * FROM brokers;

--changing Datatypees of the table(Policies Table)
ALTER TABLE policies ALTER COLUMN PolicyID INT NOT NULL;
ALTER TABLE policies ALTER COLUMN BrokerID INT NOT NULL;
ALTER TABLE policies ALTER COLUMN Premium INT;

--Assigning Primary Key 
ALTER TABLE policies ADD PRIMARY KEY(PolicyID);


--Changing Datatypes of the table(brokers Table)
ALTER TABLE brokers ALTER COLUMN BrokerID INT NOT NULL;
ALTER TABLE brokers ALTER COLUMN BrokerName nvarchar(30);
ALTER TABLE brokers ALTER COLUMN ReportsTo INT;

--Change Float values to Integers 
UPDATE brokers 
SET ReportsTo = CAST(CAST(ReportsTo AS FLOAT) AS INT)
WHERE ReportsTo IS NOT NULL;

--Investigate Column datatypes
EXEC sp_columns @table_name = 'brokers';
EXEC sp_columns @table_name = 'policies';



--Altering the broker table 
--2nd Row
UPDATE  brokers SET ReportsTo = 1
WHERE BrokerID = 2;
--3rd Row 
UPDATE brokers SET ReportsTo = 2
WHERE BrokerID = 3;
--4th Row 
UPDATE brokers SET ReportsTo = 3
WHERE BrokerID = 4;
--5th Row 
UPDATE brokers SET ReportsTo = 4
WHERE BrokerID = 5;

--Recursive CTE Question
--Question1: Given a broker, show all sub-brokers and agents under them—at all levels—and the total premiums generated under that hierarchy.
WITH BrokerHeirarchy AS (
SELECT BrokerID, BrokerName, ReportsTo,
  0 AS LevelDepth
  FROM brokers
  Where BrokerID = 1 
  
  UNION ALL 
  SELECT 
		b.BrokerID,
		b.Brokername,
		b.ReportsTo,
		bh.LevelDepth + 1
FROM Brokers b
INNER JOIN BrokerHeirarchy bh
		ON b.ReportsTo = bh.BrokerID
		)
SELECT * FROM BrokerHeirarchy
ORDER BY LevelDepth, BrokerID;