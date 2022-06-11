/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,species_id,owners_id)
VALUES('Agumon', '2022-02-03', 0, TRUE, 10.23);
INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,weight_kg,species_id,owners_id)
VALUES('Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,weight_kg,species_id,owners_id)
VALUES('Pikachu', '2021-07-01', 1, FALSE, 15.04);
INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,weight_kg,species_id,owners_id)
VALUES('Devimon', '2017-05-12', 5, TRUE, 11);
INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,weight_kg,species_id,owners_id)
VALUES('Charmander', '2020-02-08', 0, FALSE, 11);
INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,weight_kg,species_id,owners_id)
VALUES('Plantmon', '2021-11-15', 2, TRUE, -5.7);
INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,weight_kg,species_id,owners_id)
VALUES('Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,weight_kg,species_id,owners_id)
VALUES('Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,weight_kg,species_id,owners_id)
VALUES('Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,weight_kg,species_id,owners_id)
VALUES('Blossom', '1998-09-13', 3, TRUE, 17);
INSERT INTO animals (name,date_of_birth,escapes_attempts,neutered,weight_kg,weight_kg,species_id,owners_id)
VALUES('Ditto', '2022-05-14', 4, TRUE, 22);


-- Insert data into owners table
INSERT INTO owners (full_name, age)
VALUES('Sam Smith', 34),
	('Jennifer Orwell', 19)
	('Bob', 45),
	('Melody Pond', 77),
	('Dean Winchester', 14),
	('Jodie Whittaker', 38);

-- Insert data into species table
INSERT INTO species (name)
VALUES('Pokemon'),
	('Digimon');

-- Insert the following data for vets:
INSERT INTO vets (name, date_of_graduation, age)
VALUES('William Tatcher', '2000-04-23', 45),
	  ('Maisy Smith', '2019-01-17', 26),
	  ('Stephanie Mendez', '1981-05-04', 64),
	  ('Jack Harkness', '2008-06-08', 38)