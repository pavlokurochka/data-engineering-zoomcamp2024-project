MODEL (
	name preparer_dataset.census_income_,
	kind VIEW
);

SELECT
	RIGHT(`geo_id`, 5) AS `zip_code`,
	`est_households_total`,
	`est_households_med_income`,
	SAFE_CAST(
		REGEXP_REPLACE(`est_households_med_income`, '[^0-9]+', '') AS INT64
	) AS `est_households_med_income_`,
	`est_households_mean_income`,
	SAFE_CAST(
		REGEXP_REPLACE(`est_households_mean_income`, '[^0-9]+', '') AS INT64
	) AS `est_households_mean_income_`
FROM
	`preparer_dataset`.`census_income`;