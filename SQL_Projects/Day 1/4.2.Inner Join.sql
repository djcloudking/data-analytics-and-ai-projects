-- Inner Join
-- Inner Join


-- 1. Inner Join (or simply JOIN, which returns matching rows):
--    SELECT * FROM employees
--    JOIN departments 
--    ON employees.dept_id = departments.dept_id; 


-- 2. Using aliases to make the code more efficient:
--    SELECT * FROM employees e
--    JOIN departments d 
--    ON e.dept_id = d.dept_id; 


-- 3. Only including the columns you want:
--    SELECT emp_name, dept_name FROM employees e
--    JOIN departments d 
--    ON e.dept_id = d.dept_id;



-- 4. Using aliases for the column names:
--    NOTE: For columns that only exist in one table you don't need the table alias,
--    but adding the alias can make it clearer where the data comes from.
--    SELECT emp_name, dept_name, d.dept_id FROM employees e
--    JOIN departments d 
--    ON e.dept_id = d.dept_id; 


-- 5. Using a filter (to find all employees who work in sales):
--    SELECT emp_name, dept_name FROM employees e
--    JOIN departments d 
--    ON e.dept_id = d.dept_id
--    WHERE dept_name = 'Sales';


-- 6. Joining more than two tables.
--    SELECT * FROM users u
--    JOIN orders o ON u.user_id = o.user_id
--    JOIN line_items li ON o.order_id = li.order_id;


--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- Let's find the name and email of people who purchased a line_item worth $700 or more.
-- We'll walk you through building up the query over several steps.

-- 1. Select everything from the line_items table.
-- In the results, notice it contains the price and quantity, but not who ordered it.
SELECT *
FROM line_items;


-- 2. Join the line_items table to the orders table (on the order_id column)
-- In the results, notice you can now see price, quantity, and user_id.

-- Without Aliases
SELECT *
FROM line_items
JOIN orders ON line_items.order_id = orders.order_id;

-- With Aliases
SELECT *
FROM line_items li
JOIN orders o ON li.order_id = o.order_id;


-- 3. We want to get the user's name, so continuing with the previous query,
-- also join in the users table (on the user_id column).
-- In the results, notice you can now see the price, quantity, and name of the user.
SELECT *
FROM line_items li
JOIN orders o ON li.order_id = o.order_id
JOIN users u ON u.user_id  = o.user_id;


-- 4. Continuing with the previous query, filter the results to show 
-- just the name and email of people who had a line_item of $700 or more.
-- Don't forget that involves math for quantity times price.
SELECT name, email
FROM line_items li
JOIN orders o ON li.order_id = o.order_id
JOIN users u ON u.user_id  = o.user_id
WHERE price * quantity >= 700;
