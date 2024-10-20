-- データベース内にテーブルを作成
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
-- サンプルデータの挿入
INSERT INTO users (username, email)
VALUES ('john_doe', 'john.doe@example.com'),
    ('jane_doe', 'jane.doe@example.com');