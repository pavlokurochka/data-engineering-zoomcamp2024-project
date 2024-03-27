MODEL (
    name raw.preparer,
    kind VIEW);

SELECT
    full_name,
    first_name,
    last_name,
    credential credential_,
    address address_,
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
    read_parquet(
        'D:\data-engineering-zoomcamp2024-project\data\preparer2024.parquet '
    );