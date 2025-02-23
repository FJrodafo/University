-- Count how many rows the "users" table contains
Select COUNT(*) FROM users;

-- Counts how many rows contain non-null data in the age field of the "users" table
Select COUNT(age) FROM users;
