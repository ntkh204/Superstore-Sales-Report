--Create the superstore_orders table

IF OBJECT_ID('superstore_orders') IS NOT NULL DROP TABLE superstore_orders

CREATE TABLE superstore_orders
(
	row_id INT IDENTITY(1,1),
	order_id VARCHAR(50), 
	order_date DATE, 
	ship_date DATE, 
	ship_mode VARCHAR(50), 
	customer_id VARCHAR(50), 
	customer_name VARCHAR(100),
	segment VARCHAR(50), 
	country VARCHAR(50), 
	city VARCHAR(50), 
	state VARCHAR(50), 
	postal_code INT, 
	region VARCHAR(50),
	product_id VARCHAR(50), 
	category VARCHAR(50),
	sub_category VARCHAR(50), 
	product_name VARCHAR(255), 
	sales DECIMAL(10, 2), 
	quantity INT, 
	discount DECIMAL(10, 2),
	profit DECIMAL(10, 2) 
)

--SELECT * FROM superstore_orders

-- Create the superstore_returns table

IF OBJECT_ID('superstore_returns') IS NOT NULL DROP TABLE superstore_returns

CREATE TABLE superstore_returns
(
    returned NVARCHAR(3),
    order_id VARCHAR(50)
)

--SELECT * FROM  superstore_returns

--Import the Data in 2 tables

BULK INSERT superstore_orders
FROM 'C:\Users\Asus\OneDrive\Desktop\Supestore Sales Analysis\Superstore Orders.csv'
WITH (FORMAT='CSV')

--SELECT * FROM superstore_orders

BULK INSERT superstore_returns
FROM 'C:\Users\Asus\OneDrive\Desktop\Supestore Sales Analysis\Superstore Returns.csv'
WITH (FORMAT='CSV')

--SELECT * FROM superstore_returns

--Create the view that we need 

--DROP VIEW superstore_excel_input

CREATE VIEW superstore_excel_input AS

SELECT
	o.order_id,
    YEAR(o.order_date) AS year,
    o.segment,
    o.state,
    o.region,
    o.category,
    o.sales,
    o.profit,
    r.returned
FROM superstore_orders o
LEFT JOIN superstore_returns r ON o.order_id = r.order_id

--SELECT * FROM superstore_excel_input

--Create a Store Procedure

CREATE PROCEDURE superstore_excel_input_daily AS

IF OBJECT_ID('superstore_orders') IS NOT NULL DROP TABLE superstore_orders

CREATE TABLE superstore_orders
(
	row_id INT IDENTITY(1,1),
	order_id VARCHAR(50), 
	order_date DATE, 
	ship_date DATE, 
	ship_mode VARCHAR(50), 
	customer_id VARCHAR(50), 
	customer_name VARCHAR(100),
	segment VARCHAR(50), 
	country VARCHAR(50), 
	city VARCHAR(50), 
	state VARCHAR(50), 
	postal_code INT, 
	region VARCHAR(50),
	product_id VARCHAR(50), 
	category VARCHAR(50),
	sub_category VARCHAR(50), 
	product_name VARCHAR(255), 
	sales DECIMAL(10, 2), 
	quantity INT, 
	discount DECIMAL(10, 2),
	profit DECIMAL(10, 2) 
)

IF OBJECT_ID('superstore_returns') IS NOT NULL DROP TABLE superstore_returns

CREATE TABLE superstore_returns
(
    returned NVARCHAR(3),
    order_id VARCHAR(50)
)

BULK INSERT superstore_orders
FROM 'C:\Users\Asus\OneDrive\Desktop\Supestore Sales Analysis\Superstore Orders.csv'
WITH (FORMAT='CSV')

BULK INSERT superstore_returns
FROM 'C:\Users\Asus\OneDrive\Desktop\Supestore Sales Analysis\Superstore Returns.csv'
WITH (FORMAT='CSV')

--EXEC superstore_excel_input_daily