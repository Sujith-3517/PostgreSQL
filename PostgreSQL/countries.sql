-- Create Regions Table
CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(50) UNIQUE
);

-- Create Countries Table
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) UNIQUE,
    population INT,
    area_sq_km INT,
    region_id INT REFERENCES regions(region_id)
);

-- Create Languages Table
CREATE TABLE languages (
    language_id SERIAL PRIMARY KEY,
    language_name VARCHAR(50) UNIQUE
);

-- Create Country_Languages Table
CREATE TABLE country_languages (
    country_id INT REFERENCES countries(country_id),
    language_id INT REFERENCES languages(language_id),
    PRIMARY KEY (country_id, language_id)
);

-- Insert Sample Data into Regions Table
INSERT INTO regions (region_name)
VALUES
('North America'),
('Europe'),
('Asia');

-- Insert Sample Data into Countries Table
INSERT INTO countries (country_name, population, area_sq_km, region_id)
VALUES
('United States', 331000000, 9833517, 1),
('Germany', 83020000, 357022, 2),
('China', 1444216107, 9596961, 3);

-- Insert Sample Data into Languages Table
INSERT INTO languages (language_name)
VALUES
('English'),
('German'),
('Mandarin');

-- Insert Sample Data into Country_Languages Table
INSERT INTO country_languages (country_id, language_id)
VALUES
(1, 1),
(2, 2),
(3, 3);


Retrieve all countries along with their regions and languages:

SELECT c.country_name, r.region_name, l.language_name
FROM countries c
JOIN regions r ON c.region_id = r.region_id
JOIN country_languages cl ON c.country_id = cl.country_id
JOIN languages l ON cl.language_id = l.language_id;

Find the total population in each region:
SELECT r.region_name, SUM(c.population) AS total_population
FROM regions r
JOIN countries c ON r.region_id = c.region_id
GROUP BY r.region_name;

Identify countries that speak a specific language:
SELECT c.country_name, r.region_name
FROM countries c
JOIN regions r ON c.region_id = r.region_id
JOIN country_languages cl ON c.country_id = cl.country_id
JOIN languages l ON cl.language_id = l.language_id
WHERE l.language_name = 'German';

Update the area of a specific country:
UPDATE countries
SET area_sq_km = 1000000
WHERE country_name = 'United States';

Delete a language and all associated countries:
DELETE FROM languages
WHERE language_id = 1;

