-- CASE

-------------------------------------------------------------------
-- WARMUPS & REFERENCE
-------------------------------------------------------------------

-- 1. Conditional (If you do not have an else, SQL will use null):
/*
      SELECT title, price,
         CASE
            WHEN price < 20 THEN 'cheap'
            WHEN price < 50 THEN 'moderate'
            ELSE 'expensive'
         END
      FROM products;
*/


-- 2. Conditional with a column alias:
/*
      SELECT title, price,
         CASE
            WHEN price < 20 THEN 'cheap'
            WHEN price < 50 THEN 'moderate'
            ELSE 'expensive'
         END AS pricing -- gives the column an alias named pricing
      FROM products;
*/



-- 3. Conditional with ORDER BY:
/*
      SELECT title, price,
         CASE
            WHEN price < 20 THEN 'cheap'
            WHEN price < 50 THEN 'moderate'
            ELSE 'expensive'
         END AS pricing
      FROM products
      ORDER BY pricing;
*/



-- 4. Conditional with GROUP BY:
--    PostgreSQL:
/*
      SELECT -- remove title & price so we can count the groups
         CASE
            WHEN price < 20 THEN 'cheap'
            WHEN price < 50 THEN 'moderate'
            ELSE 'expensive'
         END AS pricing,
         COUNT(*)
      FROM products
      GROUP BY pricing;
*/


--    SQL Server:
--    Unlike in PostgreSQL, you can't use an alias in the GROUP BY
--    So one option is to repeat the CASE
/*
      SELECT -- remove title & price so we can count the groups
         CASE
            WHEN price < 20 THEN 'cheap'
            WHEN price < 50 THEN 'moderate'
            ELSE 'expensive'
         END AS pricing,
         COUNT(*)
      FROM products
      GROUP BY
         CASE
            WHEN price < 20 THEN 'cheap'
            WHEN price < 50 THEN 'moderate'
            ELSE 'expensive'
         END
      ;
*/


--   SQL Server Alternate Method (also works in PostgreSQL, but it's not the easiest way)
--   Step 1: Create the table and join it to the products table with a subquery:
/*
      SELECT *
      FROM products p 
      JOIN (
         SELECT
            CASE
               WHEN price < 20 THEN 'cheap'
               WHEN price < 50 THEN 'moderate'
               ELSE 'expensive'
            END AS pricing,
            product_id
         FROM products
      ) c 
      ON p.product_id = c.product_id;
*/


--   Step 2: Add the aggregate function (COUNT) and GROUP BY
/*
      SELECT pricing, COUNT(*) AS count
      FROM products p 
      JOIN (
         SELECT
            CASE
               WHEN price < 20 THEN 'cheap'
               WHEN price < 50 THEN 'moderate'
               ELSE 'expensive'
            END AS pricing,
            product_id
         FROM products
      ) c 
      ON p.product_id = c.product_id
      GROUP BY pricing;
*/



-- 5. Example of simplified case:
--    STEP 1: Notice 'gray' and 'grey' appear as 2 groups
/*
      SELECT tags, COUNT(*)
      FROM products
      GROUP BY tags
      ORDER BY 1; -- 1 means first column
*/

--    STEP 2: Change grey to gray (so they get combined into one group)
--    PostgreSQL:
/*
      SELECT 
         CASE tags 
            WHEN 'grey' THEN 'gray'
            ELSE tags
         END AS fixed_tags, 
         COUNT(*) 
      FROM products
      GROUP BY fixed_tags
      ORDER BY fixed_tags;
*/

--    SQL Server:
/*
      SELECT 
         CASE tags 
            WHEN 'grey' THEN 'gray'
            ELSE tags
         END, 
         COUNT(*) 
      FROM products
      GROUP BY 
         CASE tags 
            WHEN 'grey' THEN 'gray'
            ELSE tags
         END
      ORDER BY 1; -- 1 means first column
*/



-- 6. SQL Server Only: IIF (Inline IF)
--    IIF is like a simplified CASE with only 2 possible outcomes
/*
      SELECT title, price,
         IIF( price < 40, 'cheap', 'expensive') AS pricing
      FROM products;
*/


--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above.
--------------------------------------------------------

-- 1. Write a conditional that will categorize each order as
--    'West Coast' (if it was shipped to CA, OR, or WA) or 'Other'
SELECT ship_state,
   CASE 
      WHEN ship_state IN ('CA', 'OR', 'WA') THEN 'West Coast'
      ELSE 'Other'
   END AS Region
FROM orders;


-- 2. Modify the last query with a GROUP BY statement, to find
--    the number of orders shipped to West Coast states vs Others.
SELECT
   CASE 
      WHEN ship_state IN ('CA', 'OR', 'WA') THEN 'West Coast'
      ELSE 'Other'
   END AS Region,
   COUNT(*)
FROM orders
GROUP BY Region;


-- 3. Write a conditional to divide users into 3 groups, based on their created_at: 
--    early for accounts created in 2019 (the entire year) or prior
--    middle for accounts created in 2020 (the entire year)
--    late for accounts created in 2021 or later
SELECT
   CASE 
      WHEN DATE_PART('year', created_at) <= '2019' THEN 'early'
      WHEN DATE_PART('year', created_at)  = '2020' THEN 'middle'
      ELSE 'late'
   END AS user_type
FROM users;

-- 4. We want to count the number of orders made by each group in the query above.
--    The users table doesn't have order info, so the first step is to 
--    modify the query above and join in the orders table.
--    You will not see the newly joined data because we're only showing the CASE column,
--    but you'll need it the step below when we group the data.
--    NOTE: Because created_at exists in both tables, you'll need to
--    prefix the table name or alias (example: users.created_at)
SELECT
   CASE 
      WHEN DATE_PART('year', u.created_at) <= '2019' THEN 'early'
      WHEN DATE_PART('year', u.created_at)  = '2020' THEN 'middle'
      ELSE 'late'
   END AS user_type
FROM users AS u
JOIN orders AS o
ON u.user_id = o.user_id;

-- 5. Modify the query above, adding a GROUP BY to find which 
--    group of users made more orders: early, middle, or late.
SELECT
   CASE
      WHEN DATE_PART('year', u.created_at) <= '2019' THEN 'early'
      WHEN DATE_PART('year', u.created_at)  = '2020' THEN 'middle'
      ELSE 'late'
   END AS user_type,
   COUNT(*)
FROM users AS u
JOIN orders AS o
ON u.user_id = o.user_id
GROUP BY user_type;

----------------------------------------
-- EXTRA CREDIT: If you finish early.
----------------------------------------

-- 1. Get the number of orders on weekdays or weekends (per state they were shipped to).
--    Reminder for PostgreSQL: The day of week is numbered Sunday as 0, Saturday as 6.
--    Reminder for SQL Server: The day of week is numbered Sunday as 1, Saturday as 7.


