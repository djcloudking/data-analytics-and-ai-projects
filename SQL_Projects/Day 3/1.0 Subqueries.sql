--  Subqueries

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. Single-value subquery:
--    SELECT * FROM line_items 
--    WHERE price = (SELECT MAX(price) FROM products);



-- 2. Multiple-value subquery:
--    SELECT * FROM orders 
--    WHERE user_id IN (
--       SELECT user_id FROM users
--       WHERE email LIKE '%@gmail.com'
--    );



-- 3. Table-value subquery:

--    Step 1: Find the highest point value for each Jeopardy show.
--    Remember to target the game_shows database before running these queries!
/*
      SELECT show_number, MAX(value) AS max_value
      FROM jeopardy
      GROUP BY show_number;
*/



--    Step 2: Now we can get the actual questions with the max point values we found.
--    Join the results table above with the jeopardy table.
--    Notice this joins on 2 sets of columns!
/*
      SELECT *
      FROM jeopardy j
      JOIN (
         SELECT show_number, MAX(value) AS max_value
         FROM jeopardy
         GROUP BY show_number
      ) AS m 
      ON j.show_number = m.show_number AND value = max_value
      ORDER BY j.show_number;
*/



--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- 1. Select the products that cost more than average (use a subquery).
SELECT * FROM products p 
WHERE price > (
               SELECT avg(price) FROM products p 
               )

-- 2. Find line_items that represent orders for the lowest-priced product.
SELECT * FROM line_items li 
WHERE price = (SELECT min(price) FROM products p 

-- 3. Find employees who earn more than the average salary of all employees.
--    When calculating average salary, exclude the highest salary (which skews it too high).
SELECT * FROM employees e 
WHERE salary > (SELECT avg(salary) FROM employees e 
				WHERE salary <> (
				                SELECT max(salary) FROM employees e)) 