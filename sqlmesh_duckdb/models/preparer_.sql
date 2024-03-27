MODEL (name preparers.preparer_, kind VIEW);

SELECT
	substr(address_, instr(address_, ',') + 2, 2) state_code,
	left(address_, instr(address_, ',') -1) city,
	trim(
		left(
			reverse(
				left(
					reverse(address_),
					instr(reverse(address_), ',') -1
				)
			),
			6
		)
	) zip_code,
	full_name,
	first_name,
	last_name,
	credential_,
	address_,
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
	raw.preparer;