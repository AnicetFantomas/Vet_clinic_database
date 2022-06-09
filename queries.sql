/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE escapes_attempts <3 AND neutered IS TRUE;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT (name, escapes_attempts) FROM animals WHERE weight_kg >10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE name IN ('Agumon');
SELECT * FROM animals WHERE weight_kg >=10.4 AND weight_kg <=17.3;

BEGIN;
UPDATE animals SET species='unspecified';
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species='pokemon' WHERE species='unspecified';
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
END;

BEGIN;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';
SELECT * FROM animals;
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) FROM animals;
SELECT COUNT(name) FROM animals WHERE escapes_attempts = 0;