/*Question 1: What is the price of the cheapest item that Northwind sells?
	Answer: 2.5000*/
SELECT MIN(UnitPrice) AS 'Cheapest Item'
FROM northwind.products;

/*Question 2: What is the average price of items that Northwind sells?
	Answer: 28.86636364*/
SELECT AVG(UnitPrice) AS 'Average Price' FROM northwind.products;

/*Question 3: What is the price of the most expensive item that Northwind sells?
	Answer: 263.5000*/
SELECT MAX(UnitPrice) 'Most Expensive Item' FROM northwind.products;

/*Question 4: What is the sum of all the employee's salaries?
	Answer: 20,362.929931640625*/
SELECT SUM(Salary) AS 'Salary Total' FROM northwind.employees;

/*Question 5: Which employee makes the highest salary, and which employee makes the lowest?
	Answer: Max = Janet Leverling / Min = Steven Buchanan*/
SELECT FirstName, LastName, Salary FROM northwind.employees
WHERE Salary = (SELECT MIN(Salary) FROM northwind.employees)
OR Salary = (SELECT MAX(Salary) FROM northwind.employees);

/*Question 6: What is the supplier ID of each supplier and the number of items they supply? (You can
answer this query by only looking at the products table.)*/
SELECT northwind.products.SupplierID, northwind.suppliers.CompanyName, COUNT(northwind.products.ProductName) AS 'Product Supply Count' FROM northwind.products
JOIN northwind.suppliers ON northwind.products.SupplierID = northwind.suppliers.SupplierID
GROUP BY northwind.products.SupplierID
ORDER BY SupplierID ASC;

/*Question 7: What is the category ID of each category and the average price of each item in the
category? (You can answer this query by only looking at the products table.*/
SELECT products.CategoryID, categories.CategoryName, AVG(UnitPrice) AS 'Average Category Price' FROM northwind.products
JOIN northwind.categories ON northwind.products.CategoryID = northwind.categories.CategoryID
GROUP BY northwind.products.categoryID;

/*Question 8: For suppliers that provide at least 5 items to Northwind, what is the supplier ID of each
supplier and the number of items they supply? (Again, you can answer this query by
only looking at the products table.)*/
SELECT northwind.products.SupplierID, northwind.suppliers.CompanyName, COUNT(ProductID) AS 'Items Supplied per Supplier' FROM northwind.products
JOIN northwind.suppliers ON northwind.products.SupplierID = northwind.suppliers.SupplierID
GROUP BY SupplierID
HAVING COUNT('Items Supplied per Supplier') >= 5;

/*Question 9: List the product id, product name, and inventory value (calculated by multiplying unit
price by the number of units on hand). Sort the results in descending order by value. If
two or more have the same value, order by product name*/
SELECT northwind.products.ProductID, northwind.products.ProductName, northwind.products.UnitPrice * northwind.products.UnitsInStock AS 'Inventory Value' FROM northwind.products
ORDER BY 3 DESC, ProductName ASC;
