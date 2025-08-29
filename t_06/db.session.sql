DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO users (name, email) VALUES 
('Иван', 'ivan@mail.ru'),
('Мария', 'maria@mail.ru'),
('Алексей', 'alexey@mail.ru'),
('Елена', 'elena@mail.ru'),
('Дмитрий', 'dmitry@mail.ru'),
('Ольга', 'olga@mail.ru'),
('Сергей', 'sergey@mail.ru'),
('Анна', 'anna@mail.ru'),
('Андрей', 'andrey@mail.ru'),
('Наталья', 'natalia@mail.ru'),
('Ирина', 'irina@mail.ru'),
('Павел', 'pavel@mail.ru'),
('Юлия', 'yulia@mail.ru'),
('Александр', 'alexander@mail.ru'),
('Екатерина', 'ekaterina@mail.ru'),
('Михаил', 'mikhail@mail.ru'),
('Светлана', 'svetlana@mail.ru'),
('Владимир', 'vladimir@mail.ru'),
('Татьяна', 'tatyana@mail.ru'),
('Николай', 'nikolay@mail.ru');

SELECT * FROM users;