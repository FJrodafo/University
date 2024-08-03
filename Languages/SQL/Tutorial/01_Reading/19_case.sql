-- Gets all data from the "users" table and sets string display conditions based on the age value
SELECT *,
CASE 
	WHEN age > 18 THEN 'Over 18'
    WHEN age = 18 THEN 'Just turned 18'
    ELSE 'Under 18'
END AS 'Is he/she over 18?'
FROM users;

-- Gets all data from the "users" table and sets boolean value display conditions based on the age value
SELECT *,
CASE 
	WHEN age > 18 THEN True
    ELSE False
END AS 'Is he/she over 18?'
FROM users;
