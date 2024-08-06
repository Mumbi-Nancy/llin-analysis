CREATE DATABASE llin_analaysis;  -- Create a new database named 'llin_analysis'

-- Select the 'llin_analysis' database for use
USE llin_analaysis;

-- Create a table named 'llin distribution' 
CREATE TABLE llin_distributions(
	id INT AUTO_INCREMENT PRIMARY KEY,
    number_distributed INT,
    location VARCHAR(50),
    country VARCHAR(50),
    year YEAR,
    by_whom VARCHAR(50),
    country_code VARCHAR(10)
);
    
-- Select all records from the 'llin distribution' table
SELECT * FROM llin_distributions;

# Descriptive Stats
-- total number of LLINs distributed in each country
SELECT 
	country,
    SUM(number_distributed) AS total_llins_distributed
FROM 
    llin_distributions
GROUP BY 
    country;

-- average number  of LLINs distributed per distribution event.
SELECT 
    AVG(number_distributed) AS average_number_distributed
FROM 
    llin_distributions;


-- earliest and latest distribution dates
SELECT 
    MIN(year) AS earliest_date,
    MAX(year) AS latest_date
FROM 
	llin_distributions;


-- trends and patterns 
-- total number of LLINs distributed by each organization
SELECT 
    by_whom, 
    SUM(number_distributed) AS total_number_distributed
FROM 
    llin_distributions
GROUP BY 
    by_whom;

-- total number of LLINs distributed in each year

SELECT 
    year, 
    SUM(number_distributed) AS number_distributed
FROM 
    llin_distributions
GROUP BY 
    year;


-- locations with the highest and lowest number of LLINs distributed. 
SELECT 
    location, 
    SUM(number_distributed) AS total_number_distributed
FROM 
    llin_distributions
GROUP BY 
    location
ORDER BY 
    total_number_distributed DESC
LIMIT 1;

SELECT 
    location, 
    SUM(number_distributed) AS total_number_distributed
FROM 
    llin_distributions
GROUP BY 
    location
ORDER BY 
    total_number_distributed ASC
LIMIT 1;



    
	
