---
title: "Projects"
date: 2024-03-19
draft: false
---

# Featured Projects

## Data Engineering: Metro-bikeshare
*29-03-2025*

### Overview
This project is designed to extract, transform, and load (ETL) Metro Trips data from a CSV source to a Snowflake data warehouse. It utilizes Apache Airflow for orchestration, AWS S3 for intermediate storage, dbt for data transformation, Terraform for infrastructure automation, and Power BI for reporting and visualization. The goal of this workflow is to ensure data consistency, scalability, and efficient analytics for Metro Trips data processing.
### Technologies Used
- Apache Airflow: Manages and schedules the ETL pipeline.
- AWS S3: Temporary storage layer before transferring data to Snowflake.
- Snowflake: A scalable cloud-based data warehouse for storing raw and processed data.
- dbt (Data Build Tool): Transforms raw data into structured, analytics-ready datasets.
- Terraform: Infrastructure as Code (IaC) tool used for provisioning AWS EC2 instances to run Airflow.
- Power BI: Creates dynamic dashboards for data visualization and business intelligence.


### Key Features
- Extracting raw data from source and processing data for storage in AWS S3
- Storing data in snowflake warehouse
- Transformation of raw data into structured data 
- Creating dashboards to present the findings

### Links
- [GitHub Repository](https://github.com/codac-black/metro-bikeshare.git)


## Procurement KPI Analysis: Procurement KPI Analysis
*29/05/2025*

### Overview
A deep dive into procurement operations using real-world purchase order data (2022–2023), empowering businesses with insights on supplier performance, cost efficiency, delivery trends, and risk mitigation.

### Technologies Used
- Python

### Key Features
- 📌 Supplier performance benchmarking
- 📉 Cost savings prediction via ML
- 🔍 Defect & compliance tracking
- 📊 KPI dashboard visualizations
- 🔮 Price trend forecasting
- 🔥 High-risk supplier detection

### Links
- [GitHub Repository](https://github.com/codac-black/Data-Analytics-Projects.git)

## Kenya Airways Review: Kenya Airways Customer Review Analysis
*12/03/2025*

### Overview
This project analyzes customer reviews of Kenya Airways collected from Airline Quality to provide insights into passenger satisfaction, service quality metrics, and trends over time. The analysis helps identify strengths, weaknesses, and improvement opportunities for Kenya Airways' services.
### Technologies Used
- Data Collection: Python, BeautifulSoup, Requests
- Data Processing: Pandas, NumPy
- Data Visualization: Tableau Public
- Geospatial Analysis: Integration with Mapbox via Tableau

### Key Features
- Collects basic review information (title, reviewer name, date, etc.)
- Extracts ratings for specific service aspects (seat comfort, staff service, etc.)
- Records reviewer metadata (traveler type, seat class, route, etc.)
- Captures reviewer location data for geographical analysis

### Links
- [GitHub Repository](https://github.com/codac-black/kenya-airways-review.git)
- [Live Demo](https://public.tableau.com/views/kenyaairwaysreview/Dashboard1) 