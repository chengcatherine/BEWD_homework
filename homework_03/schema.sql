DROP TABLE IF EXISTS address_entries;
DROP TABLE IF EXISTS phone_numbers;
DROP TABLE IF EXISTS email_addresses;

CREATE TABLE address_entries (
	id INTEGER PRIMARY KEY,
	first_name VARCHAR(255),
	last_name VARCHAR(255)
);

CREATE TABLE phone_numbers (
	id INTEGER PRIMARY KEY,
	address_entry_id INTEGER,
	category VARCHAR(255),
	digits VARCHAR(255)
);

CREATE TABLE email_addresses (
	id INTEGER PRIMARY KEY,
	address_entry_id INTEGER,
	category VARCHAR(255),
	address VARCHAR(255)
);