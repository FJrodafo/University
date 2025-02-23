## Índice

1. [Prepara la base de datos](#prepara-la-base-de-datos)
2. [Northwind](#northwind)
3. [Consultas](#consultas)
4. [Consultas, borrado, actualización, etc](#consultas-borrado-actualización-etc)
5. [Subconsultas](#subconsultas)

## Prepara la base de datos

Importa la base de datos "Northwind" con el siguiente comando:

```shell
mysql -h 127.0.0.1 -P 3306 -u root -p < /home/user/Documents/path/to/northwind.sql
```

Exporta la base de datos "Northwind" con el siguiente comando:

```shell
mysqldump -h 127.0.0.1 -P 3306 -u root -p northwind > /home/user/Documents/path/to/northwind.sql
```

Inicia sesión en MySQL con el usuario root:

```shell
mysql -h 127.0.0.1 -P 3306 -u root -p
```

Muestra todos los usuarios que existen en tu sistema con el siguiente comando:

```sql
SELECT user, host FROM mysql.user;
```

Muestra los privilegios que tengan los usuarios con el siguiente comando:

```sql
SHOW GRANTS FOR 'fjrodafo'@'localhost';
```

Concede todos los permisos a los usuarios que necesiten manejar esta base de datos con el siguiente comando:

```sql
GRANT ALL PRIVILEGES ON northwind.* TO 'fjrodafo'@'localhost';
```

Revoca todos los permisos a los usuarios que tengan todos los permisos en esta base de datos con el siguiente comando:

```sql
REVOKE ALL PRIVILEGES ON northwind.* FROM 'fjrodafo'@'localhost';
```

## Northwind

```sql
CREATE DATABASE northwind;
USE `northwind`;

CREATE TABLE categories (
    `CategoryID` TINYINT(5) AUTO_INCREMENT,
    `CategoryName` VARCHAR(15),
    `Description` MEDIUMTEXT,
    `Picture` VARCHAR(50),
    PRIMARY KEY (`CategoryID`),
    UNIQUE KEY `unique_categories_category_name` (`CategoryName`)
);

CREATE TABLE customers (
    `CustomerID` VARCHAR(5),
    `CompanyName` VARCHAR(40),
    `ContactName` VARCHAR(30),
    `ContactTitle` VARCHAR(30),
    `Address` VARCHAR(60),
    `City` VARCHAR(15),
    `Region` VARCHAR(15),
    `PostalCode` VARCHAR(10),
    `Country` VARCHAR(15),
    `Phone` VARCHAR(24),
    `Fax` VARCHAR(24),
    PRIMARY KEY (`CustomerID`),
    KEY `key_customers_company_name` (`CompanyName`),
    KEY `key_customers_city` (`City`),
    KEY `key_customers_region` (`Region`),
    KEY `key_customers_postalcode` (`PostalCode`)
);

CREATE TABLE employees (
    `EmployeeID` INT(10) AUTO_INCREMENT,
    `LastName` VARCHAR(20),
    `FirstName` VARCHAR(10),
    `Title` VARCHAR(30),
    `TitleOfCourtesy` VARCHAR(25),
    `BirthDate` DATETIME,
    `HireDate` DATETIME,
    `Address` VARCHAR(60),
    `City` VARCHAR(15),
    `Region` VARCHAR(15),
    `PostalCode` VARCHAR(10),
    `Country` VARCHAR(15),
    `HomePhone` VARCHAR(24),
    `Extension` VARCHAR(4),
    `Photo` VARCHAR(50),
    `Notes` MEDIUMTEXT,
    `ReportsTo` INT(10),
    PRIMARY KEY (`EmployeeID`),
    KEY `key_employees_lastname` (`LastName`),
    KEY `key_employees_postalcode` (`PostalCode`),
    KEY `key_ReportsTo` (`ReportsTo`),
    CONSTRAINT `fk_employees_reports_to` FOREIGN KEY (`ReportsTo`) REFERENCES `employees` (`EmployeeID`)
);

CREATE TABLE order_details (
    `ID` INT(10) AUTO_INCREMENT,
    `OrderID` INT(10),
    `ProductID` INT(10),
    `UnitPrice` DOUBLE,
    `Quantity` SMALLINT(5),
    `Discount` FLOAT,
    PRIMARY KEY (`ID`),
    UNIQUE KEY `unique_order_id_product_id` (`OrderID`,`ProductID`),
    KEY `fk_order_details_product_id` (`ProductID`),
    CONSTRAINT `fk_order_details_order_id` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
    CONSTRAINT `fk_order_details_product_id` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
);

CREATE TABLE orders (
    `OrderID` INT(10) AUTO_INCREMENT,
    `CustomerID` VARCHAR(5),
    `EmployeeID` INT(10),
    `OrderDate` DATETIME,
    `RequiredDate` DATETIME,
    `ShippedDate` DATETIME,
    `ShipVia` INT(10),
    `Freight` DOUBLE,
    `ShipName` VARCHAR(40),
    `ShipAddress` VARCHAR(60),
    `ShipCity` VARCHAR(15),
    `ShipRegion` VARCHAR(15),
    `ShipPostalCode` VARCHAR(10),
    `ShipCountry` VARCHAR(15),
    PRIMARY KEY (`OrderID`),
    KEY `fk_orders_customer_id` (`CustomerID`),
    KEY `fk_orders_employee_id` (`EmployeeID`),
    KEY `fk_orders_ship_via` (`ShipVia`),
    KEY `key_orders_shipped_date` (`ShippedDate`),
    KEY `key_orders_ship_postal_code` (`ShipPostalCode`),
    CONSTRAINT `fk_orders_customer_id` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
    CONSTRAINT `fk_orders_employee_id` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
    CONSTRAINT `fk_orders_ship_via` FOREIGN KEY (`ShipVia`) REFERENCES `shippers` (`ShipperID`)
);

CREATE TABLE products (
    `ProductID` INT(10) AUTO_INCREMENT,
    `ProductName` VARCHAR(40),
    `SupplierID` INT(10),
    `CategoryID` TINYINT(5),
    `QuantityPerUnit` VARCHAR(20),
    `UnitPrice` DOUBLE,
    `UnitsInStock` SMALLINT(5),
    `UnitsOnOrder` SMALLINT(5),
    `ReorderLevel` SMALLINT(5),
    `Discontinued` ENUM('y','n'),
    PRIMARY KEY (`ProductID`),
    KEY `fk_products_category_id` (`CategoryID`),
    KEY `fk_products_supplier_id` (`SupplierID`),
    KEY `key_products_product_name` (`ProductName`),
    CONSTRAINT `fk_products_category_id` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`),
    CONSTRAINT `fk_products_supplier_id` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`)
);

CREATE TABLE shippers (
    `ShipperID` INT(10) AUTO_INCREMENT,
    `CompanyName` VARCHAR(40),
    `Phone` VARCHAR(24),
    PRIMARY KEY (`ShipperID`)
);

CREATE TABLE suppliers (
    `SupplierID` INT(10) AUTO_INCREMENT,
    `CompanyName` VARCHAR(40),
    `ContactName` VARCHAR(30),
    `ContactTitle` VARCHAR(30),
    `Address` VARCHAR(60),
    `City` VARCHAR(15),
    `Region` VARCHAR(15),
    `PostalCode` VARCHAR(10),
    `Country` VARCHAR(15),
    `Phone` VARCHAR(24),
    `Fax` VARCHAR(24),
    `HomePage` VARCHAR(255),
    PRIMARY KEY (`SupplierID`),
    KEY `key_suppliers_product_name` (`CompanyName`),
    KEY `key_suppliers_postal_code` (`PostalCode`)
);
```

## Consultas

```sql
-- Obtener...

SELECT *
FROM categories
WHERE `Description` = 'Cheeses';

SELECT
    CategoryID AS IDconsulta,
    CategoryName AS NombreCategoria
FROM categories
WHERE `Description` LIKE '%teas, beers%' AND CategoryName LIKE '%a%';
```

```sql
-- Obtener los distintos puestos de trabajo

SELECT DISTINCT Title
FROM employees;
```

```sql
-- Obtener los distintos puestos de trabajo y contar cuantas veces aparece cada uno

SELECT
    COUNT(Title) AS Count,
    Title
FROM employees
GROUP BY Title;
```

```sql
-- Obtener los subordinados del empleado número 5

SELECT EmployeeID, LastName, FirstName
FROM employees
WHERE ReportsTo = 5;
```

```sql
-- Ordenar los empleados según su antigüedad en la empresa

SELECT EmployeeID, LastName, FirstName, HireDate
FROM employees
ORDER BY HireDate ASC;
```

```sql
-- Ordenar los empleados según su antigüedad en la empresa invertido

SELECT EmployeeID, LastName, FirstName, HireDate
FROM employees
ORDER BY HireDate DESC;
```

```sql
-- Obtener los datos de las empleadas solteras de la empresa

SELECT EmployeeID, LastName, FirstName
FROM employees
WHERE TitleOfCourtesy = 'Mrs.';
```

```sql
-- Obtener el número de pedidos que se hizo en el año 1997

SELECT COUNT(*) AS NumeroPedidos
FROM orders
WHERE YEAR(OrderDate) = 1997;

SELECT COUNT(*) AS NumeroPedidos
FROM orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31';

SELECT COUNT(*) AS NumeroPedidos
FROM orders
WHERE OrderDate >= '1997-01-01' AND OrderDate <= '1997-12-31';
```

```sql
-- Obtener el número de pedidos que se hizo en el mes de junio de ese año

SELECT COUNT(*) AS NumeroPedidos
FROM orders
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 6;

SELECT COUNT(*) AS NumeroPedidos
FROM orders
WHERE OrderDate BETWEEN '1997-06-01' AND '1997-06-30';

SELECT COUNT(*) AS NumeroPedidos
FROM orders
WHERE OrderDate >= '1997-06-01' AND OrderDate <= '1997-06-30';
```

```sql
-- Obtener el número de empleados estadounidenses de la empresa

SELECT COUNT(*) AS EmployeeID
FROM employees
WHERE Country = 'USA';
```

```sql
-- Obtener los diferentes precios a los que se ha vendido el queso cabrales (ProductID = 11)

SELECT DISTINCT UnitPrice
FROM order_details
WHERE ProductID = 11;
```

```sql
-- Obtener los proveedores franceses

SELECT SupplierID, ContactName
FROM suppliers
WHERE Country = 'France';
```

```sql
-- Obtener la cantidad de queso de cabrales que se ha pedido en total (ProductID = 11)

SELECT SUM(Quantity) AS QuesoCabrales
FROM order_details
WHERE ProductID = 11;
```

```sql
-- Ordenar los productos de mayor a menor cantidad solicitada en total

SELECT p.ProductID, p.ProductName,
    SUM(od.Quantity) AS TotalCantidadSolicitada
FROM products p
JOIN order_details od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalCantidadSolicitada DESC;
```

```sql
-- Mostrar la cuantía total de cada pedido ordenado de mayor a menor junto con la fecha y el nombre del cliente que lo hizo

-- Obviando el descuento
SELECT ROUND(SUM(UnitPrice * Quantity), 2) AS CuantiaTotal
FROM order_details
GROUP BY OrderID;

-- Incluye el descuento, la fecha y el nombre del cliente
SELECT o.OrderID, o.OrderDate,
    c.CompanyName AS NombreCliente,
    ROUND(SUM(od.UnitPrice * od.Quantity - od.Discount), 2) AS CantidadTotal
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
JOIN order_details od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, o.OrderDate, c.CompanyName
ORDER BY CantidadTotal DESC;
```

```sql
-- Se desea saber cuáles son los 5 mejores clientes de nuestra compañía. Entendiéndose por mejores clientes aquellas empresas que nos han dejado más dinero (los clientes que la cuantía que suman todos sus pedidos sea la mayor)

SELECT c.CustomerID, c.CompanyName,
    ROUND(SUM(od.UnitPrice * od.Quantity - od.Discount), 2) AS CantidadTotal
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
JOIN order_details od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
ORDER BY CantidadTotal DESC
LIMIT 5;
```

```sql
-- ¿De qué país tenemos más clientes?

SELECT Country,
    COUNT(*) AS NumeroClientes
FROM customers
GROUP BY Country
ORDER BY NumeroClientes DESC
LIMIT 1;
```

```sql
-- Obtener la edad que tenía cada empleado al entrar en la empresa

SELECT EmployeeID, LastName, FirstName,
    DATEDIFF(HireDate, BirthDate) / 365 AS EdadContratacion
FROM employees;
```

```sql
-- Calcular ahora la edad media a la que un empleado entra en la empresa

SELECT AVG(DATEDIFF(HireDate, BirthDate) / 365) AS EdadMediaContratacion
FROM employees;
```

```sql
-- Saber cuántos pedidos ha llevado cada transportista

SELECT ShipVia,
    COUNT(*) AS NumeroPedidos
FROM orders
GROUP BY ShipVia;
```

```sql
-- Mostrar el ID de los empleados que tengan a otros empleados a su cargo

SELECT EmployeeID, LastName, FirstName
FROM employees
WHERE EmployeeID IN (
    SELECT DISTINCT ReportsTo
    FROM employees
);
```

```sql
-- Mostrar los pedidos que deben ser enviados fuera de USA

SELECT OrderID, ShipCountry
FROM orders
WHERE ShipCountry != 'USA'
ORDER BY ShipCountry;
```

```sql
-- Mostrar los pedidos que aún no se han enviado

SELECT OrderID, ShippedDate
FROM orders
WHERE ShippedDate IS NULL;
```

```sql
-- ¿Qué productos de los que ya no se va a seguir trabajando con ellos tenía un precio más alto?

SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE Discontinued = 'y'
ORDER BY UnitPrice DESC
LIMIT 1;
```

```sql
-- Obtener los nombre de los productos que sean quesos

SELECT ProductName
FROM products
WHERE ProductName LIKE '%queso%';
```

```sql
-- Ordenar los productos del más caro al más barato precio por unidad

SELECT ProductName, UnitPrice
FROM products
ORDER BY UnitPrice DESC;
```

```sql
-- Obtener cuántos proveedores distintos suministran actualmente quesos a la empresa (categoría 4)

SELECT
```

```sql
-- Todos los productos tienen una cantidad llamada "reorderlevel" que si el stock baja de esa cifra se debe solicitar del proveedor que reponga el producto. Detectar que productos hay que solicitar a su proveedor que reponga. Tener en cuenta que ya hay productos a los que se les ha detectado que precisan de reposición y se le ha solicitado a su proveedor que traiga una cantidad de ese producto. Eso lo vemos en el campo "UnitsOnOrder" que nos dice la cantidad de producto que se ha solicitado reponer

SELECT
```

```sql
-- Empleados contratados en 1993

SELECT
```

```sql
-- Un cliente quiere presentar una reclamación por la actuación de uno de los empleados de la empresa Lo único que recuerda del empleado es que le dijo que el nombre de su calle decía algo de "Winchester". Buscar los empleados que pueden coincidir para la reclamación

SELECT
```

```sql
-- Se desea saber que empleados van a cumplir años en el próximo mes de julio

SELECT * FROM employees WHERE MONTH(BirthDate) = 7;
```

```sql
-- Un cliente puede desear enviar un pedido a un sitio o persona distinto de su nombre de empresa. Obtener los nombres de envío que no coinciden con el nombre de la compañía cliente

SELECT ShipName, customers.CompanyName
FROM orders
JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE ShipName <> customers.CompanyName;
```

```sql
-- Se va a enviar una carta comercial a las distintas personas que se tiene como contacto en las empresas clientes. Se quiere hacer una carta personalizada según el tipo de puesto de trabajo que ocupen esas personas. Se desea saber cuántas cartas se debe hacer para cada uno de esos tipos de puestos de trabajo

SELECT ContactTitle, COUNT(*) AS TotalCartas FROM customers GROUP BY ContactTitle;
```

```sql
-- Se desea saber cual es el pedido en el que ha solicitado mayor cantidad de productos distintos

SELECT OrderID, COUNT(DISTINCT ProductID) AS Cantidad FROM order_details
GROUP BY OrderID ORDER BY Cantidad DESC
LIMIT 1;
```

```sql
-- Se desea saber cual es el  producto ( ProductID) que más veces se ha solicitado

SELECT
```

```sql
-- Se desea saber que pedido ha tenido una reducción de precio mayor por los descuentos aplicados

SELECT
```

```sql
-- Se desea saber que productos tienen el mismo precio

SELECT
```

```sql
-- Mostrar los paises donde tenemos como mínimo 3 proveedores

SELECT
```

```sql
-- Mostrar en que meses del año 1997 se hicieron menos de 30 pedidos

SELECT
```

## Consultas, borrado, actualización, etc

```sql
-- Crear una nueva tabla llamada prueba con los empleados que tengan nombre que comience por letra A

SELECT
```

```sql
-- Crear una copia de la tabla productos Que se llame prueba2

SELECT
```

```sql
-- Incrementar el precio de los productos un 10% si su precio actual es mayor de 80 en la tabla prueba2

SELECT
```

```sql
-- Sin borrar los registros de la tabla prueba2 hacer una consulta que en el caso que el precio sea diferente en las dos tablas ponga en prueba2 el precio que aparece en products

SELECT
```

```sql
-- Hacer que los empleados de UK se queden sin jefe establecido (hacer esto en una tabla llamada prueba que sea una copia de employees)

SELECT
```

```sql
-- Ahora borrar todos los empleados que no tengan jefes en prueba

SELECT
```

## Subconsultas

```sql
-- Se desea identificar aquellos productos que nunca han sido incluidos en ningún pedido:

SELECT *
FROM order_details
RIGHT JOIN products ON products.ProductID = order_details.ProductID
WHERE order_details.OrderID IS NULL;

SELECT *
FROM products
WHERE ProductID NOT IN (
    SELECT DISTINCT(ProductID)
    FROM order_details
);
```

```sql
-- El precio medio de los productos

SELECT AVG(UnitPrice) AS PrecioMedio FROM products;

SELECT SUM(UnitPrice) AS PrecioMedio,
    COUNT(DISTINCT(ProductID)) AS CantidadProductos
FROM products;

SELECT SUM(UnitPrice) / (SELECT COUNT(DISTINCT(ProductID)) FROM products) AS PrecioMedio
FROM products;
```

```sql
-- Mostrar todas las categorias y en cada fila además de la categoría mostrar el nombre del producto con el precio más alto de esa categoría (también mostrar el precio de ese producto)

SELECT
```

```sql
-- Obtener una lista de empleados junto con el total de ventas de sus pedidos, donde se incluyan solo aquellos empleados que hayan vendido más que la media

SELECT employees.EmployeeID, employees.LastName, employees.FirstName, COUNT(*) AS TotalPedidos
FROM employees
INNER JOIN orders ON employees.EmployeeID = orders.EmployeeID
GROUP BY employees.EmployeeID
HAVING TotalPedidos >= (
    SELECT COUNT(*) / (SELECT COUNT(*) FROM employees)
    FROM orders
);
```

```sql
-- Obtener por cada jefe su subordinado que tenga más antigüedad

SELECT
```

```sql
-- Nosotros podemos calcular y obtener la cantidad mínima de productos que hay de todas las categorías. Se quiere que se muestren todas las categorías que coincidan con esa cantidad mínima

SELECT
```

```sql
-- Obtener por cada ciudad de destino  el/los pedido más reciente ( se mostrarán varios pedidos si coinciden en su fecha y todos son la fecha más reciente ) que ha llegado a esa ciudad, junto con la información del pedido y del cliente

SELECT
```

<link rel="stylesheet" href="./../../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>