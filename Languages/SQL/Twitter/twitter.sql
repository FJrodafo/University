DROP DATABASE IF EXISTS twitter;
CREATE DATABASE twitter;

USE twitter;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    user_handle VARCHAR(20) NOT NULL UNIQUE,
    email_address VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phonenumber CHAR(15) UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    PRIMARY KEY(user_id)
);

INSERT INTO users(user_handle, email_address, first_name, last_name, phonenumber)
VALUES
('FJrodafo', 'FJrodafo@gmail.com', 'Francisco José', 'Rodríguez Afonso', '123456789'),
('Mgarmes', 'Mgarmes@gmail.com', 'Marta', 'García Mesa', '234567890'),
('Kroddor', 'Kroddor@gmail.com', 'Kevin', 'Rodríguez Dorta', '345678901'),
('Cfloher', 'Cfloher@gmail.com', 'Chloe', 'Florencia Herrera', '456789012');

DROP TABLE IF EXISTS followers;
CREATE TABLE followers (
    follower_id INT NOT NULL,
    following_id INT NOT NULL,
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(following_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, following_id)
);

ALTER TABLE followers
ADD CONSTRAINT check_followers_ids
CHECK (follower_id != following_id);

INSERT INTO followers(follower_id, following_id)
VALUES
(1, 2),
(2, 1),
(2, 4),
(3, 1),
(4, 1),
(4, 2);

DROP TABLE IF EXISTS tweets;
CREATE TABLE tweets (
    tweet_id INT NOT NULL AUTO_INCREMENT,
    owner_id INT NOT NULL,
    tweet_text VARCHAR(280) NOT NULL,
    num_likes INT DEFAULT 0,
    num_retweets INT DEFAULT 0,
    num_comments INT DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    FOREIGN KEY(owner_id) REFERENCES users(user_id),
    PRIMARY KEY(tweet_id)
);

INSERT INTO tweets(owner_id, tweet_text)
VALUES
(1, 'Hello! How are you? 👋'),
(2, 'What is your favorite beach?'),
(4, 'What are you thinking about?'),
(1, 'Here is my website! https://fjrodafo.vercel.app/'),
(3, 'Good morning from the bakery! 🍰'),
(1, 'Studying MySQL! 📚'),
(1, 'Little by little!'),
(2, 'Lets go for the next championship! 🏆');
