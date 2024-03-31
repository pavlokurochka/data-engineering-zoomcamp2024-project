MODEL (name preparers.preparers_by_zip_ca, kind VIEW);

SELECT
    state_code,
    zip_code,
    min(city) city,
    count(*) count_
FROM
    preparers.preparer_
where
    state_code = 'CA'
group by
    state_code,
    zip_code
order by
    zip_code;