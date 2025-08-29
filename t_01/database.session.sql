CREATE TABLE heroes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(200) NOT NULL,
    race VARCHAR(20) NOT NULL,
    class_role VARCHAR(20) NOT NULL
);

INSERT INTO heroes (name, description, race, class_role) 
VALUES 
('wolverine', 'James Howlett', 'mutant', 'tankman'),
('hulk', 'Bruce Banner', 'human', 'tankman'),
('doctor_strange', 'Stephen Strange', 'human', 'healer'),
('thor', 'The Norse god of thunder', 'asgardian', 'dps'),
('black_widow', 'Natasha Romanoff', 'human', 'dps');

SELECT * FROM heroes;