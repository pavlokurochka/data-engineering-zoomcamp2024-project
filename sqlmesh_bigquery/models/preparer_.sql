MODEL (name preparer_dataset.preparer_, kind VIEW);

SELECT
	substr(address, instr(address, ',') + 2, 2) state_code,
	left(address, instr(address, ',') -1) city,
	trim(
		left(
			reverse(
				left(
					reverse(address),
					instr(reverse(address), ',') -1
				)
			),
			6
		)
	) zip_code,
	full_name,
	first_name,
	last_name,
	credential	 credential_,
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
	preparer_dataset.preparer;