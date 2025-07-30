-- Aggregate Functions and ROUND

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. Using MAX and MIN:
--    SELECT MAX(price) FROM products;
--    SELECT MIN(price) FROM products;


-- 2. Using COUNT:
--    SELECT COUNT(*) FROM users;

--    NULL values are not counted:
--    SELECT COUNT(password) FROM users;

--    Count distinct values:
--    SELECT COUNT(DISTINCT user_state) FROM users;


-- 3. Using SUM:
--    SELECT SUM(price) FROM line_items;


-- 4. Using AVG:
--    SELECT AVG(price) FROM line_items;


-- 5. Using an alias to name the column:
--    SELECT AVG(price) AS "average price"
--    FROM line_items;


-- 6. Rounding to a whole number:
--    PostgreSQL:
--    SELECT AVG(price), ROUND( AVG(price) ) FROM line_items;

--    SQL Server: This rounds to a whole number, but you get trailing zeros:
--    SELECT AVG(price), ROUND( AVG(price), 0 ) FROM line_items;

--    SQL Server: This converts to a decimal number with no decimal places
--    (so it rounds up or down) to remove the trailing zeros:
--    SELECT AVG(price), CAST( AVG(price) AS DECIMAL(9,0) ) FROM line_items;
--    NOTE: DECIMAL(9,0) means the number can be up to 9 total digits 
--    (including left and right side of decimal point),
--    with 0 digits to the right of the decimal place.



-- 7. Rounding to 2 decimal places:
--    PostgreSQL:
--    SELECT AVG(price), ROUND( AVG(price), 2 ) FROM line_items;
--    SELECT AVG(price), CAST( AVG(price) AS MONEY ) FROM line_items;

--    SQL Server: This rounds to 2 decimal places, but you get trailing zeros:
--    SELECT AVG(price), ROUND( AVG(price), 2 ) FROM line_items;

--    SQL Server: This rounds 2 decimal places, with no trailing zeros:
--    SELECT AVG(price), CAST( AVG(price) AS DECIMAL(9,2) ) FROM line_items;



-- 8. Rounding Up & Down:
--    Round Down:
--    SELECT AVG(price), FLOOR( AVG(price) ) FROM line_items;

--    Round Up:
--    SELECT AVG(price), CEILING( AVG(price) ) FROM line_items;


-- 9. Round Down to 2 Decimal Places:
--    SELECT AVG(price), FLOOR( AVG(price) * 100 ) / 100 FROM line_items;

--    SQL Server Only: Remove the trailing zeros:
--    SELECT AVG(price), CAST( FLOOR( AVG(price) * 100 ) / 100 AS DECIMAL(9,2)) FROM line_items;


--    Round Up to 2 Decimal Places:
--    SELECT AVG(price), CEILING( AVG(price) * 100 ) / 100 FROM line_items;

--    SQL Server Only: Remove the trailing zeros:
--    SELECT AVG(price), CAST( CEILING( AVG(price) * 100 ) / 100 AS DECIMAL(9,2)) FROM line_items;



--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- 1. Find the total number of orders.
SELECT count(*) FROM orders;

-- 2. Find the average product price.
SELECT round(avg(price),2) FROM products p 

-- 3. Find the maximum product price that's NOT a lamp.
SELECT max(price) FROM products p 
WHERE NOT title LIKE '%lamp%';

-- 4. Find the number of users with a gmail email address.
SELECT count(*) FROM users u
WHERE email LIKE '%@gmail.com'

-- 5. Using the line_items table, find the total dollar value 
--    of all items with status 'returned'.
SELECT sum(price*quantity) FROM line_items li WHERE status='returned'

-- 6. Find the average price of all products containing the word 'hat' in their title.
SELECT avg(price) FROM products p
WHERE title ILIKE '%hat%'

----------------------------------------
-- EXTRA CREDIT: If you finish early.
----------------------------------------

-- 1. You can may use multiple aggregation functions in one SELECT.
--    Using only one query, find the MIN(), MAX(), and AVG() 
--    of the prices in the product table.
SELECT min(price), max(price), avg(price) FROM products p

-- 2. In one query, find the difference between the 
--    price of the most expensive and least expensive product.
SELECT min(price) AS MinPrice, max(price) AS MaxPrice, avg(price) AS AvgPrice FROM products p

SELECT max(price) - min(price) AS Diff FROM products p 
