-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL 
);

CREATE TABLE planetary_orbits
(
  id  SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT NOT NULL REFERENCES planetary_orbits(id),
  galaxy INT NOT NULL REFERENCES galaxies(id),
  has_moons BOOLEAN DEFAULT false
);

INSERT INTO galaxies
(name)
VALUES
('Milky Way');

INSERT INTO planetary_orbits
(name)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, has_moons)
VALUES
  ('Earth', 1.00, 1, 1, true),
  ('Mars', 1.88, 1, 1,true),
  ('Venus', 0.62, 1, 1, false),
  ('Neptune', 164.8, 1, 1, true),
  ('Proxima Centauri b', 0.03, 2, 1, false),
  ('Gliese 876 b', 0.23, 3, 1, false);


CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_around INT REFERENCES planets(id)
);

INSERT INTO moons
(name,orbits_around)
VALUES
('Luna',1),
('Phobos',2),
('Deimos',2),
('Naiad',4),
('Thalassa',4),
('Despina',4),
('Galatea',4),
('Larissa',4),
('"S/2004 N 1"',4),
('Proteus',4),
('Triton',4),
('Nereid',4),
('Halimede',4),
('Sao',4),
('Laomedeia',4),
('Psamathe',4),
('Neso',4);