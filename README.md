# 🛒 Retail Data Engineering Pipeline using AWS S3, Databricks & dbt

![Databricks](https://img.shields.io/badge/Databricks-Data%20Engineering-red)
![dbt](https://img.shields.io/badge/dbt-Transformation-orange)
![AWS S3](https://img.shields.io/badge/AWS-S3-yellow)
![PySpark](https://img.shields.io/badge/PySpark-Big%20Data-blue)
![Delta Lake](https://img.shields.io/badge/Delta-Lake-green)

## 📌 Project Overview

This project demonstrates an end-to-end **Modern Data Engineering Pipeline** built using **AWS S3**, **Databricks**, **PySpark**, **Delta Lake**, and **dbt** following the **Medallion Architecture (Bronze → Silver → Gold)**.

The pipeline automatically ingests retail sales data from AWS S3 using Databricks Auto Loader, performs data cleaning and transformation using dbt, applies data quality tests, maintains historical data with snapshots, and prepares analytics-ready datasets using a Star Schema.

---

# 🏗️ Architecture

```
                AWS S3
                   │
                   ▼
          Databricks Auto Loader
                   │
                   ▼
            Bronze Layer (Raw)
                   │
                   ▼
        dbt Transformation Layer
                   │
        ┌──────────┼──────────┐
        ▼                     ▼
   Silver Layer          Snapshots
                   │
                   ▼
             Gold Layer
        (Star Schema Model)
                   │
                   ▼
          Business Analytics
             (Power BI)
```

---

# 🚀 Tech Stack

| Technology | Purpose |
|------------|----------|
| AWS S3 | Data Storage |
| Databricks | Data Processing |
| Auto Loader | Incremental File Ingestion |
| Delta Lake | Data Storage Format |
| PySpark | Data Processing |
| dbt | Data Transformation |
| SQL | Data Modeling |
| Git & GitHub | Version Control |
| Power BI | Data Visualization |

---

# 📂 Project Structure

```
Retail_Data_Engineering/
│
├── models/
│   ├── bronze_layer/
│   ├── silver_layer/
│   └── gold_layer/
│
├── snapshots/
│
├── macros/
│   └── generic_tests/
│
├── seeds/
│
├── tests/
│
├── dbt_project.yml
├── packages.yml
├── profiles.yml
└── README.md
```

---

# 📊 Medallion Architecture

## 🥉 Bronze Layer

Raw data is ingested from AWS S3 using Databricks Auto Loader.

Features:

- Streaming ingestion
- Schema inference
- Checkpointing
- Incremental file processing
- Delta Tables

---

## 🥈 Silver Layer

Business-ready cleaned data.

Transformations include:

- Data Type Casting
- Remove Null Values
- Trim Spaces
- Standardize Text
- Data Validation
- Incremental Models

---

## 🥇 Gold Layer

Business analytics layer built using Star Schema.

### Dimension Tables

- Dim Customer
- Dim Product
- Dim Store
- Dim Date

### Fact Table

- Fact Sales

---

# ⭐ Star Schema

```
               Dim Customer
                     │
                     │
Dim Product ─── Fact Sales ─── Dim Date
                     │
                     │
               Dim Store
```

---

# ⚡ dbt Features Used

✔ Sources

✔ Incremental Models

✔ Generic Tests

✔ Snapshots

✔ Schema Tests

✔ Documentation

✔ Materializations

✔ Macros

✔ dbt-utils Package

---

# 🔄 Incremental Processing

The project uses dbt Incremental Models to process only new or updated records.

Benefits:

- Faster Execution
- Lower Compute Cost
- Reduced Processing Time

---

# 📸 Snapshots

Snapshots are implemented for slowly changing data.

Current Snapshot:

- Customer Snapshot

Tracks changes in:

- Email
- City

---

# ✅ Data Quality Tests

Implemented using dbt Generic Tests.

Examples:

- Not Null
- Unique
- Valid Email
- Positive Values
- Accepted Values

---

# 📁 Dataset

Retail Dataset includes:

- Customers
- Products
- Categories
- Stores
- Suppliers
- Inventory
- Orders
- Order Items
- Payments

---

# 🔥 Key Features

- End-to-End Data Engineering Pipeline
- Medallion Architecture
- Star Schema Data Warehouse
- Auto Loader Streaming
- Incremental Loading
- Historical Data Tracking
- Generic Data Quality Tests
- Modular dbt Project
- Git Version Control

---

# 📈 Future Improvements

- Databricks Workflows
- GitHub Integration
- CI/CD Pipeline
- Power BI Dashboard
- Data Monitoring
- Dev / QA / Prod Environments
- Unity Catalog Integration

---

# 🎯 Learning Outcomes

This project demonstrates practical implementation of:

- Data Engineering
- Data Warehousing
- ETL/ELT Pipelines
- dbt
- Delta Lake
- Incremental Processing
- Data Quality Validation
- Dimensional Modeling
- Version Control

---

# 👨‍💻 Author

### Sameer Pawar

**Data Engineer | Data Analyst | GenAI Enthusiast**

LinkedIn: *https://www.linkedin.com/in/sameer-pawar-68ba97311?utm_source=share_via&utm_content=profile&utm_medium=member_android*
---

# ⭐ If you found this project useful, consider giving it a Star!
