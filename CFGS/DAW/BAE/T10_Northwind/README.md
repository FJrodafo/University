## Índice

1. [Prepara la base de datos](#prepara-la-base-de-datos)
2. [Northwind](#northwind)
3. [Consultas](#consultas)
4. [Consultas, borrado, actualización, etc](#consultas-borrado-actualización-etc)
5. [Subconsultas](#subconsultas)

## Prepara la base de datos

Importa la base de datos Northwind con el siguiente comando:

```shell
mysql -u root -p -h 127.0.0.1 -P 3306 < /home/fjrodafo/Documents/path/to/University/CFGS/DAW/BAE/T10_Northwind/northwind.sql
```

Exporta la base de datos Northwind con el siguiente comando:

```shell
mysqldump -u root -p northwind > /home/fjrodafo/Documents/path/to/University/CFGS/DAW/BAE/T10_Northwind/northwind.sql
```

Muestra todos los usuarios que existen en tu sistema con el siguiente comando:

```sql
SELECT user, host FROM mysql.user;
```

Concede todos los permisos a los usuarios que necesiten manejar esta base de datos con el siguiente comando:

```sql
GRANT ALL PRIVILEGES ON northwind.* TO 'fjrodafo'@'localhost';
```

Muestra los privilegios que tengan los usuarios con el siguiente comando:

```sql
SHOW GRANTS FOR 'fjrodafo'@'localhost';
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
    `CategoryID` tinyint(5) AUTO_INCREMENT,
    `CategoryName` varchar(15),
    `Description` mediumtext,
    `Picture` varchar(50),
    PRIMARY KEY (`CategoryID`),
    UNIQUE KEY `unique_categories_category_name` (`CategoryName`)
);

CREATE TABLE customers (
    `CustomerID` varchar(5),
    `CompanyName` varchar(40),
    `ContactName` varchar(30),
    `ContactTitle` varchar(30),
    `Address` varchar(60),
    `City` varchar(15),
    `Region` varchar(15),
    `PostalCode` varchar(10),
    `Country` varchar(15),
    `Phone` varchar(24),
    `Fax` varchar(24),
    PRIMARY KEY (`CustomerID`),
    KEY `key_customers_company_name` (`CompanyName`),
    KEY `key_customers_city` (`City`),
    KEY `key_customers_region` (`Region`),
    KEY `key_customers_postalcode` (`PostalCode`)
);

CREATE TABLE employees (
    `EmployeeID` int(10) AUTO_INCREMENT,
    `LastName` varchar(20),
    `FirstName` varchar(10),
    `Title` varchar(30),
    `TitleOfCourtesy` varchar(25),
    `BirthDate` datetime,
    `HireDate` datetime,
    `Address` varchar(60),
    `City` varchar(15),
    `Region` varchar(15),
    `PostalCode` varchar(10),
    `Country` varchar(15),
    `HomePhone` varchar(24),
    `Extension` varchar(4),
    `Photo` varchar(50),
    `Notes` mediumtext,
    `ReportsTo` int(10),
    PRIMARY KEY (`EmployeeID`),
    KEY `key_employees_lastname` (`LastName`),
    KEY `key_employees_postalcode` (`PostalCode`),
    KEY `key_ReportsTo` (`ReportsTo`),
    CONSTRAINT `fk_employees_reports_to` FOREIGN KEY (`ReportsTo`) REFERENCES `employees` (`EmployeeID`)
);

CREATE TABLE order_details (
    `ID` int(10) AUTO_INCREMENT,
    `OrderID` int(10),
    `ProductID` int(10),
    `UnitPrice` double,
    `Quantity` smallint(5),
    `Discount` float,
    PRIMARY KEY (`ID`),
    UNIQUE KEY `unique_order_id_product_id` (`OrderID`,`ProductID`),
    KEY `fk_order_details_product_id` (`ProductID`),
    CONSTRAINT `fk_order_details_order_id` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
    CONSTRAINT `fk_order_details_product_id` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
);

CREATE TABLE orders (
    `OrderID` int(10) AUTO_INCREMENT,
    `CustomerID` varchar(5),
    `EmployeeID` int(10),
    `OrderDate` datetime,
    `RequiredDate` datetime,
    `ShippedDate` datetime,
    `ShipVia` int(10),
    `Freight` double,
    `ShipName` varchar(40),
    `ShipAddress` varchar(60),
    `ShipCity` varchar(15),
    `ShipRegion` varchar(15),
    `ShipPostalCode` varchar(10),
    `ShipCountry` varchar(15),
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
    `ProductID` int(10) AUTO_INCREMENT,
    `ProductName` varchar(40),
    `SupplierID` int(10),
    `CategoryID` tinyint(5),
    `QuantityPerUnit` varchar(20),
    `UnitPrice` double,
    `UnitsInStock` smallint(5),
    `UnitsOnOrder` smallint(5),
    `ReorderLevel` smallint(5),
    `Discontinued` enum('y','n'),
    PRIMARY KEY (`ProductID`),
    KEY `fk_products_category_id` (`CategoryID`),
    KEY `fk_products_supplier_id` (`SupplierID`),
    KEY `key_products_product_name` (`ProductName`),
    CONSTRAINT `fk_products_category_id` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`),
    CONSTRAINT `fk_products_supplier_id` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`)
);

CREATE TABLE shippers (
    `ShipperID` int(10) AUTO_INCREMENT,
    `CompanyName` varchar(40),
    `Phone` varchar(24),
    PRIMARY KEY (`ShipperID`)
);

CREATE TABLE suppliers (
    `SupplierID` int(10) AUTO_INCREMENT,
    `CompanyName` varchar(40),
    `ContactName` varchar(30),
    `ContactTitle` varchar(30),
    `Address` varchar(60),
    `City` varchar(15),
    `Region` varchar(15),
    `PostalCode` varchar(10),
    `Country` varchar(15),
    `Phone` varchar(24),
    `Fax` varchar(24),
    `HomePage` varchar(255),
    PRIMARY KEY (`SupplierID`),
    KEY `key_suppliers_product_name` (`CompanyName`),
    KEY `key_suppliers_postal_code` (`PostalCode`)
);
```

## Consultas

Obtener...

```sql
SELECT * FROM `categories` WHERE `Description` = 'Cheeses';

SELECT CategoryID AS IDconsulta, CategoryName AS NombreCategoria FROM `categories` WHERE `Description` LIKE '%teas, beers%' and `CategoryName` LIKE '%a%';
```

Obtener los distintos puestos de trabajo

```sql
SELECT DISTINCT Title FROM `employees`;
```

Obtener los distintos puestos de trabajo y contar cuantas veces aparece cada uno

```sql
SELECT COUNT(*), Title FROM `employees` GROUP BY Title;
```

Obtener los subordinados del empleado número 5

```sql
SELECT EmployeeID, LastName, FirstName FROM employees WHERE ReportsTo = 5;
```

Ordenar los empleados según su antigüedad en la empresa

```sql
SELECT EmployeeID, LastName, FirstName, HireDate FROM employees ORDER BY HireDate ASC;
```

Ordenar los empleados según su antigüedad en la empresa invertido

```sql
SELECT EmployeeID, LastName, FirstName, HireDate FROM employees ORDER BY HireDate DESC;
```

Obtener los datos de las empleadas solteras de la empresa

```sql
SELECT EmployeeID, LastName, FirstName FROM employees WHERE TitleOfCourtesy = 'Ms.';
```

Obtener el número de pedidos que se hizo en el año 1997

```sql
SELECT COUNT(*) AS NumeroPedidos FROM orders WHERE YEAR(OrderDate) = 1997;

SELECT COUNT(*) AS NumeroPedidos FROM orders WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31';

SELECT COUNT(*) AS NumeroPedidos FROM orders WHERE OrderDate >= '1997-01-01' AND OrderDate <= '1997-12-31';
```

Obtener el número de pedidos que se hizo en el mes de junio de ese año

```sql
SELECT COUNT(*) AS NumeroPedidos FROM orders WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 6;

SELECT COUNT(*) AS NumeroPedidos FROM orders WHERE OrderDate BETWEEN '1997-06-01' AND '1997-06-30';

SELECT COUNT(*) AS NumeroPedidos FROM orders WHERE OrderDate >= '1997-06-01' AND OrderDate <= '1997-06-30';
```

Obtener el número de empleados estadounidenses de la empresa

```sql
SELECT COUNT(*) AS EmployeeID FROM employees WHERE Country = 'USA';
```

Obtener los diferentes precios a los que se ha vendido el queso cabrales (ProductID = 11)

```sql
SELECT DISTINCT UnitPrice FROM order_details WHERE ProductID = 11;
```

Obtener los proveedores franceses

```sql
SELECT SupplierID, ContactName FROM suppliers WHERE Country = 'France';
```

Obtener la cantidad de queso de cabrales que se ha pedido en total (ProductID = 11)

```sql
SELECT SUM(Quantity) AS QuesoCabrales FROM order_details WHERE ProductID = 11;
```

Ordenar los productos de mayor a menor cantidad solicitada en total

```sql
SELECT products.ProductID, ProductName, SUM(Quantity) AS TotalCantidadSolicitada
FROM order_details
JOIN products ON order_details.ProductID = products.ProductID
GROUP BY products.ProductID, ProductName
ORDER BY TotalCantidadSolicitada DESC;
```

Mostrar la cuantía total de cada pedido ordenado de mayor a menor junto con la fecha y el nombre del cliente que lo hizo

```sql
SELECT SUM(UnitPrice*Quantity) FROM order_details GROUP BY OrderID;
```

Se desea saber cuáles son los 5 mejores clientes de nuestra compañía. Entendiéndose por mejores clientes aquellas empresas que nos han dejado más dinero (los clientes que la cuantía que suman todos sus pedidos sea la mayor)

```sql
SELECT
```

¿De qué país tenemos más clientes?

```sql
SELECT
```

Obtener la edad que tenía cada empleado al entrar en la empresa

```sql
SELECT
```

Calcular ahora la edad media a la que un empleado entra en la empresa

```sql
SELECT
```

Saber cuántos pedidos ha llevado cada transportista

```sql
SELECT
```

Mostrar el ID de los empleados que tengan a otros empleados a su cargo

```sql
SELECT
```

Mostrar los pedidos que deben ser enviados fuera de USA

```sql
SELECT
```

Mostrar los pedidos que aún no se han enviado

```sql
SELECT
```

¿Qué productos de los que ya no se va a seguir trabajando con ellos tenía un precio más alto?

```sql
SELECT
```

Obtener los nombre de los productos que sean quesos

```sql
SELECT
```

Ordenar los productos del más caro al más barato precio por unidad

```sql
SELECT
```

Obtener cuántos proveedores distintos suministran actualmente quesos a la empresa (categoría 4)

```sql
SELECT
```

Todos los productos tienen una cantidad llamada "reorderlevel" que si el stock baja de esa cifra se debe solicitar del proveedor que reponga el producto. Detectar que productos hay que solicitar a su proveedor que reponga. Tener en cuenta que ya hay productos a los que se les ha detectado que precisan de reposición y se le ha solicitado a su proveedor que traiga una cantidad de ese producto. Eso lo vemos en el campo "UnitsOnOrder" que nos dice la cantidad de producto que se ha solicitado reponer

```sql
SELECT
```

Empleados contratados en 1993

```sql
SELECT
```

Un cliente quiere presentar una reclamación por la actuación de uno de los empleados de la empresa Lo único que recuerda del empleado es que le dijo que el nombre de su calle decía algo de "Winchester". Buscar los empleados que pueden coincidir para la reclamación

```sql
SELECT
```

Se desea saber que empleados van a cumplir años en el próximo mes de julio

```sql
SELECT
```

Un cliente puede desear enviar un pedido a un sitio o persona distinto de su nombre de empresa. Obtener los nombres de envío que no coinciden con el nombre de la compañía cliente

```sql
SELECT
```

Se va a enviar una carta comercial a las distintas personas que se tiene como contacto en las empresas clientes. Se quiere hacer una carta personalizada según el tipo de puesto de trabajo que ocupen esas personas. Se desea saber cuántas cartas se debe hacer para cada uno de esos tipos de puestos de trabajo

```sql
SELECT
```

Se desea saber cual es el pedido en el que ha solicitado mayor cantidad de productos distintos

```sql
SELECT
```

Se desea saber cual es el  producto ( ProductID) que más veces se ha solicitado

```sql
SELECT
```

Se desea saber que pedido ha tenido una reducción de precio mayor por los descuentos aplicados

```sql
SELECT
```

Se desea saber que productos tienen el mismo precio

```sql
SELECT
```

Mostrar los paises donde tenemos como mínimo 3 proveedores

```sql
SELECT
```

Mostrar en que meses del año 1997 se hicieron menos de 30 pedidos

```sql
SELECT
```

## Consultas, borrado, actualización, etc

Crear una nueva tabla llamada prueba con los empleados que tengan nombre que comience por letra A

```sql
SELECT
```

Crear una copia de la tabla productos Que se llame prueba2

```sql
SELECT
```

Incrementar el precio de los productos un 10% si su precio actual es mayor de 80 en la tabla prueba2

```sql
SELECT
```

Sin borrar los registros de la tabla prueba2 hacer una consulta que en el caso que el precio sea diferente en las dos tablas ponga en prueba2 el precio que aparece en products

```sql
SELECT
```

Hacer que los empleados de UK se queden sin jefe establecido (hacer esto en una tabla llamada prueba que sea una copia de employees)

```sql
SELECT
```

Ahora borrar todos los empleados que no tengan jefes en prueba

```sql
SELECT
```

## Subconsultas

Mostrar todas las categorias y en cada fila además de la categoría mostrar el nombre del producto con el precio más alto de esa categoría (también mostrar el precio de ese producto)

```sql
SELECT
```

Obtener una lista de empleados junto con el total de ventas de sus pedidos, donde se incluyan solo aquellos empleados que hayan vendido más que la media

```sql
SELECT
```

Obtener por cada jefe su subordinado que tenga más antigüedad

```sql
SELECT
```

Nosotros podemos calcular y obtener la cantidad mínima de productos que hay de todas las categorías. Se quiere que se muestren todas las categorías que coincidan con esa cantidad mínima

```sql
SELECT
```

Obtener por cada ciudad de destino  el/los pedido más reciente ( se mostrarán varios pedidos si coinciden en su fecha y todos son la fecha más reciente ) que ha llegado a esa ciudad, junto con la información del pedido y del cliente.

```sql
SELECT
```

<link rel="stylesheet" href="./README.css">
<a class="scrollup" href="#top">&#x1F53A</a>