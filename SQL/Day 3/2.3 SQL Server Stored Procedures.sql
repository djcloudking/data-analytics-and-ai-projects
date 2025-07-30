-- Stored Procedures

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

/******************************************************/
-- PostgreSQL
/******************************************************/

-- Stored Procedures work differently in PostgreSQL than they do in SQL Server.
-- In PostgreSQL you probably want to use a function instead of a stored procedure (unless you’re managing transactions).


/******************************************************/
-- SQL Server
/******************************************************/

-- 1. Using a SQL Server System Stored Procedure:
--    EXEC sp_help users; -- users refers to our users table
--    EXEC sp_help orders; -- users refers to our orders table
--    EXEC sp_server_info;


-- 2. Call a Stored Procedure that does not have any variables 
--    (both ways of calling it work the same):
--    EXEC spUsers_GetAll;
--    spUsers_GetAll;


-- 3. Call a Stored Procedure with One Variable:
--    EXEC spUsers_GetByName @user_name = 'Elma%';
--    EXEC spUsers_GetByName @user_name = 'Jay%';
--    EXEC spUsers_GetByName @user_name = '';


-- 4. Call a Stored Procedure with Multiple Variables:
--    If you have multiple variables you separate them with a comma:
--    EXEC spName @var1 = value1, @var2 = value2;

--    EXEC spUsers_Total_In_Date_Range @start_date = '2019-01-01', @end_date = '2020-12-31';