MODEL (name preparer_dataset.preparers_by_zip_ca, kind VIEW);

SELECT
    state_code,
    zip_code,
    min(city) city,
    count(*) count_
FROM
    preparer_dataset.preparer_
where
    state_code = 'CA'
group by
    state_code,
    zip_code
order by
    zip_code;