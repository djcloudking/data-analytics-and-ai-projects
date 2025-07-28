
-- 
-- Filtering with WHERE


-- Filter by exact value:
    SELECT * FROM products
    WHERE price = 31.98;

-- Filter with less-than:
    SELECT * FROM products
    WHERE price < 31.98;


-- Filter with a range (using BETWEEN): 
    SELECT * FROM products
    WHERE price BETWEEN 28.87 AND 44.93;


--   4. Filter with multiple conditions (using OR): 
SELECT * FROM products
WHERE price = 31.98
OR price= 28.87;


-- 5. Filter with set of values (using IN): 
-- Does the same thing as the previous OR statement, but with less code.
SELECT * FROM products
WHERE price IN (31.98, 28.87);




--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- 1. Find rows from the orders table for user_id 30
SELECT * FROM orders
WHERE user_id = 30;

-- 2. Show only the line_items where someone ordered a quantity of 3 or more.
SELECT * FROM line_items
WHERE quantity >= 3;

-- 3. Show the line_items with a price less than $30
SELECT * FROM line_items
WHERE price < 30;

-- 4. Show the line_items with a price of $30 or more, ordered by most expensive first.
SELECT * FROM line_items
WHERE price >= 30
ORDER BY price DESC;

-- 5. Find orders that were shipped to zipcode 10499 or 77719.
--    Keep in mind that zipcodes are stored as strings, not numbers!
SELECT * FROM orders
WHERE ship_zipcode IN ('10499', '77719');

-- 6. Modify the last query to see only the DISTINCT names of the people those orders were shipped to.
SELECT DISTINCT ship_name FROM orders
WHERE ship_zipcode IN ('10499', '77719');

----------------------------------------
-- EXTRA  
----------------------------------------

-- 1. View the 3 most recent orders made by user_id 33.
-- PostgreSQL:
SELECT * FROM orders
WHERE user_id = 33
ORDER BY created_at DESC LIMIT 3;

-- SQL Server:
SELECT TOP(3) * FROM orders
WHERE user_id = 33
ORDER BY created_at DESC;


-- 2. Use DISTINCT to find out which states user_id 33 has shipped orders to.
SELECT DISTINCT ship_state FROM orders
WHERE user_id = 33;

