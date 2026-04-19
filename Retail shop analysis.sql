-- Analysis of Retail shop using SQL -

CREATE DATABASE retail_shop_database;

-- Create the Table -
DROP TABLE IF EXISTS sales_table;
CREATE TABLE sales_table
	(
		transactions_id INT PRIMARY KEY,
		sale_date DATE,
		sale_time TIME,
		customer_id INT,
		gender VARCHAR(15),
		age INT,
		category VARCHAR(15),
		quantity INT,
		price_per_unit FLOAT,
		cogs FLOAT,
		total_sale FLOAT
	);

SELECT * FROM sales_table; 

SELECT
	COUNT(*)
FROM sales_table

-- DATA CLEANING -

-- Finding out Null Values -

SELECT * FROM sales_table WHERE sale_date IS NULL;

SELECT * FROM sales_table WHERE sale_time IS NULL;

SELECT * FROM sales_table WHERE customer_id IS NULL;

SELECT * FROM sales_table WHERE age IS NULL;

SELECT * FROM sales_table WHERE category IS NULL;

SELECT * FROM sales_table WHERE quantity IS NULL;

SELECT * FROM sales_table WHERE price_per_unit IS NULL;

SELECT * FROM sales_table WHERE cogs IS NULL;

SELECT * FROM sales_table WHERE total_sale IS NULL;


SELECT * FROM sales_table 
WHERE
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

-- Deleting Null Values -

DELETE FROM sales_table 
WHERE
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	customer_id IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

-- DATA EXPLORATION -

-- how many sales we have -

SELECT COUNT (*) AS total_sale FROM sales_table

-- how many unique customers we have -

SELECT COUNT(DISTINCT customer_id) AS total_sale FROM sales_table

-- how many categories we have -

SELECT COUNT(DISTINCT category) FROM sales_table
SELECT DISTINCT category FROM sales_table

--DATA ANALYSIS & BUSINESS KEY PROBLEMS & ANSWERS-

-- Q1. Write a SQL query to retrieve all the column for sales made on 2022-11-05-

SELECT * FROM sales_table WHERE sale_date = '2022-11-05';

-- Q2. Write a SQL query to retrieve all transactions where the category is clothing and the quantity is sold more than 4 in the month of Nov 2022

SELECT * FROM sales_table WHERE category = 'Clothing' AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11' AND quantity >= 4;


--Q3. Write a SQL query to calculate the total sales in each category

SELECT 
	category,
	SUM(total_sale),
	count(*)
FROM sales_table
GROUP BY category

--Q4. write a sql query for the average age of customers who purchased items from the beauty category

SELECT
	ROUND(AVG(age),2) as "average age"
FROM sales_table
WHERE category= 'Beauty'

--Q5. write a SQL query to find all transactions where the total_sale is greater than 1000

SELECT *
FROM sales_table
WHERE total_sale > 1000

--Q6. Write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category

SELECT
	category,
	gender,
	COUNT(*) as total_transactions
FROM sales_table
GROUP BY category , gender
ORDER BY category

--Q7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year 

SELECT * FROM
(
	SELECT
		EXTRACT(YEAR FROM sale_date) AS year,
		EXTRACT(MONTH FROM sale_date) AS month,
		ROUND(AVG(total_sale)) AS average_sale, 
		RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rank
	FROM sales_table
	GROUP BY year, month
) as t1
WHERE rank = 1;

--Q8. Write a SQL query to find the top 5 customers based on the highest total sales

SELECT
	customer_id,
	SUM(total_sale) AS total_sale
FROM sales_table
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5;

--Q9. Write the SQL query to find the number of unique customers who purchased items from each catagory

SELECT
	category,
	COUNT(DISTINCT customer_id) AS unique_customers
FROM sales_table
GROUP BY category

--Q10. Write the SQL query to create each shift and number of orders (Example morning <12, Afternoon 12 & 17, Evening >17)

WITH hourly_sale
AS
(
SELECT *,
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) <12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END AS shift
FROM sales_table
)
SELECT 
	shift,
	COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift


--END OF PROJECT
