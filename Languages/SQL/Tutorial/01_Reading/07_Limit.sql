-- Gets the first 3 rows of the "users" table
SELECT * FROM users LIMIT 3;

-- Gets the first 2 rows of the "users" table with an email other than sara@gmail.com or age equal to 15
SELECT * FROM users WHERE NOT email = 'sara@gmail.com' OR age = 15 LIMIT 2;
