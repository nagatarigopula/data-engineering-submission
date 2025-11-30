Data Engineering Assignment – End-to-End Pipeline:

This repository contains a complete data engineering solution built with Airflow, PostgreSQL, and dbt.
The goal is to take raw data files, load them into a warehouse, transform them into clean analytical models, and produce a final daily reporting table.

Everything in this repo is kept minimal and practical so it can be cloned and executed immediately.

1. Project Overview :

The pipeline covers three steps:

✓ Extraction & Loading (Airflow) :-

A custom Airflow DAG loads all raw CSV files into the raw schema in PostgreSQL.

Tables created:

-raw.listing

-raw.orders

-raw.orders_daily

-raw.org

-raw.outlet

-raw.platform

-raw.rank

-raw.ratings_agg

-raw.weather

✓ Transformations (dbt) :-

-dbt cleans, joins, and prepares the data into structured models:

-Staging models (one per raw table)

-Intermediate models (joins, enrichments, daily rollups)

-Final fact table:( public.fact_daily_reporting  )

✓ Output :-

The final table contains daily reporting metrics with weather-enriched listing performance.



2. Project Structure

   
data-engineering-submission/
│
├── dags/
│   ├── weather_fetch_dag.py           # Airflow DAG to load raw data & weather data
│   └── raw/                           # All raw CSV files used for loading
│
├── dbt_project/
│   ├── dbt_project.yml
│   ├── models/
│   │   ├── staging/
│   │   ├── intermediate/
│   │   └── marts/
│   ├── macros/
│   ├── tests/
│   ├── seeds/
│   └── snapshots/                     # Contains only .gitkeep
│
├── config/
├── plugins/
├── docker-compose.yaml                # Local Airflow + Postgres environment
├── requirements.txt                   # Python package dependencies (if used)
├── README.md
└── .gitignore


Only essential files are included—no logs, caches, screenshots, or system files.




3. How to Run the Project
   
Step 1 — Start Airflow + Postgres
docker compose up -d


This launches:

-Airflow scheduler

-Airflow webserver

-Airflow worker

-Postgres 13

-Redis

Visit Airflow UI: http://localhost:8080

Step 2 — Run the Raw Data Loading DAG

In Airflow, trigger: weather_fetch_dag


This will:

-Create raw tables in Postgres

-Load all CSVs from dags/raw/

-Fetch weather data (if configured)

-Load raw.weather

Once loaded, validate using:
psql -h 127.0.0.1 -U airflow -d airflow -c "\dt raw.*"


Step 3 — Run dbt Models

Move into the dbt project folder: cd dbt_project


Run all models: dbt run


Expected output:

-17 models built
0 errors
fact_daily_reporting materialized as a table


4. Final Output Table

-The main final table produced: public.fact_daily_reporting


It contains:

-Listing metadata

-Daily orders

-Platform & outlet info

-Ranking info

-Weather fields

-Aggregated performance metrics

This is the table intended for downstream analytics or BI dashboards.


5. Requirements:-

-Docker & Docker Compose

-Python 3.9+ (for dbt)

-dbt-postgres adapter

-PostgreSQL client tools (optional)

If needed, install dbt: pip install dbt-postgres



6. Notes:-

-All sensitive files, logs, macOS junk folders, and environment files have been removed.

-The repository is intentionally lean and contains only what is required to run the assignment end-to-end.

-The raw CSV files shipped here are exactly the same ones used during development.



7. Contact:-

If you need any clarification or want to discuss the solution, feel free to reach out.
