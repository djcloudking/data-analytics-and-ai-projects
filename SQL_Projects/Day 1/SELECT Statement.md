## SELECT Statements

##### View entire table:

SELECT * FROM products;
 

##### Only 2 columns from table:

SELECT title, price FROM products;


##### The first 10 rows from table:

In PostgreSQL:

SELECT * FROM products LIMIT 10;

In SQL Server:

SELECT TOP(10) * FROM products;

**NOTE: TOP can also be written in an older syntax without parenthesis as TOP 10
but the parenthesis are the newer (and now preferred) syntax.**


##### Order by a column name or number: 

SELECT * FROM products ORDER BY price

SELECT title, price FROM products ORDER BY 2


##### Order by a column in descending order (large–small, Z–A, new–old):

SELECT * FROM products ORDER BY price DESC


##### Show only the tags for products:

SELECT tags FROM products;


##### Show distinct tags (do not show duplicates):

SELECT DISTINCT tags FROM products;

