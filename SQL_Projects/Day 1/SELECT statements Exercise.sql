-- SELECT Statements

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. View entire table:
--    SELECT * FROM products;
SELECT * FROM products;

-- 2. Only 2 columns from table:
--    SELECT title, price FROM products;
SELECT title, price FROM products;

-- 3. The first 10 rows from table:
--    In PostgreSQL:
--    SELECT * FROM products LIMIT 10;
SELECT * FROM products LIMIT 10;

--    In SQL Server:
--    SELECT TOP(10) * FROM products;
--    NOTE: TOP can also be written in an older syntax without parenthesis as TOP 10
--    but the parenthesis are the newer (and now preferred) syntax.
SELECT * FROM products LIMIT 10;


-- 4. Order by a column name or number:
--    SELECT * FROM products ORDER BY price;
--    SELECT title, price FROM products ORDER BY 2;
SELECT * FROM products ORDER BY price

SELECT title, price FROM products ORDER BY 2

-- 5. Order by a column in descending order (large–small, Z–A, new–old):
--    SELECT * FROM products ORDER BY price DESC;
SELECT * FROM products ORDER BY price DESC


-- 6. Show only the tags for products:
--    SELECT tags FROM products;
SELECT tags FROM products;


-- 7. Show distinct tags (do not show duplicates):
--    SELECT DISTINCT tags FROM products;
SELECT DISTINCT tags FROM products;


--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- 1. Write a SQL query to view the entire 'users' table.
SELECT * FROM users

-- 2. View the first 5 rows of the 'users' table. 
SELECT * FROM users LIMIT 5

-- 3. View the 'users' table, ordered by when the users were created (from newest to oldest).
SELECT * FROM users ORDER BY created_at DESC 

-- 4. View the entire 'orders' table.
SELECT * FROM orders 

-- 5. View the name and state columns of the 'orders' table.
SELECT ship_name, ship_state  FROM orders 

-- 6. View the 10 most recent orders.
SELECT ship_name, ship_state  FROM orders LIMIT 10

-- 7. Use DISTINCT to see which states people (users) are from (not where the orders were shipped).
SELECT DISTINCT user_state FROM users

----------------------------------------
-- EXTRA CREDIT: If you finish early.
----------------------------------------

-- 1. You can use DISTINCT (to remove duplicate rows) even when showing multiple columns.
--    Use DISTINCT on the orders table to see which states each user has shipped orders to.
SELECT DISTINCT ship_state FROM orders 

-- 2. SQL Server orders the results automatically, but PostgreSQL does not.
--    PostgreSQL Only: Modify the query above to ORDER BY user_id and then ship state.


