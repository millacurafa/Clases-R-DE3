DROP TABLE IF EXISTS care_schedule;
DROP TABLE IF EXISTS keepers;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS diets;

CREATE TABLE diets (
	id INT PRIMARY KEY,
	diet_type VARCHAR(50)
);

CREATE TABLE animals (
	id INT PRIMARY KEY,
	name VARCHAR(50),
	age INT,
	species VARCHAR(50),
	diet_id INT REFERENCES diets(id)
);

CREATE TABLE keepers (
	id INT PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TYPE day_of_week AS ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

CREATE TABLE care_schedule (
	id INT PRIMARY KEY,
	animal_id INT NOT NULL REFERENCES animals(id),
	keeper_id INT NOT NULL REFERENCES keepers(id),
	day day_of_week NOT NULL
);

INSERT INTO diets (id, diet_type) VALUES (1, 'herbivore');
INSERT INTO diets (id, diet_type) VALUES (2, 'carnivore');
INSERT INTO diets (id, diet_type) VALUES (3, 'omnivore');
INSERT INTO diets (id, diet_type) VALUES (4, 'tofu');

INSERT INTO animals (id, name, age, species, diet_id) VALUES (1, 'Leo', 12, 'Lion', 2);
INSERT INTO animals (id, name, age, species, diet_id) VALUES (2, 'Tony', 8, 'Tiger', 2);
INSERT INTO animals (id, name, age, species, diet_id) VALUES (3, 'Matilda', 6, 'Cow', 1);
INSERT INTO animals (id, name, age, species, diet_id) VALUES (4, 'Bernice', 12, 'Bear', 3);
INSERT INTO animals (id, name, age, species)          VALUES (5, 'Gerry', 1, 'Goldfish');
INSERT INTO animals (id, name, age, species, diet_id) VALUES (6, 'Zoe', 3, 'Zebra', 1);
INSERT INTO animals (id, name, age, species, diet_id) VALUES (7, 'Ernest', 4, 'Snake', 2);
INSERT INTO animals (id, name, age, species)          VALUES (8, 'Kim', 6, 'Kangaroo');

INSERT INTO keepers (id, name) VALUES (1, 'Tony');
INSERT INTO keepers (id, name) VALUES (2, 'Yoshi');
INSERT INTO keepers (id, name) VALUES (3, 'Anne');
INSERT INTO keepers (id, name) VALUES (4, 'Jerome');

INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (1, 1, 2, 'Monday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (2, 1, 1, 'Tuesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (3, 1, 3, 'Wednesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (4, 1, 4, 'Thursday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (5, 1, 2, 'Friday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (6, 1, 1, 'Saturday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (7, 1, 4, 'Sunday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (8, 2, 3, 'Monday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (9, 2, 4, 'Tuesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (10, 2, 3, 'Wednesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (11, 2, 1, 'Thursday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (12, 2, 4, 'Friday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (13, 2, 2, 'Saturday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (14, 2, 3, 'Sunday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (15, 3, 1, 'Monday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (16, 3, 4, 'Tuesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (17, 3, 4, 'Wednesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (18, 3, 1, 'Thursday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (19, 3, 3, 'Friday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (20, 3, 4, 'Saturday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (21, 3, 2, 'Sunday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (22, 4, 4, 'Monday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (23, 4, 2, 'Tuesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (24, 4, 3, 'Wednesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (25, 4, 1, 'Thursday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (26, 4, 3, 'Friday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (27, 4, 4, 'Saturday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (28, 4, 2, 'Sunday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (29, 5, 3, 'Monday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (30, 5, 1, 'Tuesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (31, 5, 4, 'Wednesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (32, 5, 2, 'Thursday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (33, 5, 4, 'Friday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (34, 5, 3, 'Saturday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (35, 5, 1, 'Sunday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (36, 6, 1, 'Monday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (37, 6, 2, 'Tuesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (38, 6, 4, 'Wednesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (39, 6, 3, 'Thursday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (40, 6, 2, 'Friday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (41, 6, 4, 'Saturday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (42, 6, 1, 'Sunday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (43, 7, 2, 'Monday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (44, 7, 3, 'Tuesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (45, 7, 1, 'Wednesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (46, 7, 4, 'Thursday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (47, 7, 4, 'Friday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (48, 7, 3, 'Saturday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (49, 7, 2, 'Sunday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (50, 8, 1, 'Monday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (51, 8, 3, 'Tuesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (52, 8, 1, 'Wednesday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (53, 8, 4, 'Thursday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (54, 8, 3, 'Friday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (55, 8, 2, 'Saturday');
INSERT INTO care_schedule (id, animal_id, keeper_id, day) VALUES (56, 8, 2, 'Sunday');

