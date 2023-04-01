/* Database schema to keep the structure of entire database. */

-- PROJECT 1
CREATE TABLE animals (
 id INTEGER,
 name VARCHAR(255),
 date_of_birth DATE,
 escape_attempts INTEGER,
 neutered BOOLEAN,
 weight_kg DECIMAL(5,2)
);

-- PROJECT 2
ALTER TABLE animals ADD COLUMN species VARCHAR(50);

-- PROJECT 3
CREATE TABLE owners (
 id BIGSERIAL PRIMARY KEY,
 full_name VARCHAR(255),
 age INTEGER
);

CREATE TABLE species (
 id BIGSERIAL PRIMARY KEY,
 name VARCHAR(255)
);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id BIGSERIAL PRIMARY KEY; 
ALTER TABLE animals DROP COLUMN species; 
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id); 
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners(id);

-- PROJECT 4
CREATE TABLE vets (
 id BIGSERIAL PRIMARY KEY,
 name VARCHAR(255),
 age INTEGER,
 date_of_graduation DATE
);
CREATE TABLE specializations (
 vets_id INTEGER REFERENCES vets (id),
 species_id INTEGER REFERENCES species (id)
);
CREATE TABLE visits (
 animals_id INTEGER REFERENCES animals (id),
 vets_id INTEGER REFERENCES vets (id),
 date_of_visit DATE
);