-- GROUP BY with HAVING

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. Group by using a HAVING filter:
--    Find states that have 10 or more orders:
--    SELECT ship_state, COUNT(*)
--    FROM orders 
--    GROUP BY ship_state 
--    HAVING COUNT(*) >= 10;


--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
-- These use the jeopardy table in the game_shows database.
-- Remember to choose the game_shows database (or specify it in SQL Server)
--------------------------------------------------------

-- 1. Find the combined value of all questions for each show.
SELECT show_number, SUM(value) 
FROM jeopardy 
GROUP BY show_number;

-- 2. Add a HAVING clause to the last query to find the shows 
--    when all the questions had a combined value < 10,000
SELECT show_number, SUM(value) 
FROM jeopardy 
GROUP BY show_number
HAVING SUM(value) < 10000;

-- 3. Find the value of the highest-value question for each show.
SELECT show_number, MAX(value) 
FROM jeopardy 
GROUP BY show_number;

-- 4. Which shows had a question worth more than $2000?
SELECT show_number, MAX(value) 
FROM jeopardy 
GROUP BY show_number
HAVING MAX(value) > 2000;

----------------------------------------
-- EXTRA CREDIT: If you finish early.
----------------------------------------

--    To get the number of characters in a string:
--    In PostgreSQL: SELECT LENGTH(question) FROM jeopardy;
--    In SQL Server: SELECT LEN(question) FROM game_shows.dbo.jeopardy;

-- 1. Display the show_number and "average" question length (number of characters)
--    ordered from longest (on top) to shortest.
SELECT show_number, AVG(LENGTH(question)) AS avg_length
FROM jeopardy
GROUP BY show_number
ORDER BY avg_length DESC;

