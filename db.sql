CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(100),
    password VARCHAR(10)
);

CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    name TEXT
);

CREATE TABLE user_group (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    group_id INTEGER NOT NULL REFERENCES groups(group_id),
);
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    group_id INTEGER NOT NULL REFERENCES groups(group_id),
    content TEXT
);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY
    post_id INTEGER NOT NULL REFERENCES posts(post_id),
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    content TEXT
);

insert into users (email, password)
values ('taryn@dev.com',12345),
('hatice@dev.com',12345),
('abdul@dev.com',12345),
('joy@dev.com',12345),
('asel@dev.com',56789)

//Query failed because of: error: null value in column "group_id" violates not-null constraint
INSERT INTO posts (user_id, content)
VALUES (1,'Hello everyone'),
(2,'You are amazing'),
(3,'You will do this'),
(4,'Dont give up'),
(5,'Love yourself'),
(6, 'Be happy'),
(7, 'Life is too short, dont hold grudges')