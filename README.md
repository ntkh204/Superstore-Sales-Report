**SUPERSTORE SALES REPORT**

**1. Introduction**

This document explains the development of a Sales Report for the Superstore's Sales Manager. The report leverages a database designed to track sales, profit, and return data, enabling the Sales Manager to gain valuable insights into company performance.

**2. Build database**

A database named "Superstore DB" was created using SQL Server to manage sales data. This database includes two primary tables:
superstore_orders: Stores order details like row_id , order_id, order_date, ship_date, ship_mode, customer_id, customer_name, segment, country, city, state, postal_code, region, product_id, category, sub_category, product_name, sales, quantity, discount, profit
superstore_return: Tracks order returns with fields like returned, order_id.

After carefully mapping the data fields, I imported the information from a CSV file to populate the newly created tables

**3. Data Access and Automation**

- I created a view named "superstore_excel_input" to filter the data from the 'superstore_orders' and 'superstore_return' tables before importing them. This would ensure the data imported into Power BI is in the desired format for analysis.

- To ensure data freshness, a stored procedure automates the process of replicating table structures and importing data from CSV files. This procedure includes error handling to address potential import issues.

- A daily job is scheduled to automatically run the stored procedure at 7:00 AM, guaranteeing reports are updated whenever the CSV file is refreshed.

**4. Sales Report**

The Sales Report provides the Sales Manager with a comprehensive view of company performance through:

- Key Sales Metrics: Track overall sales trends, identify sales strengths by region/product/customer, analyze profitability, and monitor return rates.

- Data Visualization: Charts and graphs visually represent key metrics, making it easier to identify trends and patterns.

- Actionable Insights: The data-driven approach empowers the Sales Manager to develop targeted marketing campaigns, focus resources on high-performing products, and implement strategies to improve product quality or customer satisfaction (potentially leading to reduced returns).
  
Link Report: https://app.powerbi.com/view?r=eyJrIjoiMDE5YjZmZDAtMzE5OS00MWY5LTk2NjItYzVkZjkyYTdhZTE4IiwidCI6Ijk0YjQzYWQzLTQ3MDgtNDA2MS04OGI4LTllMDFmNjNhNTJhZSIsImMiOjEwfQ%3D%3D
