DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS powers;
DROP TABLE IF EXISTS rases;
DROP TABLE IF EXISTS heroes;

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

CREATE TABLE powers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hero_id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    points INT NOT NULL,
    type ENUM('Attack', 'Defense') NOT NULL,
    FOREIGN KEY (hero_id) REFERENCES heroes(id)
);

INSERT INTO powers (hero_id, name, points, type) 
VALUES 
(1, 'Regeneration', 150, 'Attack'),
(2, 'Super Strength', 180, 'Attack'),
(3, 'Magic', 170, 'Defense'),
(4, 'Lightning', 190, 'Attack'),
(5, 'Espionage', 120, 'Defense');

CREATE TABLE rases (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hero_id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    FOREIGN KEY (hero_id) REFERENCES heroes(id)
);

CREATE TABLE teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hero_name VARCHAR(20) NOT NULL,
    team_type ENUM('red_team', 'blue_team') NOT NULL,
    FOREIGN KEY (hero_name) REFERENCES heroes(name)
);

INSERT INTO teams (hero_name, team_type)
SELECT heroes.name, 
    CASE WHEN powers.type = 'Attack' THEN 'red_team' ELSE 'blue_team' END
FROM heroes
JOIN powers ON heroes.id = powers.hero_id;

SELECT team_type FROM teams;
SELECT
    heroes.name,
    powers.name AS power_name,
    teams.team_type
FROM
    powers
JOIN
    heroes ON powers.hero_id = heroes.id
JOIN
    teams ON heroes.name = teams.hero_name;