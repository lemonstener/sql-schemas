-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country INT REFERENCES countries(id)
);

CREATE TABLE passengers 
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  holder_id INT REFERENCES passengers(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INT REFERENCES airlines(id),
  dep_from INT REFERENCES cities(id),
  destination INT REFERENCES cities(id)
);

INSERT INTO airlines
(name)
VALUES 
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO passengers
(first_name,last_name)
VALUES
('Jennifer','Finch'),
('Thadeus','Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');

INSERT INTO countries
(name)
VALUES
('United States'),
('Japan'),
('United Kingdom'),
('Mexico'),
('France'),
('Morocco'),
('China'),
('UAE'),
('Brazil'),
('Chile');


INSERT INTO cities
(name,country)
VALUES
('Washington DC',1),
('Seattle',1),
('Los Angeles',1),
('Las Vegas',1),
('New York',1),
('Charlotte',1),
('Cedar Rapids',1),
('Chicago',1),
('New Orleans',1),
('Tokyo',2),
('London',3),
('Mexico City',4),
('Paris',5),
('Morocco',6),
('Dubai',8),
('Beijing',7),
('Sao Paolo',9),
('Santiago',10);

INSERT INTO tickets
  (holder_id, seat, departure, arrival, airline, dep_from, destination)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 7),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 12),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 13, 14),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 15, 16),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 5, 6),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 7, 8),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 15, 17),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 11);