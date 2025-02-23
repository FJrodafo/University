-- Group the results by different age
SELECT MAX(age) FROM users GROUP BY age;

-- Group the results by different ages and count how many records there are for each one
SELECT COUNT(age), age FROM users GROUP BY age;

-- Group the results by different ages, count how many records there are for each and sort them
SELECT COUNT(age), age FROM users GROUP BY age ORDER BY age ASC;

-- Groups the results by different age over 15, counts how many records there are for each and sorts them
SELECT COUNT(age), age FROM users WHERE age > 15 GROUP BY age ORDER BY age ASC;
