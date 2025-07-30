-- User-Defined Functions

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. Use a Scalar-Valued Function (returns a single value) by itself:
--    PostgreSQL:
--    SELECT fn_get_user_total_spent(99);
--    SELECT fn_get_user_total_spent(50);


--    SQL Server: 
--    SELECT dbo.fn_get_user_total_spent(99);
--    SELECT dbo.fn_get_user_total_spent(50);




-- 2. Use a Scalar-Valued Function in a SELECT:
--    PostgreSQL:
--    SELECT fn_get_highest_priced_product();

--    SELECT * FROM line_items
--    WHERE price = fn_get_highest_priced_product();


--    SQL Server: 
--    SELECT dbo.fn_get_highest_priced_product();

--    SELECT * FROM line_items
--    WHERE price = dbo.fn_get_highest_priced_product();




-- 3. Use a Table-Valued Function (returns a table):
-- This function returns a table, so query it like a table.
--    SELECT * FROM fn_get_user_totals(99);
--    SELECT * FROM fn_get_user_totals(50);

