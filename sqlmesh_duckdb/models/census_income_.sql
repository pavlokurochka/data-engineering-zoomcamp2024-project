MODEL (
  name preparers.census_income_,
  kind VIEW
);

SELECT
	right (geo_id,
	5) zip_code,
	est_households_total,
	est_households_med_income,
	try_cast( regexp_replace(regexp_replace(est_households_med_income,
	'[^0-9]+',
	''),
	'\+|\-',
	'') as bigint) est_households_med_income_,
	est_households_mean_income,
	try_cast( regexp_replace(regexp_replace(est_households_mean_income,
	'[^0-9]+',
	''),
	'\+|\-',
	'') as bigint) est_households_mean_income_
FROM
	raw.census_income;
