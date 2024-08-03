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

-- Top 3 users with JOIN
SELECT users.user_id, users.user_handle, users.first_name, following_id, COUNT(follower_id) AS followers
FROM followers JOIN users ON users.user_id = followers.following_id
GROUP BY following_id
ORDER BY followers DESC
LIMIT 3;

-- How many tweets has a user posted?
SELECT owner_id, COUNT(*) AS tweet_count
FROM tweets
GROUP BY owner_id;

-- Get tweets from users who have more than 2 followers
SELECT tweet_id, owner_id, tweet_text
FROM tweets
WHERE owner_id IN (
    /*
    SELECT following_id, COUNT(*) AS followers
    FROM followers
    GROUP BY following_id
    HAVING followers > 2
    */
    SELECT following_id
    FROM followers
    GROUP BY following_id
    HAVING COUNT(*) > 2
);
