TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title, contents, views, account_id) VALUES ('title_1', 'con_1', 123, 1);
INSERT INTO posts (title, contents, views, account_id) VALUES ('title_2', 'con_2', 234, 2);