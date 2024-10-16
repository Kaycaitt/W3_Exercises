/*Question 1: What is the product name(s) of the most expensive products? HINT: Find the max price
in a subquery and then use that value to find products whose price equals that value.*/
SELECT ProductName, UnitPrice FROM northwind.products 
WHERE northwind.products.UnitPrice IN
(SELECT northwind.products.UnitPrice FROM
(SELECT DISTINCT northwind.products.unitprice FROM northwind.products 
ORDER BY northwind.products.UnitPrice DESC
LIMIT 3) AS top_3_prices)
ORDER BY northwind.products.UnitPrice DESC
LIMIT 3;

/*Question 2: What is the product name(s) and categories of the most expensive products? HINT:
Find the max price in a subquery and then use that in your more complex query that
joins products with categories.*/
SELECT northwind.products.ProductName, northwind.categories.CategoryName, northwind.products.UnitPrice FROM northwind.products 
JOIN northwind.categories ON northwind.products.CategoryID = northwind.categories.CategoryID
WHERE northwind.products.UnitPrice IN
(SELECT northwind.products.UnitPrice FROM
(SELECT DISTINCT northwind.products.unitprice FROM northwind.products 
ORDER BY northwind.products.UnitPrice DESC
LIMIT 3) AS top_3_prices)
ORDER BY northwind.products.UnitPrice DESC
LIMIT 3;

/*Question 3: What is the order id, shipping name and shipping address of all orders shipped via
"Federal Shipping"? HINT: Find the shipper id of "Federal Shipping" in a subquery and
then use that value to find the orders that used that shipper.*/
SELECT northwind.orders.OrderID, northwind.orders.ShipName, northwind.orders.ShipAddress, ShipVia FROM northwind.orders 
JOIN northwind.shippers ON northwind.orders.ShipVia = northwind.shippers.ShipperID
WHERE ShipVia IN
(SELECT ShipperID FROM northwind.shippers
WHERE northwind.shippers.CompanyName = 'Federal Shipping');

/*Question 4: What are the order ids of the orders that ordered "Sasquatch Ale"? HINT: Find the
product id of "Sasquatch Ale" in a subquery and then use that value to find the
matching orders from the 'order details' table. Because the 'order details' table has a
space in its name, you will need to surround it with back ticks in the FROM clause.*/
SELECT northwind.`order details`.OrderID, northwind.`order details`.ProductID, northwind.products.productname FROM northwind.`order details`
JOIN northwind.products ON northwind.`order details`.productid = northwind.products.productid
WHERE northwind.`order details`.ProductID IN
(SELECT northwind.`order details`.ProductID FROM northwind.`order details`
WHERE northwind.`order details`.ProductID = 34);

/*Question 5: What is the name of the employee that sold order 10266?*/ 
SELECT OrderID, northwind.employees.EmployeeID, concat(northwind.employees.FirstName, " ", northwind.employees.lastname) AS Full_Name FROM northwind.orders
JOIN northwind.employees ON northwind.orders.EmployeeID = northwind.employees.EmployeeID
WHERE OrderID IN
(SELECT OrderID FROM northwind.orders
WHERE OrderID = 10266);

/*Question 6: What is the name of the customer that bought order 10266?*/ 
SELECT OrderID, northwind.orders.CustomerID, northwind.customers.CompanyName FROM northwind.orders
JOIN northwind.customers ON northwind.orders.CustomerID = northwind.customers.CustomerID
WHERE OrderID IN
(SELECT OrderID FROM northwind.orders
WHERE northwind.orders.orderid = '10266');