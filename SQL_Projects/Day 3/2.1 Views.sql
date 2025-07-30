-- Views

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. Query a View:
--    NOTE: We like to put 'view' in the name so it's clear that we're
--    using a view (rather than a table), but that's not required. 
--    Notice this is just like the users table, but missing the password column.

--    SELECT * FROM users_view;



-- 2. Filter the results from a View:
/*
      SELECT * FROM users_view
      WHERE user_state = 'ID';
*/


-- 3. Sort and limit the results from a View:
--    In PostgreSQL:
/*
      SELECT * FROM users_view
      ORDER BY created_at DESC
      LIMIT 5;
*/


--    In SQL Server:
/*
      SELECT TOP(5) * FROM users_view
      ORDER BY created_at DESC;
*/



-- 4. PostgreSQL Only: Query a Materialized View:
--    NOTE: We like to put 'mview' in the name so it's clear that we're using a 
--    materialized view (rather than a regular view or a table), but that's not required.

--    SELECT * FROM users_mview;




--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- 1. There's another view that gets the total each user has spent. 
--    Find that view and query it to see what you get.
SELECT * FROM total_spent_per_user_view tspuv 

-- 2. Filter that view to see only users with a gmail address.
SELECT * FROM total_spent_per_user_view tspuv
WHERE email LIKE '%@gmail.com'

