-- Counts how many rows contain non-null data in the age field of the "users" table greater than 3
SELECT COUNT(age) FROM users HAVING COUNT(age) > 3;
