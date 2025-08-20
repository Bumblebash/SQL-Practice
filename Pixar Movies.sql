SHOW DATABASES;
USE banking_case2;
SHOW TABLES;
DESC  customers;
SELECT * FROM Customers LIMIT 20;
CREATE DATABASE PRACTICE;
USE  PRACTICE;
create table Movies (
id int(1),
Title varchar(20),
Director varchar(20),
Year int(4),
Length_minutes int (4),
PRIMARY KEY(id)
);
DESC Movies;
ALTER TABLE Movies RENAME COLUMN Year To Year1;
Insert into Movies (id, Title, Director,  Year1, Length_minutes)
Values (1, 'Toy Story', 'John Lasseter', 1995, 81),
(2, "A bug's Life", 'John Lasseter', 1998, 95),
(3, 'Toy story 2 ', 'John Lasseter', 1999, 93),
(4, 'Monster inc.', 'Peter Docter', 2001, 92),
(5, 'Finding Nemo', 'Andrew Stanton', 2003, 107),
(6, 'The Incredibles', 'Brad Bird', 2004, 116),
(7, 'Cars', 'John Lasseter', 2006, 117),
(8, 'WALL-E', 'Andrew Stanton', 2008, 104),
(10, 'UP', 'Pete Docter', 2009, 101),
(11, 'Toy Story 3', 'Lee Unkrich', 2010, 103),
(12, 'Cars 2', 'John Lesseter', 2011, 120),
(13, 'Brave', 'Brenda Chapman', 2012,  102),
(14, 'Monsters University', 'Dan Scanlon', 2013, 110); 
SELECT *FROM Movies;
SELECT Title   FROM  Movies; 
SELECT Director From Movies;
SELECT Director, Title FROM Movies;
SELECT Title FROM Movies WHERE id = 6;
SELECT Title  FROM Movies WHERE year1 BETWEEN 2000 AND 2010;
SELECT Title, year1  FROM Movies LIMIT 5;
SELECT Title, year1 FROM Movies WHERE year1 NOT BETWEEN 2000 AND 2010;
INSERT INTO Movies VALUES (87, 'WALL-G', 'Brenda Chapman', 2042, 97);
SELECT * FROM Movies WHERE Title LIKE  'Toy%';
SELECT * FROM Movies WHERE Director = 'John Lasseter';
SELECT Title, Director FROM Movies WHERE Director NOT LIKE  'John Lasseter';
SELECT * FROM Movies WHERE Title LIKE 'WALL-%';
SELECT distinct Director FROM MOVIES ORDER BY Director ASC;
SELECT * FROM Movies  ORDER BY year1 DESC LIMIT 5;
SELECT Title FROM Movies ORDER BY Title asc LIMIT 5;
SELECT Title FROM Movies ORDER BY Title asc LIMIT  5 offset 5 ;


#JOINS 
#INNER JOINS 

# Create a new Table  BOxOffice
CREATE TABLE Boxoffice (
Movie_id int(3) PRIMARY KEY,
Rating decimal(2,1),
Domestic_Sales int(9),
International_sales int(9)
);
# Changing the column data type to just INT for Domestic_Sales
ALTER TABLE Boxoffice MODIFY COLUMN Domestic_Sales INT;

#Changing the column name to just sales from Sales 
ALTER TABLE Boxoffice RENAME COLUMN Domestic_Sales TO Domestic_sales;

#Changing Column data type for International_sales to just INT
ALTER TABLE Boxoffice MODIFY COLUMN International_sales INT;

#Retrieving the data types and columns 
DESC Boxoffice;

#INSERTING VALUES IN OUR TABLE
INSERT INTO Boxoffice (Movie_id, Rating, Domestic_sales, International_sales) 
 VALUES (5,8.2, 380843261, 555900000),
 (14, 7.4, 268492764, 475066843),
 (8, 8, 206445654, 417277164),
 (12, 6.4,191452396, 368400000),
 (3, 7.9, 245852179, 239163000),
 (6, 8, 261441092, 370001000),
 (9, 8.5, 223808164, 297503696),
 (11, 8.4, 415004880, 648167031),
(1, 8.3, 191796233, 170162503),
(7, 7.2, 244082982, 217900167),
(10, 8.3, 293004164, 438338580),
(4, 8.1, 289916256, 272900000),
(2, 7.2 ,162798565, 200600000),
(13, 7.2, 237283207, 301700000);
 
 #Checking out the table
 SELECT * FROM Boxoffice;
 
 # SHOWING TABLES 
SHOW TABLES;
SELECT *FROM movies;

#Show Domestic and Intrnational Sales for each movie
SELECT Title, Domestic_sales, International_sales FROM boxoffice INNER JOIN movies
ON boxoffice.Movie_id = movies.id;

#Show sales numbers for each movie that did better internationally rather than domestically
SELECT Title, Domestic_sales, International_sales FROM boxoffice INNER JOIN movies
ON boxoffice.Movie_id = movies.id WHERE International_sales > Domestic_sales;

#List all movies by their rating in descending order
SELECT Title, Rating FROM boxoffice INNER JOIN movies ON boxoffice.Movie_id = movies.id ORDER BY Rating desc;