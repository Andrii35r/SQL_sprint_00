CREATE TABLE test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO test (name) VALUES ('Пример данных 1'), ('Пример данных 2');


SELECT * FROM test;

SHOW TABLES;
DESCRIBE test;
SELECT * FROM test;