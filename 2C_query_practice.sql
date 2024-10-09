/*Question 1: Write a query to list the product id, product name, and unit price of every product. This
time, display them in ascending order by price. */
SELECT ProductID, ProductName, UnitPrice FROM northwind.products
ORDER BY UnitPrice asc;

/*Question 2: What are the products that we carry where we have at least 100 units on hand? Order
them in descending order by price.*/
SELECT * FROM northwind.products WHERE UnitsInStock >= 100
ORDER BY UnitsInStock desc;

/*What are the products that we carry where we have at least 100 units on hand? Order
them in descending order by price. If two or more have the same price, list those in
ascending order by product name.*/
SELECT * FROM northwind.products
WHERE UnitsInStock >=100
ORDER BY UnitsInStock desc, ProductName ASC;

/*Question 4: Write a query against the orders table that displays the total number of distinct
customers who have placed orders, by customer ID*/ 
#need to come back to question#
SELECT DISTINCT CustomerID, COUNT(CustomerID) AS 'Number of Orders per ID' FROM northwind.orders
WHERE OrderDate IS NOT NULL
GROUP BY CustomerID;

/*Question 5: Write a query against the orders table that displays the total number of distinct
customers who have placed orders, by customer ID, for each country where orders
have been shipped*/
#need to come back to question#
SELECT DISTINCT CustomerID, ShipCountry, COUNT(CustomerID) AS 'Number of Orders per ID' FROM northwind.orders
WHERE OrderDate IS NOT NULL
GROUP BY CustomerID, ShipCountry;

/*Question 6: What are the products that we carry where we have no units on hand, but 1 or more
units of them are on backorder? Order them by product name*/
SELECT * FROM northwind.products
WHERE UnitsInStock =0 AND UnitsOnOrder >=1
ORDER BY ProductName;

/*Question 7: List the distinct job titles in employees.*/
SELECT DISTINCT Title FROM northwind.employees;

/*Question 8: What employees have a salary that is between $2000 and $2500? Order them by job
title.*/
SELECT * FROM northwind.employees
WHERE Salary BETWEEN 2000 AND 2500
ORDER BY Title;