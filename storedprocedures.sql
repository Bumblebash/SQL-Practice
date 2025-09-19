use practice1;

SELECT *FROM CUSTOMERS;

/** Creating an Insert Stored procedure in the Customer Table **/

CREATE PROCEDURE uspInsertCustomer
@FirstName     nvarchar(50),
@LastName      nvarchar(50),
@Email         nvarchar(50)

AS
INSERT INTO CUSTOMERS(FirstName, LastName, Email)
SELECT @Firstname, @LastName, @Email

Exec uspInsertCustomer 'Bash', 'ssim', 'bash@gmail.com';
       Exec uspInsertCustomer 'Mike', 'West', 'Mike@gmail.com';
               Exec uspInsertCustomer'Bush', 'Geards', 'Bush@gmail.com';

               select * from Customers;