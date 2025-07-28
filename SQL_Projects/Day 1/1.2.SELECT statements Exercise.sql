-- SELECT Statements

 -- View entire table:
SELECT * FROM products;

--  Only 2 columns from table:
SELECT title, price FROM products;


-- The first 10 rows from table:
-- In PostgreSQL:
SELECT * FROM products LIMIT 10;

-- In SQL Server:
SELECT TOP(10) * FROM products;

-- **NOTE: TOP can also be written in an older syntax without parenthesis as TOP 10
-- but the parenthesis are the newer (and now preferred) syntax.**

-- Order by a column name or number: 
SELECT * FROM products ORDER BY price

SELECT title, price FROM products ORDER BY 2


-- Order by a column in descending order (large–small, Z–A, new–old):
SELECT * FROM products ORDER BY price DESC

-- Show only the tags for products:
SELECT tags FROM products;

-- Show distinct tags (do not show duplicates):
SELECT DISTINCT tags FROM products;

--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- 1. Write a SQL query to view the entire 'users' table.
SELECT * FROM users;


-- 2. View the first 5 rows of the 'users' table. 
-- PostgreSQL:
SELECT * FROM users LIMIT 5;

-- SQL Server:
SELECT TOP(5) * FROM users;


-- 3. View the 'users' table, ordered by when the users were created (from newest to oldest).
SELECT * FROM users ORDER BY created_at DESC;


-- 4. View the entire 'orders' table.
SELECT * FROM orders;


-- 5. View the name and state columns of the 'orders' table.
SELECT ship_name, ship_state FROM orders;


-- 6. View the 10 most recent orders.
-- PostgreSQL:
SELECT * FROM orders ORDER BY created_at DESC LIMIT 10;

-- SQL Server:
SELECT TOP(10) * FROM orders ORDER BY created_at DESC;


-- 7. Use DISTINCT to see which states people (users) are from (not where the orders were shipped).
SELECT DISTINCT user_state FROM users;


----------------------------------------
-- EXTRA 
----------------------------------------

-- 1. You can use DISTINCT (to remove duplicate rows) even when showing multiple columns.
--    Use DISTINCT on the orders table to see which states each user has shipped orders to.
SELECT DISTINCT user_id, ship_state FROM orders;


-- 2. SQL Server orders the results automatically, but Postgres does not.
--    Postgres Only: Modify the query above to ORDER BY user_id and then ship state.
SELECT DISTINCT user_id, ship_state FROM orders ORDER BY user_id, ship_state;


