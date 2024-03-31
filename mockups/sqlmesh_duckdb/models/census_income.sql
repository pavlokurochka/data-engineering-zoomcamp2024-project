MODEL (
  name raw.census_income,
  kind VIEW
);

SELECT
    geo_id,
	est_households_total,
	est_households_med_income,
 	est_households_mean_income
FROM
	read_parquet('D:\data-engineering-zoomcamp2024-project\data\census_income_2022.parquet');
