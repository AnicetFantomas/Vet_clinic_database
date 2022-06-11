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
SELECT full_name, name FROM animals INNER JOIN owners ON owners.id = animals.owners_id;
-- How many animals are there per species?
SELECT count(species_id), (species.name) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT (animals.name) AS animals_name, 
(species.name) as species_name, 
full_name FROM animals JOIN species
ON animals.species_id = species.id 
JOIN owners ON animals.owners_id = owners.id WHERE species.id = 2 AND owners_id = 2;
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name, full_name FROM animals FULL OUTER JOIN owners ON animals.owners_id = owners.id WHERE escapes_attempts = 0 AND owners_id = 5;
-- Who owns the most animals?
SELECT full_name, count(owners_id) FROM owners JOIN animals ON owners.id = animals.owners_id GROUP BY full_name ORDER BY count(name) DESC;

-- Who was the last animal seen by William Tatcher?
SELECT (animals.name) AS animalName, (vets.name) AS vetsName, (visits.date_of_visit) AS dateVisited
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets_id = 1
ORDER BY (visits.date_of_visit) DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(visits.vets_id) AS Different_animals_seen, (vets.name) AS vets_name
FROM visits
JOIN vets ON visits.vets_id = vets.id
WHERE vets.id = 3
GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT (vets.name) as vets_name, (species.name) as vets_speciality
FROM vets
FULL OUTER JOIN specializations ON vets.id = specializations.vets_id
FULL OUTER JOIN species ON species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT (animals.name) AS animals_visited_Stephanie
FROM animals
FULL OUTER JOIN visits ON animals.id = visits.animals_id
FULL OUTER JOIN vets ON vets.id = visits.vets_id
WHERE vets.id = 3 AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT (animals.name) AS animals_name, COUNT(visits.animals_id) AS number_of_visits
FROM animals
FULL OUTER JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY COUNT(visits.animals_id) DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT (animals.name) AS animalName, (vets.name) AS vetsName, (visits.date_of_visit) AS dateVisited
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets_id = 2
ORDER BY (visits.date_of_visit)
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT (animals.name) AS animal_information, (vets.name) AS vet_information, (visits.date_of_visit) AS date_of_Visit
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY (visits.date_of_visit) DESC;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name AS vetsName, COUNT(vets.name) AS timesVisited FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id
LEFT JOIN visits ON visits.vets_id = specializations.vets_id
WHERE specializations.species_id IS NULL
GROUP BY vets.name, specializations.species_id;