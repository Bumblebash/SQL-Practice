SHOW DATABASES;
USE practice;
CREATE TABLE  North_american_cities(
City varchar(50) PRIMARY KEY ,
Country varchar(50),
Population int(9),
Latitude DECIMAL(9,6),
Longitude DECIMAL(9,6)
);
DESC  North_american_cities;	
INSERT INTO North_american_cities (City, Country, Population, Latitude, Longitude)
VALUES ('Guadalajara', 'Mexico', 1500800, 20.659699, -103.349609),
('Toronto', 'Canada', 2795060, 43.653226, -79.383184),
('Houston', 'United States',  2195914, 29.760427, -95.369803),
('New York', 'United States', 8405837, 40.712784, -74.005941),
('Philadelphia', 'United States', 1553265, 39.952584, -75.165222),
('Havana', 'Cuba', 2106146, 23.05407, -82.345189),
('Mexico City', 'Mexico', 8555500, 19.432608, -99.133208),
('Phoenix', 'United States', 1513367, 33.448377, -112.074037),
('Los Angeles', 'United States', 3884307, 34.052234, -118.243685),
('Escatepec de Morelos', 'Mexico', 1742000, 19.601841, -99.050674),
('Montreal', 'Canada', 1717767, 45.501689, -73.567256),
('Chicago', 'United States', 2718782, 41.878114, -87.629798);
ALTER TABLE North_american_cities MODIFY  COLUMN Country varchar(50);
ALTER TABLE North_american_cities MODIFY  COLUMN City varchar(50);
SELECT * FROM North_american_cities;

#Canadian Cities and their population
SELECT City, Population FROM North_american_cities WHERE Country = 'Canada';

#Order all the cities in the United States by their latitude from north to south
SELECT  City, Latitude FROM North_american_cities WHERE Country = 'United States' ORDER BY Latitude DESC;

#Cities of West Chicago Ordered from West to East
SELECT City, Longitude FROM North_american_cities WHERE longitude < -87.629798  ORDER BY Longitude ASC; 
   
#Listing the two largest cities in Mexico(By population)
SELECT City, Population From North_american_cities WHERE Country = 'Mexico' ORDER BY Population DESC LIMIT 2;

#List the third and fourth Largest cities by (by population) in the United States and their population
SELECT City, Population From North_american_cities WHERE Country = 'United States' ORDER BY Population DESC LIMIT 2 OFFSET 2;


#QUERIES WITH EXPRESSIONS
#List All movies and their combined sales in millions of dollars
SELECT Title, (Domestic_sales + International_sales) / 1000000 As Gross_sales 
FROM Movies AS m LEFT JOIN Boxoffice AS b 
	ON m.Id = b.Movie_id;
    
#Movies and their ratings in Years
SELECT Title, (Rating * 10)  As Percentage_sales 
		FROM Movies AS m JOIN Boxoffice AS b
        ON m.Id = b.Movie_id;

#Movies that were released on even Number years 
SELECT Title, Year1 FROM Movies WHERE Year1 % 2 = 0;

##GROUP BY (AGGREGATE FUNCTIONS)
#Longest time that an employee has been in the studio
SELECT MAX(Years_employed) as max_years_served FROM Employees ;

#Average Number of Years for each Role
SELECT avg(Years_employed) as AVG_emp_period, Role FROM Employees GROUP BY Role;

#Total Number of Employee years worked in each building
SELECT Building, SUM(years_employed) FROM employees GROUP BY building; 


#CLEARING SOME DATA ERRORS IN THE TABLE
UPDATE Employees
SET Role = 'Engineer' WHERE Name = 'Malcom S.';
UPDATE Employees
SET Role = 'Manager' WHERE Name = 'Daria O.';
SELECT * FROM Employees;

#Find the number of Artists in the studio without a having clause
SELECT COUNT(Name) As Total_artists , Role  FROM Employees 
	   WHERE Role = 'Artist'
	GROUP BY (Role) 
 ;
 
 #Find the number of Employees of each role in the Studio
 SELECT COUNT(Name) AS Total_employees, Role FROM Employees 
		GROUP BY (Role);
        
#OPTION2 FOR COUNT
SELECT role, COUNT(*)
	FROM Employees GROUP BY Role;
    
    
#Total Number of Years Employed by all Engineers  
SELECT SUM(Years_employed) AS Total_years_by_Engineers , Role FROM Employees 
	WHERE Role ='Engineer'
    GROUP BY (Role);





