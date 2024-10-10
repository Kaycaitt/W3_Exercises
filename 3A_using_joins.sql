/*Question 1: List the product id, product name, unit price and category name of all products. Order
by category name and within that, by product name*/
SELECT ProductID, ProductName, UnitPrice, northwind.categories.CategoryName FROM northwind.products
INNER JOIN northwind.categories ON northwind.products.CategoryID = northwind.categories.CategoryID
ORDER BY CategoryName, ProductName;

/*Question 2: List the product id, product name, unit price and supplier name of all products that
cost more than $75. Order by product name*/
SELECT ProductID, ProductName, UnitPrice, northwind.suppliers.CompanyName FROM northwind.products
INNER JOIN northwind.suppliers ON northwind.products.SupplierID = northwind.suppliers.SupplierID
WHERE UnitPrice >= 75
ORDER BY ProductName;

/*Question 3: List the product id, product name, unit price, category name, and supplier name of
every product. Order by product name*/
SELECT ProductID, ProductName, UnitPrice, northwind.categories.CategoryName, northwind.suppliers.CompanyName AS 'Supplier Name' 
FROM northwind.products
JOIN northwind.categories ON northwind.products.CategoryID = northwind.categories.CategoryID
JOIN northwind.suppliers ON northwind.products.SupplierID = northwind.suppliers.SupplierID
ORDER BY ProductName;

/*Question 4: List the order id, ship name, ship address, and shipping company name of every order
that shipped to Germany*/
SELECT OrderID, ShipName, ShipAddress, northwind.shippers.CompanyName AS 'Shipping Company Name' 
FROM northwind.orders
JOIN northwind.shippers ON northwind.orders.shipvia = northwind.shippers.shipperid
WHERE ShipCountry = 'Germany'; 

/*Question 5: List the order id, order date, ship name, ship address of all orders that ordered
"Sasquatch Ale"*/
SELECT orders.orderid AS 'OrderID', OrderDate, ShipName, ShipAddress FROM northwind.orders
JOIN northwind.`order details` ON northwind.orders.orderid = northwind.`order details`.orderid
JOIN northwind.products ON northwind.`order details`.productid = northwind.products.productid
WHERE northwind.products.productname = 'Sasquatch Ale';