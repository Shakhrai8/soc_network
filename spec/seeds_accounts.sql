TRUNCATE TABLE accounts, posts RESTART IDENTITY;


-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (email, username) VALUES ('email1@gmail.com', 'user_name_1');
INSERT INTO accounts (email, username) VALUES ('email23@gmail.com', 'user_name_23');