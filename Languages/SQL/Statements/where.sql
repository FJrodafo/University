-- Filters all data from the "users" table with age equal to 15
SELECT * FROM users WHERE age = 15;

-- Filters all names in the "users" table with age equal to 15
SELECT name FROM users WHERE age = 15;

-- Filters all different names from the "users" table with age equal to 15
SELECT DISTINCT name FROM users WHERE age = 15;

-- Filters all different ages from the "users" table with age equal to 15
SELECT DISTINCT age FROM users WHERE age = 15;
