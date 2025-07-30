-- Self Join

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. Start by seeing the employee table:
--    SELECT * FROM employees;



-- 2. When we're done, we want to see 2 columns: 
--    one with the employee name and one with their manager's name
--    To get started... use 2 different table aliases to join on the 2 columns:
/*
      SELECT *
      FROM employees e
      JOIN employees m
      ON e.manager_id = m.emp_id;
*/



-- 3. Show only the 2 columns of info we want
--    And add column aliases to make the result set understandable:
/*
      SELECT 
         e.emp_name AS employee, 
         m.emp_name AS manager
      FROM employees e
      JOIN employees m
      ON e.manager_id = m.emp_id;
*/


