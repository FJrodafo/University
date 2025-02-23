-- Set the alias 'Start date in programming' to the init_date column
SELECT name, init_date AS 'Start date in programming' FROM users WHERE name = 'Fran';

-- Same query as above. Represents the possibility of using double quotes for strings
SELECT name, init_date AS "Start date in programming" FROM users WHERE name = "Fran";
