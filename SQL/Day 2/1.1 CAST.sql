-- CAST

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. CAST: Convert to whole number 
--    NOTE: SQL Server does not round up/down, it just deletes the decimal part
SELECT CAST(2.6 AS INT);



-- 2. CAST: Convert to a decimal
--    The decimal number below can be up to 9 total digits 
--    (including left and right side of decimal point),
--    with 2 digits to the right of the decimal place.
SELECT CAST('2.5897' AS DECIMAL(9,2));


--    Because SQL Server's CAST as INT does not round up/down, 
--    we can use a decimal data type, but with no decimal places.
SELECT CAST('2.5897' AS DECIMAL(9,0));



-- 3. CAST: Convert string to number
--    The show_number column is stored as a string.
--    Trying to do math with a string works in SQL Server, 
--    but in PostgreSQL results in an error:

--    PostgreSQL (You must choose the game_shows database before running this query):
--    SELECT show_number + 1
--    FROM jeopardy;

SELECT cast(show_number AS int) + 10 FROM jeopardy j 

--    SQL Server:
    SELECT TOP(200) show_number + 1
    FROM game_shows.dbo.jeopardy;

--    For PostgreSQL we need to convert the string 
--    into a whole number in order to do the math:
   SELECT CAST(show_number AS INT) + 1
   FROM jeopardy;


