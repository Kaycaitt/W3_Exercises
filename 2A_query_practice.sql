/*Question 1: Write a query to list the product id, product name, and unit price of every product that
Northwind sells. */
SELECT ProductID, ProductName, UnitPrice FROM products;

/*Question 2: What are the products that we carry where the unit price is $7.50 or less? */
SELECT ProductID, ProductName, UnitPrice FROM products
WHERE UnitPrice <= '7.50';

/*Question 3: What are the products that we carry where we have no units on hand, but 1 or more
units are on backorder?*/
SELECT * FROM products
WHERE UnitsInStock = '0' AND UnitsOnOrder >= '1'; 

/*Question 4: Examine the products table. How does it identify the type (category) of each item sold?
Write a query to list all the seafood items we carry. */

SELECT * FROM products
WHERE CategoryID = '8';

/*Question 5: What employees have "manager" in their titles?*/
SELECT * FROM employees
WHERE Title LIKE '%manager';

/*Question 6: Examine the products table. How do you know what supplier supplies each product?
Write a query to list all of the items that "Tokyo Traders" supplies to Northwind.*/

SELECT * FROM products
WHERE SupplierID = '4';