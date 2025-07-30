-- GROUP BY

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. Grouping by one column: 
--    SELECT ship_state, COUNT(*) 
--    FROM orders
--    GROUP BY ship_state;


-- 2. Grouping by multiple columns:
--    SELECT ship_state, ship_zipcode, COUNT(*)
--    FROM orders
--    GROUP BY ship_state, ship_zipcode
--    ORDER BY ship_state;


-- 3. Grouping by multiple columns, only using the first 5 digits in zipcode:
--    LEFT() accepts 2 parameters: the string, how many characters you want
--    SELECT ship_state, LEFT(ship_zipcode,5), COUNT(*)
--    FROM orders
--    GROUP BY ship_state, LEFT(ship_zipcode,5)
--    ORDER BY ship_state;


--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- 1. When was the most recent order made in each state?
SELECT ship_state, MAX(created_at) 
FROM orders
GROUP BY ship_state;

-- 2. Use the line_items table to find the total number of each product_id sold.
--    Make sure you exclude returned and canceled from your results.
SELECT product_id, SUM(quantity) AS total_sold
FROM line_items
WHERE status NOT IN ('returned', 'canceled')
GROUP BY product_id
ORDER BY total_sold DESC;

-- 3. Use the line_items table to see the total dollar amount of items in each status (returned, shipped, etc.)
SELECT status, SUM(price * quantity)
FROM line_items
GROUP BY status;

-- 4. In the products table, find how many products are in each set of tags.
SELECT tags, COUNT(*)
FROM products
GROUP BY tags;

-- 5. Modify the previous query to find how many products over $70 are in each set of tags.
SELECT tags, COUNT(*)
FROM products
WHERE price > 70
GROUP BY tags;

-- 6. Use the orders table to find out how many orders each user made.
SELECT user_id, COUNT(*)
FROM orders
GROUP BY user_id;


----------------------------------------
-- EXTRA CREDIT: If you finish early.
----------------------------------------

-- REMINDER: Use DATE_PART() in PostgreSQL or DATEPART() in SQL Server

-- 1. Use DATE PART to extract which calendar month each user was created in.
SELECT DATE_PART('month', created_at) 
FROM users;

-- 2. Use DATE PART and a GROUP BY statement to count how many users were created in each calendar month.
SELECT DATE_PART('month', created_at), COUNT(*)
FROM users
GROUP BY date_part
ORDER BY date_part;

-- 3. Use DATE PART to find the number of users created during each day of the week.
SELECT DATE_PART('month', created_at), COUNT(*)
FROM users
GROUP BY date_part
ORDER BY date_part;