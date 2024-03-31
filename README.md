# Introduction

This is final project for Data Engineering Zoomcamp 2024.

## Problem description

This is a proof of concept project to build a data engineering infrastructure that would execute a pipeline from downloaded datasets to analytical dashboard.

Back in 2018 I had a client on Upwork that commissioned a web scraping script to download US tax preparer data from the  [Directory of Federal Tax Return Preparers with Credentials and Select Qualifications](https://irs.treasury.gov/rpo/rpo.jsf). That script involved a lengthy process facilitated by Selenium driving foreground Chrome sessions. I had an idea to use that dataset for this project combining it with [US Census: Income in the Past 12 Months (in 2022 Inflation-Adjusted Dollars)](https://data.census.gov/table?q=median%20income&g=010XX00US$8600000&y=2022) to build a dashboard that would analyze the potential market for tax preparers in California.

Because initial process of obtaining these datasets is quite interactive for the purpose of this exercise I saved raw datasets into a separate public repository: [US Tax Preparers Dataset](https://github.com/pavlokurochka/us_tax_preparers).

## Technologies

- **Cloud**: GCP: Compute Engine VM

- **Infrastructure as code (IaC)**: Terraform, Docker

- **Workflow orchestration**: Kestra

- **Data Warehouse**: BigQuery (mock up development in DuckDB)

- **Batch processing**: SQLMesh, Python.

- **Dashboard**: Looker Studio



## Data ingestion (batch) & Workflow orchestration

The pipeline runs in a single Kestra flow in a Kestra docker container that runs on Compute Engine VM.

![flow diagram snapshot]()

### Transformations  tasks description

## Transformations (SQLMesh, Python.)

- Used python to remove unused columns and SQLMesh to create staging views (the idea is to process anything there) and finally a fact view named households_per_preparer_ca.

## Dashboard

- Used Google Data Studio to visualize data and create 2 tiles. Visit [Local Tax Preparation Market Analysis](https://lookerstudio.google.com/reporting/28a6e87a-edf2-401d-9ce2-8f20108768c0/page/hewuD).

