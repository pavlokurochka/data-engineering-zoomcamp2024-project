--  Mock up in DuckDb
create or replace view census_income_2022 as
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
	read_parquet('D:\data-engineering-zoomcamp2024-project\data\census_income_2022.parquet');

SELECT
	* _
FROM
	preparers.main.census_income_2022
where
	est_households_total >0
	--	and est_households_med_income like '%,%'
order by
	est_households_total desc
	;
	
create or replace view preparer2024 as
SELECT
		substr(address,
	instr(address,
	',') + 2,
	2) state_code,
	trim(left(reverse(left( reverse(address),
	instr(reverse(address),
	',')-1)),
	6)) zip_code,
	full_name,
	first_name,
	last_name,
	credential,
	address,
	distance,
	IsDuplicateOf,
	taxrpo_name,
	taxrpo_credentials,
	taxrpo_dba,
	taxrpo_address,
	taxrpo_website,
	taxrpo_phone,
	taxrpo_afsp,
	FoindInZip
FROM
	read_parquet('D:\data-engineering-zoomcamp2024-project\data\preparer2024.parquet ');

SELECT
	 state_code,
	 zip_code,
	full_name,
	first_name,
	last_name,
	credential,
	address,
	distance,
	IsDuplicateOf,
	taxrpo_name,
	taxrpo_credentials,
	taxrpo_dba,
	taxrpo_address,
	taxrpo_website,
	taxrpo_phone,
	taxrpo_afsp,
	FoindInZip
FROM
	preparers.main.preparer2024
	where state_code ='CA'
 ;

SELECT
	pr.zip_code,
	ce.est_households_total
	,
	ce.est_households_med_income_ 
	,
	ce.est_households_mean_income_,
	count(1) preparers_count,
	(ce.est_households_total/ count(1))::bigint households_per_preparer
FROM
	preparers.main.preparer2024 pr
join census_income_2022 ce on
	ce.zip_code = pr.zip_code
WHERE 
	pr.state_code = 'CA'
GROUP BY
	pr.zip_code,
	ce.est_households_total,
	ce.est_households_med_income_ 
	,
	ce.est_households_mean_income_
	order by est_households_total desc;