-- Gets all data from the "users" table with an email other than sara@gmail.com
SELECT * FROM users WHERE NOT email = 'sara@gmail.com';

-- Gets all data from the "users" table with an email other than sara@gmail.com and age equal to 15
SELECT * FROM users WHERE NOT email = 'sara@gmail.com' AND age = 15;

-- Gets all data from the "users" table with an email other than sara@gmail.com or age equal to 15
SELECT * FROM users WHERE NOT email = 'sara@gmail.com' OR age = 15;
