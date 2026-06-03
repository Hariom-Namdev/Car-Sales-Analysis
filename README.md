# 🚗 Car Sales Analysis Using SQL

## 📌 Project Overview 

This project analyzes a large scale car sales dataset using PostgreSQL. The objective is to perform data cleaning, explore sales patterns, and generate business insights related to vehicle pricing, manufacturers, states, body types, and sales performance.

The project demonstrates practical SQL skills commonly used by Data Analysts, including:

- Data Cleaning
- Data Validation
- Aggregate Functions
- Grouping and Filtering
- Business Analysis
- Revenue Analysis
- Conditional Logic
 
---

## 📊 Dataset Information

The dataset contains vehicle sales records with information such as:

| Column Name | Description |
|------------|-------------|
| car_id | Unique identifier for each vehicle |
| year | Manufacturing year |
| make | Vehicle manufacturer |
| model | Vehicle model |
| trim | Vehicle trim level |
| body | Vehicle body type |
| transmission | Transmission type |
| vin | Vehicle Identification Number |
| state | State where the vehicle was sold |
| condition | Vehicle condition score |
| odometer | Mileage reading |
| color | Exterior color |
| interior | Interior color |
| seller | Seller information |
| mmr | Market valuation price |
| sellingprice | Actual selling price |
| saledate | Sale date |

---

## 🧹 Data Cleaning Process

Several data quality checks and cleaning operations were performed before analysis.

### Null Value Analysis

- Checked NULL values across all columns.
- Identified missing records before analysis.

### Blank Value Detection

- Checked blank values in:
  - Make
  - Model
  - Transmission
  - Color
  - Interior

### Missing Value Handling

Replaced missing values with:

| Column | Replacement Value |
|----------|------------------|
| transmission | Unknown |
| color | Unknown |
| interior | Unknown |
| body | Unknown |
| trim | Unknown |
| condition | 0 |

### Invalid Record Removal

Removed records where:

- VIN is NULL
- MMR is NULL
- Odometer is NULL
- Make is NULL
- Model is NULL
- Selling Price is NULL

---

## 🔍 Business Questions Solved

### Basic Analysis

- Display cars sold above a specific price.
- Find vehicles manufactured after a given year.
- Identify the top 10 most expensive vehicles.
- Analyze vehicles sold in specific states.
- Filter vehicles based on odometer readings.
- Analyze vehicles by manufacturer.
- Explore transmission-based sales.
- Filter vehicles using MMR values.

### Aggregate Analysis

- Calculate total revenue generated.
- Find average vehicle selling price.
- Count vehicles sold by manufacturer.
- Calculate revenue by state.
- Determine state wise sales volume.
- Analyze average odometer readings by manufacturer.
- Find highest and lowest selling prices by manufacturer.

### Business Insights

- Manufacturers selling more than 1,000 vehicles.
- High revenue states.
- High value vehicle body types.
- Manufacturers with premium average selling prices.
- Top revenuegenerating manufacturers.
- Highest selling states.
- Most profitable vehicle body types.
- Comparison of MMR and Selling Price.
- Vehicle classification using CASE statements.

---

## 🛠 SQL Concepts Used

### Data Definition Language (DDL)



CREATE TABLE
DROP TABLE


### Data Manipulation Language (DML)



COPY
UPDATE
DELETE


### Data Query Language (DQL)



SELECT
WHERE
ORDER BY
LIMIT


### Aggregate Functions



COUNT()
SUM()
AVG()
MIN()
MAX()
ROUND()


### Grouping & Filtering



GROUP BY
HAVING
DISTINCT


### Conditional Logic



CASE
WHEN
THEN
ELSE
END


---

## 📈 Key Insights

- Identified top performing manufacturers based on revenue.
- Analyzed state wise sales performance.
- Compared actual selling prices against market valuation (MMR).
- Categorized vehicles into pricing segments.
- Evaluated body types generating the highest revenue.
- Improved dataset quality through data cleaning techniques.

---

## 💻 Tools Used

- PostgreSQL
- pgAdmin 4
- SQL
- CSV Dataset


---

## 👨‍💻 Author

**Hariom Namdev**
