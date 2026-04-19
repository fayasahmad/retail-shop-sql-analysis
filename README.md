# Retail Shop Sales Analysis — SQL Project

## Overview
This project performs end-to-end analysis of a retail shop's transaction data using PostgreSQL. It covers database setup, data cleaning, exploratory data analysis (EDA), and answers to 10 real-world business questions using SQL queries.

---

## Database & Table Structure
- **Database:** `retail_shop_database`
- **Table:** `sales_table`

| Column | Type |
|---|---|
| transactions_id | INT (Primary Key) |
| sale_date | DATE |
| sale_time | TIME |
| customer_id | INT |
| gender | VARCHAR(15) |
| age | INT |
| category | VARCHAR(15) |
| quantity | INT |
| price_per_unit | FLOAT |
| cogs | FLOAT |
| total_sale | FLOAT |

---

## Project Workflow

### 1. Data Cleaning
- Identified NULL values across all columns
- Removed rows containing NULL values to ensure data integrity

### 2. Data Exploration
- Total number of sales transactions
- Count of unique customers
- Number and names of distinct product categories

### 3. Business Questions Answered

| # | Question |
|---|---|
| Q1 | Retrieve all sales made on a specific date (2022-11-05) |
| Q2 | Find clothing transactions with quantity ≥ 4 in November 2022 |
| Q3 | Calculate total sales by category |
| Q4 | Find the average age of customers who purchased from the Beauty category |
| Q5 | List all transactions where total_sale > 1000 |
| Q6 | Count transactions by gender and category |
| Q7 | Find the best-selling month in each year by average sales |
| Q8 | Identify the top 5 customers by total sales |
| Q9 | Count unique customers per product category |
| Q10 | Classify orders into Morning, Afternoon, and Evening shifts |

---

## Key SQL Concepts Used
- DDL: `CREATE TABLE`, `DROP TABLE`
- DML: `SELECT`, `DELETE`
- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`, `ROUND()`
- Window functions: `RANK() OVER (PARTITION BY ...)`
- CTEs: `WITH ... AS (...)`
- Date/time functions: `EXTRACT()`, `TO_CHAR()`
- Conditional logic: `CASE WHEN`
- Filtering & grouping: `WHERE`, `GROUP BY`, `ORDER BY`, `HAVING`

---

## Tools & Technologies
- **Database:** PostgreSQL
- **Query Language:** SQL
- **IDE:** pgAdmin / any SQL client

---

## How to Run
1. Open your PostgreSQL client (e.g., pgAdmin or psql)
2. Run `CREATE DATABASE retail_shop_database;`
3. Connect to the database
4. Create the `sales_table` using the provided DDL
5. Import your sales dataset into the table
6. Execute the queries in order to reproduce the analysis

---

## Project Structure
```
retail-shop-sql-analysis/
│
├── retail_shop_analysis.sql   # Main SQL file with all queries
└── README.md                  # Project documentation
```

---

## Author
> Feel free to connect and share feedback!

---

## License
This project is open source 
