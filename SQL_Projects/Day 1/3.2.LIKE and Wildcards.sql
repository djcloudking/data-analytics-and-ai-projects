-- LIKE and Wildcards

-- Filter with wildcard: 
    SELECT name, user_city FROM users
    WHERE user_city LIKE '%port%';


--  Case sensitivity in PostgreSQL:
    LIKE is case sensitive
    ILIKE is case insensitive
    SELECT name, user_city FROM users
    WHERE user_city ILIKE '%port%';


--  Case sensitivity in SQL Server:
--  SQL Server is case insensitive by default.
--  Case sensitivity is defined by the column, not the SQL statement.

-- Check a table's case sensitivity for all columns:

SELECT table_name, column_name, collation_name
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'users'; --put your table name in the single quotes

SQL Server case sensitive query:

SELECT name, user_city FROM users
WHERE user_city LIKE '%port%' COLLATE SQL_Latin1_General_CP1_CS_AS;


--  Filter using AND:
In PostgreSQL:
SELECT * FROM products
WHERE title ILIKE '%paper%' AND price > 30;

In SQL Server:
SELECT * FROM products
WHERE title LIKE '%paper%' AND price > 30;


--  Filter using OR:
SELECT * FROM orders
WHERE ship_state = 'FL' OR ship_zipcode = '17408';


--  Filter using NOT: 
SELECT * FROM products
WHERE NOT tags = 'emerald';


--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- 1. Find all the users with a gmail email address.
SELECT * FROM users
WHERE email LIKE '%@gmail.com';


-- 2. Find all the orders shipped to Florida (FL) or Texas (TX).
--    Below are 2 solutions that both work:
SELECT * FROM orders
WHERE ship_state = 'FL' OR ship_state = 'TX';
-- or
SELECT * FROM orders
WHERE ship_state IN ('FL', 'TX');

--    Bonus: Order the results by the state.
SELECT * FROM orders
WHERE ship_state IN ('FL', 'TX')
ORDER BY ship_state;



-- 3. Find the 5 most recent orders shipped to New York (NY).
-- PostgreSQL:
SELECT * FROM orders
WHERE ship_state = 'NY'
ORDER BY created_at DESC LIMIT 5;

-- SQL Server:
SELECT TOP(5) * FROM orders
WHERE ship_state = 'NY'
ORDER BY created_at DESC;



-- 4. Select all the products that include the word 'plate' and cost more than $20.
-- PostgreSQL:
SELECT * FROM products
WHERE title ILIKE '%plate%' AND price > 20;

-- SQL Server:
SELECT * FROM products
WHERE title LIKE '%plate%' AND price > 20;



-- 5. Find all the products that do NOT contain 'rubber' in the title.
-- PostgreSQL:
SELECT * FROM products
WHERE title NOT ILIKE '%rubber%';

-- SQL Server:
SELECT * FROM products
WHERE title NOT LIKE '%rubber%';



-- 6. Find all the products that are tagged 'grey' or 'gray'
--    (notice the different spellings: one is 'e' and other 'a')
SELECT * FROM products
WHERE tags IN ('grey','gray');

-- The following also works:
-- PostgreSQL:
SELECT * FROM products
WHERE tags ILIKE 'grey' OR tags ILIKE 'gray';

-- SQL Server:
SELECT * FROM products
WHERE tags LIKE 'grey' OR tags LIKE 'gray';



-- 7. Find only the line_items with a status of 'returned'
SELECT * FROM line_items
WHERE status = 'returned';



-- 8. Building on the query above, let's find the most expensive returns:
--    Add a column for price multiplied by quantity 
--    The new column won't have a column name, so give it an alias.
--    ORDER BY that column so the most expensive returns are at the top.
SELECT 
	*,
	price * quantity AS total_value
FROM line_items
WHERE status = 'returned'
ORDER BY total_value DESC;

