--  Outer Join and NULL

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. Finding NULLS:
--    Find all employees who do NOT have a dept_id assigned:
--    SELECT * FROM employees
--    WHERE dept_id IS NULL;


--    Find all employees who have a dept_id assigned:
--    SELECT * FROM employees
--    WHERE dept_id IS NOT NULL;


-- 2. Empty strings vs NULL. Sometimes empty values can be stored either way!
--    Find all users who do NOT have a password because it's NULL):
--    SELECT * FROM users
--    WHERE password IS NULL;


--    Find all users who do NOT have a password because it's an empty string:
--    SELECT * FROM users
--    WHERE password = '';


--    Look for both empty strings and NULLs:
--    SELECT * FROM users
--    WHERE password = '' OR password IS NULL;



-- 3. Inner Join (or simply JOIN, gives matching data):
--    SELECT * FROM employees e
--    JOIN departments d
--    ON e.dept_id = d.dept_id; 


-- 4. Left (Outer) Join (gives matching & non-matching data):
--    SELECT * FROM employees e
--    LEFT JOIN departments d 
--    ON e.dept_id = d.dept_id; 


-- 5. Right (Outer) Join (same as left, but order of tables is swapped):
--    SELECT * FROM departments d
--    RIGHT JOIN employees e
--    ON e.dept_id = d.dept_id; 


-- 6. Full (Outer) Join:
--    SELECT * FROM employees e
--    FULL JOIN departments d
--    ON e.dept_id = d.dept_id;


--    Find departments that do not have employees in them:
--    SELECT * FROM employees e
--    FULL JOIN departments d
--    ON e.dept_id = d.dept_id
--    WHERE e.emp_id IS NULL;


--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- 1. Join the products table to the line_items table.
--    Choose a join that will KEEP products even if they don't have any associated line_items.
SELECT * FROM products
LEFT JOIN line_items li ON p.product_id = li.product_id;


-- 2. Were there any products with no orders? 
--    Query the joined table for rows with NULL quantity. 
SELECT * FROM products p
LEFT JOIN line_items li ON p.product_id = li.product_id
WHERE quantity IS NULL;


----------------------------------------
-- EXTRA CREDIT: If you finish early.
----------------------------------------

-- 1. Let's find the names of people who ordered something in a quantity of 5 or greater: 

--    A. First, join the tables.
--       Which kind of join is appropriate and which tables are you joining?
SELECT * FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN line_items li ON o.order_id = li.order_id;

--    B. Second, only show people who ordered something in a quantity of 5 or greater.
--       In the results, only display the name, email, and quantity
--       with the highest quantity at the top (also put the names in alphabetical order).
SELECT name, email, quantity FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN line_items li ON o.order_id = li.order_id
WHERE quantity >= 5
ORDER BY quantity DESC, name;