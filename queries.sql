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
UPDATE animals SET species='pokemon' WHERE species IS NULL;
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

-- How many animals are there?
SELECT COUNT(name) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(name) FROM animals WHERE escapes_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) from animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT MAX(escapes_attempts) from animals;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, (MIN(weight_kg), MAX(weight_kg)) FROM animals GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escapes_attempts) from animals where EXTRACT(YEAR FROM date_of_birth) between 1990 AND 2000;


-- If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = 1WHERE name NOT LIKE '%mon';
-- All other animals are Pokemon
UPDATE animalsSET species_id = 2  WHERE name LIKE '%mon';

-- Sam Smith owns Agumon.
UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owners_id = 2 WHERE name IN('Gabumon', 'Pikachu');
-- Bob owns Devimon and Plantmon.
UPDATE animals SET owners_id = 3 WHERE name IN('Devimon', 'Plantmon');
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owners_id = 4 WHERE name IN('Charmander', 'Squirtle', 'Blossom');
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owners_id = 5 WHERE name IN('Angemon', 'Boarmon');


-- What animals belong to Melody Pond?
select name, full_name from animals join owners on animals.owners_id = owners.id where owners.id = 4;
-- List of all animals that are pokemon (their type is Pokemon).
select animals.name from animals join species on animals.species_id = species.id where species.id = 1;
-- List all owners and their animals, remember to include those that don't own any animal.