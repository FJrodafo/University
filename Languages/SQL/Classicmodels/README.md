## Classicmodels Database

Import/Export the classicmodels database:

```shell
# Import
mysql -u root -p -h 127.0.0.1 -P 3306 < /home/fjrodafo/path/to/University/Languages/SQL/Classicmodels/classicmodels.sql

# Export
mysqldump -u root -p northwind > /home/fjrodafo/path/to/University/Languages/SQL/Classicmodels/exported-database.sql
```

Log in as root in mysql:

```shell
mysql -u root -p
```

Create/Delete a new user:

```sql
-- Create
CREATE USER 'fjrodafo'@'localhost' IDENTIFIED BY 'your_password';

-- Delete
DROP USER 'fjrodafo'@'localhost';
```

Show all the users that exist on your system:

```sql
SELECT user, host FROM mysql.user;
```

Grant/Revoke all permissions to users who need to manage the classicmodels database:

```sql
GRANT ALL PRIVILEGES ON classicmodels.* TO 'fjrodafo'@'localhost';

REVOKE ALL PRIVILEGES ON classicmodels.* FROM 'fjrodafo'@'localhost';
```

Refresh & Show the privileges that users have:

```sql
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'fjrodafo'@'localhost';
```

Exit the root user and log in with your new user:

```shell
mysql -u fjrodafo -p
```

Shows all the databases you have access to:

```sql
SHOW DATABASES;
```

Access the classicmodels database:

```sql
USE classicmodels;
```

Shows all the database tables selected with the previous command:

```sql
SHOW TABLES;
```

Shows all columns of the customers table:

```sql
SHOW COLUMNS FROM customers;
```

Select all records from the customers table:

```sql
SELECT * FROM customers;
```

Select the employee number, last name and first name from the employees table:

```sql
SELECT employeeNumber, lastName, firstName FROM employees;
```

Select the name of all vendors without repeating the same name:

```sql
SELECT DISTINCT productVendor FROM products;
```

Select the customer number and full name from the United States of America:

```sql
SELECT customerNumber, customerName, contactLastName, contactFirstName FROM customers WHERE country = 'USA';
```

Select the email of the employee with ID 1165, Leslie Jennings:

```sql
SELECT employeeNumber, lastName, firstName, email FROM employees WHERE employeeNumber = 1165;
```

Select all products that have less than 500 units in stock:

```sql
SELECT productCode, productName FROM products WHERE quantityInStock < 500;
```

Select all products that have more than 5000 units in stock:

```sql
SELECT productCode, productName FROM products WHERE quantityInStock > 5000;
```

Count how many products have more than 5000 units in stock:

```sql
SELECT COUNT(*) AS 'Products with more than 5000 units in stock' FROM products WHERE quantityInStock > 5000;
```

Select all employees who have employee number less than or equal to 1100:

```sql
SELECT employeeNumber, lastName, firstName FROM employees WHERE employeeNumber <= 1100;
```

Select all employees who do not belong to office 4:

```sql
SELECT employeeNumber, lastName, firstName FROM employees WHERE officeCode <> 4;
SELECT employeeNumber, lastName, firstName FROM employees WHERE officeCode != 4;
```

Select all employees whose name begins with the letter L:

```sql
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE 'L%';
```

Select all customer payments that are between $3,000 and $10,000:

```sql
SELECT * FROM payments WHERE amount BETWEEN 3000 AND 10000 ORDER BY amount ASC;
```

Select all customers who are from San Francisco with zip code 94217:

```sql
SELECT customerNumber, customerName, addressLine1, city, postalCode FROM customers WHERE city = 'San Francisco' AND postalCode = 94217;
```

Select all San Francisco and New York customers:

```sql
SELECT customerNumber, customerName, addressLine1, city FROM customers WHERE city = 'San Francisco' OR city = 'NYC';
```

Select all customers who are not from London and not from Spain:

```sql
SELECT customerNumber, customerName, city, country FROM customers WHERE NOT city = 'London' AND NOT country = 'Spain';
```

Select all products ordered by purchase price:

```sql
SELECT productCode, productName, buyPrice FROM products ORDER BY buyPrice ASC;
SELECT productCode, productName, buyPrice FROM products ORDER BY buyPrice DESC;
```

Select all orders ordered by shipping status and date from old to most recent:

```sql
SELECT orderNumber, orderDate, shippedDate, status, customerNumber FROM orders ORDER BY status DESC, shippedDate ASC;
```

Select all orders with order number between 10400 and 10420, sorted by shipping status and date from oldest to newest:

```sql
SELECT orderNumber, orderDate, shippedDate, status, customerNumber FROM orders WHERE orderNumber BETWEEN 10400 AND 10420 ORDER BY status DESC, shippedDate ASC;
```

