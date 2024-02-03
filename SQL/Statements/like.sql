-- Gets all data from the "users" table that contains an email with the text "gmail.com" at the end
SELECT * FROM users WHERE email LIKE '%gmail.com';

-- Gets all data from the "users" table that contains an email with the text "sara" in its initial part
SELECT * FROM users WHERE email LIKE 'sara%';

-- Gets all data from the "users" table that contains an email with an at
SELECT * FROM users WHERE email LIKE '%@%';
