-- Concatenates the first and last name fields in a single column
SELECT CONCAT('Name: ', name, ', Surname: ', surname) FROM users;

-- Concatenates the first and last name fields in a single column and sets the alias 'Full Name'
SELECT CONCAT('Name: ', name, ', Surname: ', surname) AS 'Full name' FROM users;
