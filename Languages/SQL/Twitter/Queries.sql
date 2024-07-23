-- Get followers table
SELECT follower_id, following_id FROM followers;

-- Get Marta's followers
SELECT follower_id FROM followers WHERE following_id = 2;

-- Get Marta's number of followers
SELECT COUNT(follower_id) AS followers FROM followers WHERE following_id = 2;

-- Top 3 users with the highest number of followers
SELECT following_id, COUNT(follower_id) AS followers
FROM followers
GROUP BY following_id
ORDER BY followers DESC
LIMIT 3;
