-- Aggregate Window Functions

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. Look at the employees table (note the salary column):
--    SELECT emp_name, dept_id, salary FROM employees; 



-- 2. Aggregate Functions output a single value.
--    Here we find the total amount spent on salary:
--    SELECT SUM(salary) FROM employees;



-- 3. We use a window function to add the aggregate function as a column,
--    so it can be seen with the other columns of data:
/*
      SELECT
         emp_name, dept_id, salary,
         SUM(salary) OVER() AS total_salary
      FROM employees;
*/



-- 4. Like with aggregate functions, GROUP BY does not let us see the 
--    the other columns of data (just the groups).
/*
      SELECT
         dept_id,
         AVG(salary) AS avg_salary_by_dept
      FROM employees
      GROUP BY dept_id;
*/



-- 5. We can again use a window function (this time with PARTITION BY)
--    to show a aggregate function (per group) with the other columns of data:
/*
      SELECT 
         emp_name, dept_id, salary, 
         AVG(salary) OVER(PARTITION BY dept_id) AS avg_salary_by_dept
      FROM employees;
*/



-- 6. Window functions cannot be used in WHERE. 
--    The query below will give an error telling you that:
/*
      SELECT 
         emp_name, dept_id, salary, 
         AVG(salary) OVER(PARTITION BY dept_id) AS avg_salary_by_dept
      FROM employees
      WHERE AVG(salary) OVER(PARTITION BY dept_id) > 100000;
*/



-- 7. Putting the window function into a subquery lets us use WHERE:
/*
      SELECT * FROM (
         SELECT 
            emp_name, dept_id, salary, 
            AVG(salary) OVER(PARTITION BY dept_id) AS avg_salary_by_dept
         FROM employees
      ) as w
      WHERE avg_salary_by_dept > 100000;
*/




--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

--    In subqueries we saw how to find jeopardy questions   
--    with the highest point value. That required a join, 
--    but now we can do it more easily with window functions.

--    To review, below is how we found highest point value for each Jeopardy show.
--    Remember to target the game_shows database before running these queries!
/*
      SELECT show_number, MAX(value) AS max_value
      FROM jeopardy
      GROUP BY show_number
      ORDER BY show_number;
*/



--    Step 1: Use a window function to add a column to the jeopardy table for 
--    the MAX(value) for each show_number:
SELECT *,
   MAX(value) OVER(PARTITION BY show_number) AS max_value
FROM jeopardy;


--    Step 2: Only show rows where the value equals the max value added
--    by the window function. NOTE: You'll have to put the query from step 1
--    into a subquery so you can use WHERE to find those matches.
SELECT * FROM (
   SELECT *,
      MAX(value) OVER(PARTITION BY show_number) AS max_value
   FROM jeopardy
) as m
WHERE value = max_value;




