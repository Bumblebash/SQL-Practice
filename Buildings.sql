USE PRACTICE;
#Creted Buildings Table
CREATE TABLE Buildings (
Building_name varchar(2) primary key,
Capacity int);
#Cross check the data types
DESC Buildings;

#Insert Values in the Buildings table
INSERT INTO Buildings (Building_name, Capacity)
VALUES ('1e', 24),
('1w', 32),
('2e', 16),
('2w', 20); 
# Cross check for data in the table
SELECT *FROM Buildings;

#Create Employees Table 
CREATE TABLE Employees (
Role VARCHAR(30),
Name varchar(30),
Building varchar(2) PRIMARY KEY,
Years_employed int);

#Retrieve the data types 
DESC Employees;

#Insert Values into the table
INSERT INTO Employees (Role, Name, Building, Years_Employed)
VALUES ('Engineer', 'Becky A.', '1e', 4),
('Engineer', 'Dan B.', '1e', 2),
('Engineer', 'Sharon F.', '1e', 6),
('Engineer', 'Dan M.', '1e', 4),
('Enginner', 'Malcom S.', '1e', 1);

#changing data type for Building 
ALTER TABLE Employees
DROP PRIMARY KEY;

#Assigning primary Key to Names Instead 
ALTER TABLE Employees MODIFY Name varchar(30) PRIMARY KEY;

#Retrieving Employee data
SELECT *FROM Employees;

#INSERT MORE VALUES IN Employee table
INSERT INTO Employees (Role, Name, Building, Years_employed)
VALUES ('Artist', 'Tylar S.', '2w', 2),
('Artist', 'Sherman D.', '2w', 8),
('Artist', 'Jakob J.','2w', 6),
('Artist','Lillia A.', '2w', 7),
('Artist', 'Brandon J.', '2w', 7),
('Manager', 'Scott k.', '1e', 9),
('Manager', 'Shirlee M.', '1e', 3),
('Manger', 'Daria O.', '2w', 6);

#List of buildings that have employees
SELECT DISTINCT building From Employees;


#Building Name, Name of Employee and the building Capacity with no Null
SELECT Building_name, Capacity, Name 
FROM Buildings LEFT JOIN Employees
ON Buildings.Building_name = Employees.Building
WHERE Name IS NOT NULL;

#Total of employee count
SELECT 
    Buildings.Building_name, 
    Buildings.Capacity, 
    COUNT(Employees.Name) AS Employee_Count
FROM Buildings
LEFT JOIN Employees
    ON Buildings.Building_name = Employees.Building
    WHERE Name IS NOT NULL
GROUP BY Buildings.Building_name, Buildings.Capacity;

#Find the List of All buildings and their capacity
SELECT * FROM Buildings;
    
#List All buildings and the distinct employee roles in each building (including empty buildings) 
SELECT DISTINCT Building_name, Role
	FROM Buildings LEFT JOIN Employees
    ON building_name = Building;





