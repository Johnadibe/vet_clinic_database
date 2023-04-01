/*Queries that provide answers to the questions from all projects.*/

-- PROJECT 1
SELECT * FROM animals WHERE name ILIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.50;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.40 AND 17.30;

-- PROJECT 2
-- Transaction I Query
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK; 
SELECT * FROM animals; --
-- Transaction II Query
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name ILIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;
-- Transaction III Query
BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
-- Transaction IV Query
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint1;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO savepoint1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;
-- Table Query
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT name, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY name;
SELECT name, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN DATE '1990-01-01' AND '2000-12-31' GROUP BY name;

-- PROJECT 3 QUERIES
SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT o.full_name AS owner_name, a.name AS animal_name FROM owners AS o LEFT JOIN animals AS a ON o.id = a.owners_id;
SELECT s.name AS species, COUNT(*) AS count FROM animals a JOIN species s ON a.species_id = s.id GROUP BY s.name;
SELECT o.full_name AS owner_name, a.name AS animal_name FROM owners AS o JOIN animals AS a ON o.id = a.owners_id WHERE o.full_name = 'Jennifer Orwell' AND a.species_id = 2;
SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(animals.id) AS num_animals FROM owners LEFT JOIN animals ON owners.id = animals.owners_id GROUP BY owners.id ORDER BY num_animals DESC LIMIT 1;

-- PROJECT 4 QUERIES