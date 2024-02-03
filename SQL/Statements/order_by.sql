-- Sorts all data in the "users" table by age (ascending by default)
SELECT * FROM users ORDER BY age;

-- Sorts all data in the "users" table by age in ascending order
SELECT * FROM users ORDER BY age ASC;

-- Sorts all the data in the "users" table by age in descending order
SELECT * FROM users ORDER BY age DESC;

-- Gets all the data from the "users" table with email equal to sara@gmail.com and sorts them by age in descending order
SELECT * FROM users WHERE email='sara@gmail.com' ORDER BY age DESC;

-- Gets all the names from the "users" table with email equal to sara@gmail.com and sorts them by age in descending order
SELECT name FROM users WHERE email='sara@gmail.com' ORDER BY age DESC;
