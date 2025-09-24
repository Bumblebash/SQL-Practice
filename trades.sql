USE practice1;

SELECT * FROM trades_table;

/** Changing data types of the columns **/
ALTER TABLE trades_table alter column order_id bigint NOT NULL;
alter table trades_table alter column user_id int NOT NULL;
alter table trades_table alter column price decimal(18,2);
alter table trades_table alter column quantity smallint;
alter table trades_table alter column  status nvarchar(15);
alter table trades_table alter column timestamp DATETIME2;

/** Assigning primary Key to the table **/
alter table trades_table ADD PRIMARY KEY(order_id);


/** Step 1: Recognise the Primary key id **/
SELECT name FROM sys.key_constraints
WHERE type = 'PK' AND OBJECT_NAME(parent_object_id) = 'trades_table';

/** Step 2: Dropping the pk **/
ALTER TABLE trades_table DROP CONSTRAINT PK__trades_t__46596229EBF87A47;

/**Step3: Assigning it to user_id **/
alter table trades_table ADD PRIMARY KEY (order_id);


/** USERS TABLE **/
SELECT * FROM users_table;

/** Changing data types for USERS TABLE **/
alter table users_table alter column user_id int NOT NULL;
alter table users_table alter column city nvarchar(50);
alter table users_table alter column email nvarchar(50);
alter table users_table alter column signup_date DATETIME2;

/** Assigning the primary key (Users Table) **/
alter table users_table ADD PRIMARY KEY(user_id);




/** Assigning A foreign KEY to USERS TABLE **/
ALTER TABLE trades_table
ADD CONSTRAINT FK_trades_users FOREIGN KEY (user_id) REFERENCES users_table(user_id);

/**NOTE: Couldnt add Foreign key as the trades_table contains orphans(user_id)
       that dont have correponding values in the trades_table **/


/**Write a SQL query to join the trades and users table.**/
SELECT * FROM users_table JOIN trades_table
        ON
        users_table.user_id = trades_table.user_id;


   
/** Write a query to retrieve the top three cities 
that have the highest number of completed trade orders listed in descending order. 
Output the city name and the corresponding number of completed trade orders.**/

SELECT  Top 3 city,  COUNT(status) As Total_orders FROM users_table 
      JOIN 
     trades_table ON
     users_table.user_id = trades_table.user_id 
     WHERE status = 'Completed'
     GROUP BY city
     ORDER BY Total_orders DESC ;