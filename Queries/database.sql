-- Database can be created under ceratain specifications, but it is up to everyone to build the tables in order that serves the purpuse better.

-- Creating a DATABASE
-- DROP DATABASE gans;


CREATE DATABASE gans;

USE gans;


-- Creating the tables we need

-- cities table

-- DROP TABLE cities;

CREATE TABLE cities(
	city_id INT AUTO_INCREMENT NOT NULL UNIQUE,
    city_name VARCHAR(50),
    country_code VARCHAR(10),
    PRIMARY KEY (city_id)
);

-- DROP TABLE populations;
-- populations table
CREATE TABLE populations(
	city_id INT AUTO_INCREMENT NOT NULL UNIQUE,
    population INT,
   -- timestamp_population DATETIME,
	FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

-- weathers table
CREATE TABLE weathers(
	city_id INT AUTO_INCREMENT NOT NULL UNIQUE,
    forecast_time DATETIME,
    outlook VARCHAR(50),
    temperature FLOAT(6),
    temperature_feels_like FLOAT(6),
    wind_speed FLOAT(6),
    rain FLOAT(6),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);



-- cities_airports table
CREATE TABLE cities_airports(
	city_id INT AUTO_INCREMENT NOT NULL UNIQUE,
    airport_icao VARCHAR(10) UNIQUE,
    FOREIGN KEY (city_id) REFERENCES cities(city_id),
    FOREIGN KEY (airport_icao) REFERENCES airports(airport_icao)
);


-- airports table
CREATE TABLE airports(
    airport_icao VARCHAR(10) UNIQUE,
    airport_name VARCHAR(50),
    PRIMARY KEY (airport_icao)
);

-- flights table
CREATE TABLE flights(
	flight_id INT AUTO_INCREMENT NOT NULL UNIQUE,
    flight_num VARCHAR(50),
    departure_icao VARCHAR(10),
    arrival_icao VARCHAR(10),
    arrival_time DATETIME,
    PRIMARY KEY (flight_id),
    FOREIGN KEY (arrival_icao) REFERENCES airports(airport_icao)
);




-- SELECT * FROM weather_aws_table;


