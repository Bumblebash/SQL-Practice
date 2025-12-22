USE Malaria_DB;

SELECT * from malaria_data


CREATE TABLE malaria_data(
[Region] nvarchar(30),
[District] nvarchar(27),
[0-28 DAYS FEMALE] int,
[0-28 DAYS MALE]  int,
[0-28 DAYS TOTAL]  int,
[10-19 YEARS FEMALE]  int,
[10-19 YEARS MALE]  int,
[10-19YRS TOTAL]  int,
[20+ YRS FEMALE]  int,
[20+ YRS MALE]  int,
[20+ YRS TOTAL]  int,
[5-9YRS FEMALE] int,
[5-9YRS MALE] int,
[5-9YRS TOTAL] int,
[29 DAYS-4YRS FEMALE] int,
[29DAYS - 4YRS MALE] int,
[29 DAYS - 4YRS TOTAL] int,
[0-28 DAYS (B/S & RDT) FEMALE] int,
[28 DAYS (B/S & RDT) MALE] int,
[0-28 DAYS (B/S & RDT) TOTAL] int,
[10-19 YRS (B/S & RDT) FEMALE
[10-19 YRS (B/S & RDT) MALE] int,
[10-19 YRS (B/S & RDT) TOTAL] int,
[20+ (B/S &RDT) FEMALE] int,
[20+ (B/S & RDT) MALE] int,
[20 + (B/S & RDT) TOTAL] int,
[29DAYS-4YRS (B/S & RDT) FEMALE] int,
[29DAYS-4YRS (B/S & RDT) MALE] int,
[29DAYS-4 YRS (B/S & RDT) TOTAL] int,
[5-9YRS (B/S & RDT) FEMALE] int,
[5-9YRS (B/S & RDT) MALE] int,
[5-9YRS (B/S & RDT) TOTAL] int,
[TOTAL CASES CONFIRMED(B/S & RDT)] int,
[0-28 DAYS FEMALE CT] int,
[0-28 DAYS MALE CT] int,
[0-28 DAYS TOTAL CT] int,
[10-19 YRS FEMALE CT] int,
[10-19 YRS MALE CT] int,
[10-19 YRS CT TOTAL] int,
[20 + YRS FEMALE CT] int,
[20 + YRS MALE CT] int,
[20 + YRS CT TOTAL] int,
[29DAYS - 4YRS FEMALE CT] int,
[29 DAYS - 4YRS MALE CT] int,
[29 DAYS - 4YRS CT TOTAL] int,
[5-9YRS FEMALE CT] int,
[5-9YRS MALE CT] int,
[5-9YRS CT TOTAL] int,
[PREG 10-19YRS] int,
[PREG 20 + YRS] int,
[TOTAL PREG] int,
[TOTAL CASES FEMALE] int,
[TOTAL CASES MALE] int,
[GRAND TOTAL CASES] int,
[<5YRS FEMALES TOTAL] int,
[<5YRS MALE TOTAL] decimal(18,8),
[< 5YRS GRAND TOTAL] int,
[AREA(Km2)] int,
[TOTAL POPULATION] decimal(18,8),
[POPULATION DENSITY(People per km2)] decimal(18,8),
[CORDINATES (LATITUDE ° N)] decimal(18,8),
[CORDINATES (LONGITUDE ° E)] int,
[Year] int,
[Incidence_Rate] decimal(18,8),
[POPULATION DENSITY] decimal(18,8)
);


--Finding Out the number of Columns in a dataset
SELECT COUNT(*) AS NumberOfColumns 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'malaria_data';


SELECT COUNT(*) FROM malaria_data;



--Total population
SELECT SUM(