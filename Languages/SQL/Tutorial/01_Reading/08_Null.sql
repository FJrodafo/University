-- Gets all data from the "users" table with null email
SELECT * FROM users WHERE email IS NULL;

-- Gets all data from the "users" table with non-null email
SELECT * FROM users WHERE email IS NOT NULL;

-- Gets all data from the "users" table with non-null email and age equal to 15
SELECT * FROM users WHERE email IS NOT NULL AND age = 15;

-- Gets the first name, last name and age from the "users" table, and if the age is null it shows it as 0
SELECT name, surname, IFNULL(age, 0) AS age FROM users;
