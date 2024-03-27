MODEL (
    name preparers.households_per_preparer_ca,
    kind VIEW
);

SELECT
    pr.zip_code,
    pr.city,
    ce.est_households_total,
    ce.est_households_med_income_,
    ce.est_households_mean_income_,
    pr.count_ preparers_count,
    (ce.est_households_total / pr.count_) :: bigint households_per_preparer,
    (ce.est_households_total / pr.count_  * est_households_med_income_) :: bigint med_income_per_preparer,
    (ce.est_households_total / pr.count_  * est_households_mean_income_) :: bigint mean_income_per_preparer
FROM
    preparers.preparers_by_zip_ca pr
    join preparers.census_income_ ce on ce.zip_code = pr.zip_code
WHERE
    pr.state_code = 'CA'
order by
    est_households_total desc;