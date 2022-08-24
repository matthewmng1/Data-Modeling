-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE seats
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  ticket_id INTEGER NOT NULL REFERENCES tickets(id)
);

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  ticket_id INTEGER NOT NULL REFERENCES tickets(id)
);

CREATE TABLE flight_info
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL,
  ticket_id INTEGER NOT NULL REFERENCES tickets(id)
);

INSERT INTO tickets
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

INSERT INTO seats
  (seat, ticket_id)
VALUES
  ('33B', 1),
  ('8A', 2),
  ('12F', 3),
  ('20A', 4),
  ('23D', 5),
  ('18C', 6),
  ('9E', 7),
  ('1A', 8),
  ('32B', 9),
  ('10D', 10);

INSERT INTO airline
  (name, ticket_id)
VALUES
  ('United', 1),
  ('British Airways', 2),
  ('Delta', 3),
  ('Delta', 4),
  ('TUI Fly Belgium', 5),
  ('Air China', 6),
  ('United', 7),
  ('American Airlines', 8),
  ('American Airlines', 9),
  ('Avianca Brasil', 10);

INSERT INTO flight_info
  (departure, arrival, from_city, from_country, to_city, to_country, ticket_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'Washington DC', 'United States', 'Seattle', 'United States', 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'Tokyo', 'Japan', 'London', 'United Kingdom', 2),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Los Angeles', 'United States', 'Las Vegas', 'United States', 3),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Seattle', 'United States', 'Mexico City', 'Mexico', 4),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'Paris', 'France', 'Casablanca', 'Morocco', 5),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Dubai', 'UAE', 'Beijing', 'China', 6),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'New York', 'United States', 'Charlotte', 'United States', 7),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'Cedar Rapids', 'United States', 'Chicago', 'United States', 8),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'Charlotte', 'United States', 'New Orleans', 'United States', 9),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile', 10);