/* Populate database with sample data. */

-- PROJECT 1

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, TRUE, 11.00);

-- PROJECT 2

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Charmander', '2020-02-08', 0, FALSE, -11.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', '2021-11-15', 2, TRUE, -5.70);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', '2005-06-12', 1, TRUE, -40.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', '2005-06-07', 7, TRUE, 20.40);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', '1998-10-13', 3, TRUE, 17.00);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', '2022-05-14', 4, TRUE, 22.00);

-- PROJECT 3

INSERT INTO owners (full_name, age) values ('Sam Smith', 34);
INSERT INTO owners (full_name, age) values ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) values ('Bob ', 45);
INSERT INTO owners (full_name, age) values ('Melody Pond', 77);
INSERT INTO owners (full_name, age) values ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) values ('Jodie Whittaker', 38);

INSERT INTO species (name) values ('Pokemon');
INSERT INTO species (name) values ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name ILIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

-- PROJECT 4
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Vet William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Vet Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Vet Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Vet Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vets_id, species_id) VALUES (1, 1);
INSERT INTO specializations (vets_id, species_id) VALUES (3, 2);
INSERT INTO specializations (vets_id, species_id) VALUES (3, 1);
INSERT INTO specializations (vets_id, species_id) VALUES (4, 2);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 1, '2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 3, '2020-07-22');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (2, 4, '2021-02-02');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (5, 2, '2020-01-05');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (5, 2, '2020-03-08');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (5, 2, '2020-05-14');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 3, '2021-05-04');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 4, '2021-02-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (7, 2, '2019-12-21');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (7, 1, '2020-08-10');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (7, 2, '2021-04-07');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 3, '2019-09-29');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 4, '2020-10-03');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 4, '2020-11-04');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (4, 2, '2019-01-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (4, 2, '2019-05-15');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (4, 2, '2020-02-27');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (4, 2, '2020-08-03');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 3, '2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 1, '2021-01-11');