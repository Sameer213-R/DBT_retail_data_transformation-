-- Databricks notebook source
-- MAGIC %md
-- MAGIC # validating's  the data in the gold layer

-- COMMAND ----------

use catalog retail_store_catlog;
use schema gold;

-- COMMAND ----------

select count(*) from dim_customer;

-- COMMAND ----------

select count(*) from dim_date;

-- COMMAND ----------

select count(*) from dim_product
where price < 1;

-- COMMAND ----------

select count(*) from dim_store;

-- COMMAND ----------

select distinct(order_status) from fact_table

-- COMMAND ----------

select * from fact_table 
where total_cost < 1 or  order_status not in ("PENDING","CANCELLED","COMPLETE");

-- COMMAND ----------

select email from dim_customer
where trim(email) like "%@gmail.com%"
and trim(email)  like"%@yahoo.com%" 
and trim(email) like "%@outlook.com%"