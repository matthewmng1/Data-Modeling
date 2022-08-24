-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  moons TEXT[]
);

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets(id)
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets(id)
);

INSERT INTO planets
  (name, orbital_period_in_years, moons)
VALUES
  ('Earth', 1.00, '{"The Moon"}'),
  ('Mars', 1.88, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, '{}'),
  ('Neptune', 164.8, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, '{}'),
  ('Gliese 876 b', 0.23, '{}');

INSERT INTO orbits_around
  (name, 
  planet_id
  )
VALUES
  ('The Sun', 1),
  ('The Sun', 2),
  ('The Sun', 3),
  ('The Sun', 4),
  ('Proxima Centauri', 5),
  ('Gliese 876', 6);

INSERT INTO galaxy (name, planet_id)
VALUES
('Milk Way', 1),
('Milk Way', 2),
('Milk Way', 3),
('Milk Way', 4),
('Milk Way', 5),
('Milk Way', 6);