-- CREATING THE CAR SALES DATA TABLE
CREATE TABLE car_sales (
    car_id SERIAL PRIMARY KEY,
    year INT,
    make VARCHAR(100),
    model VARCHAR(150),
    trim VARCHAR(150),
    body VARCHAR(100),
    transmission VARCHAR(50),
    vin VARCHAR(50),
    state VARCHAR(100),
    condition NUMERIC(5,2),
    odometer NUMERIC(12,2),
    color VARCHAR(50),
    interior VARCHAR(50),
    seller VARCHAR(255),
    mmr NUMERIC(12,2),
    sellingprice NUMERIC(12,2),
    saledate TEXT
);

-- INSERTING THE DATA INTO TABLE 

COPY car_sales(
    year,
    make,
    model,
    trim,
    body,
    transmission,
    vin,
    state,
    condition,
    odometer,
    color,
    interior,
    seller,
    mmr,
    sellingprice,
    saledate
)
FROM 'D:\DATA ANALYST\SQL FILES\PROJECTs\Car Sales Analysis\car_sales_data.csv'
CSV HEADER;

SELECT TRIM FROM car_sales;


-- DATA CLEANING

-- 1. CHECKING NULL VALUES

SELECT
    COUNT(*) - COUNT(year) AS year_nulls,
    COUNT(*) - COUNT(make) AS make_nulls,
    COUNT(*) - COUNT(model) AS model_nulls,
    COUNT(*) - COUNT(trim) AS trim_nulls,
    COUNT(*) - COUNT(body) AS body_nulls,
    COUNT(*) - COUNT(transmission) AS transmission_nulls,
    COUNT(*) - COUNT(vin) AS vin_nulls,
    COUNT(*) - COUNT(state) AS state_nulls,
    COUNT(*) - COUNT(condition) AS condition_nulls,
    COUNT(*) - COUNT(odometer) AS odometer_nulls,
    COUNT(*) - COUNT(color) AS color_nulls,
    COUNT(*) - COUNT(interior) AS interior_nulls,
    COUNT(*) - COUNT(seller) AS seller_nulls,
    COUNT(*) - COUNT(mmr) AS mmr_nulls,
    COUNT(*) - COUNT(sellingprice) AS sellingprice_nulls,
    COUNT(*) - COUNT(saledate) AS saledate_nulls
FROM car_sales;

-- 2. CHECKING BLANK VALUES

SELECT *
FROM car_sales
WHERE TRIM(make) = ''
   OR TRIM(model) = ''
   OR TRIM(transmission) = ''
   OR TRIM(color) = ''
   OR TRIM(interior) = '';

-- 3. REPLACING MISSING VALUES

UPDATE car_sales
SET transmission = 'Unknown'
WHERE transmission IS NULL
   OR TRIM(transmission) = '';

UPDATE car_sales
SET color = 'Unknown'
WHERE color IS NULL
   OR TRIM(color) = '';

UPDATE car_sales
SET interior = 'Unknown'
WHERE interior IS NULL
   OR TRIM(interior) = '';

UPDATE car_sales
SET condition = 0
WHERE condition IS NULL;

UPDATE car_sales
SET body = 'Unknown'
WHERE body IS NULL;

UPDATE car_sales
SET trim = 'Unknown'
WHERE trim IS NULL;

DELETE FROM car_sales
WHERE vin IS NULL;

DELETE FROM car_sales
WHERE mmr IS NULL;

DELETE FROM car_sales
WHERE odometer IS NULL;

-- 4. REMOVING INVALID RECORDS

DELETE FROM car_sales
WHERE make IS NULL
   OR model IS NULL
   OR sellingprice IS NULL;

-- 5. VERIFY DATA AFTER CLEANING

SELECT COUNT(*)
FROM car_sales;

SELECT *
FROM car_sales;

LIMIT 200;

-- BUSINESS ANALYSIS

-- Q1. Display all cars sold for more than 100000.
SELECT car_id,make,model,sellingprice
	FROM car_sales
WHERE sellingprice > 100000
ORDER BY car_id ASC;

-- Q2. Find all cars manufactured after 2014.
SELECT carSELECT car_id,make,model,
	year AS manufactured_YEAR
		FROM car_sales
WHERE year > 2014
ORDER BY car_id ASC;

-- Q3. Show the top 10 most expensive cars based on selling price.
SELECT car_id,make,model,sellingprice
		FROM car_sales
ORDER BY sellingprice DESC
	LIMIT 10;

-- Q4. Find all cars sold in California (CA).
SELECT car_id,make,model,sellingprice
		FROM car_sales
WHERE state = 'ca';

-- Q5. Display all cars with an odometer reading greater than 1000.
SELECT car_id,make,model,odometer
		FROM car_sales
WHERE odometer > 1000
ORDER BY car_id ASC;
	
-- Q6. Find all kia vehicles in the dataset.
SELECT car_id,make,model
	 FROM car_sales
	WHERE make = 'kia'
ORDER BY car_id ASC;
	
-- Q7. Display all vehicles with automatic transmission.
SELECT car_id,make,model,sellingprice,transmission
		FROM car_sales
	WHERE transmission = 'automatic'
ORDER BY car_id ASC;

-- Q8. Find cars whose MMR is greater than 20000.
SELECT car_id,make,model,mmr,transmission
	FROM car_sales
	WHERE mmr > 20000
ORDER BY car_id ASC;

-- Q9. Show all Audi in the dataset.
SELECT car_id,make,model,mmr
	FROM car_sales
	WHERE make = 'Audi'
ORDER BY car_id ASC;

-- Q10. Display vehicles ordered by selling price in descending order.
SELECT car_id,make,model,sellingprice
	FROM car_sales
ORDER BY sellingprice DESC;

-- Q11. Calculate the total revenue generated from all car sales.
SELECT SUM(sellingprice) AS total_revenue
		FROM car_sales;
		
-- Q12. Find the average selling price of all vehicles.
SELECT ROUND(AVG(sellingprice),2) AS total_revenue
		FROM car_sales;
		
-- Q13. Calculate the total number of cars sold for each manufacturer.
SELECT DISTINCT make, 
	COUNT(sellingprice) AS car_sold
FROM car_sales
GROUP BY make;

-- Q14. Find the average selling price for each car make.
SELECT DISTINCT make, 
	ROUND(AVG(sellingprice),2) AS avg_car_sold
FROM car_sales
GROUP BY make;

-- Q15. Calculate total revenue generated by each state.
SELECT DISTINCT state, 
	ROUND(SUM(sellingprice),2) AS state_revenue
FROM car_sales
GROUP BY state;

-- Q16. Find the total number of vehicles sold in each state.
SELECT DISTINCT state, 
	COUNT(sellingprice) AS vechicle_sold
FROM car_sales
GROUP BY state;

-- Q17. Calculate the average odometer reading for each manufacturer.
SELECT DISTINCT make, 
	ROUND(AVG(odometer),2) AS avg_reading
FROM car_sales
GROUP BY make;

-- Q18. Find the highest selling price for each manufacturer.
SELECT DISTINCT make, 
	ROUND(MAX(sellingprice),2) AS high_selling_price
FROM car_sales
GROUP BY make;

-- Q19. Find the lowest selling price for each manufacturer.
SELECT DISTINCT make, 
	ROUND(MIN(sellingprice),2) AS high_selling_price
FROM car_sales
GROUP BY make;

-- Q20. Calculate the total revenue generated by each vehicle body type.
SELECT DISTINCT body, 
	ROUND(SUM(sellingprice),2) AS total_revenue
FROM car_sales
GROUP BY body;

-- Q21. Find manufacturers that sold more than 1,000 vehicles.
SELECT DISTINCT make, 
	COUNT(sellingprice) AS num_of_carsale
FROM car_sales
GROUP BY make
HAVING COUNT(sellingprice) > 1000;

-- Q22. Find states that generated more than 10000 in revenue.
SELECT DISTINCT state, 
	SUM(sellingprice) AS revenue
FROM car_sales
GROUP BY state
HAVING COUNT(sellingprice) > 10000;

-- Q23. Find vehicle body types with an average selling price above 20000.
SELECT DISTINCT body, 
	ROUND(AVG(sellingprice),2) AS avg_car_sold
FROM car_sales
GROUP BY body
HAVING AVG(sellingprice) > 20000;

-- Q24. Find manufacturers whose average selling price exceeds 20000.
SELECT DISTINCT make, 
	ROUND(AVG(sellingprice),2) AS avg_car_sold
FROM car_sales
GROUP BY make
HAVING AVG(sellingprice) > 20000;

-- Q25. Identify states where more than 500 vehicles were sold.
SELECT state,COUNT(sellingprice) AS sp
	FROM car_sales
GROUP BY state
HAVING COUNT(sellingprice) > 500;

-- Q26. Which manufacturer generated the highest total revenue?
SELECT make,SUM(sellingprice) AS sp
	FROM car_sales
GROUP BY make
ORDER BY sp DESC
LIMIT 1;

-- Q27. Which state sold the highest number of vehicles?
SELECT state,COUNT(sellingprice) AS sp
	FROM car_sales
GROUP BY state
ORDER BY sp DESC
LIMIT 1;

-- Q28. Which vehicle body type generated the highest revenue?
SELECT body,SUM(sellingprice) AS sp
	FROM car_sales
GROUP BY body
ORDER BY sp DESC
LIMIT 1;

-- Q29. Calculate the difference between MMR and selling price for each vehicle.
SELECT car_id,
       make,
       model,
       mmr,
       sellingprice,
       mmr - sellingprice AS diff
FROM car_sales;

-- Q30. Categorize vehicles into:
--      Budget Car
--      Mid-Range Car
--      Premium Car
--      using CASE statements based on selling price.

SELECT DISTINCT make,
		CASE
			WHEN sellingprice < 100000 THEN 'BUDGET CAR'
			WHEN sellingprice BETWEEN 100000 AND 200000 THEN 'MID RANGE CAR'
			ELSE 'PREMIUM CAR'
		END AS car_category
FROM car_sales;