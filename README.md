## Prerequisites

You will need to install sqlite3, php, and httpd (apache2).

## Testing

You will need to create an SQLite3 database (by default located in <ROOT>/db/boards.db) with the schema `CREATE TABLE b (text string,_date string,_time string)`.

Then, either handwrite the file server_config.ini, or create it via `make` after setting the make parameters and setting ROOT to ".".

To test without installing, change directories to the test install and run `php -S localhost:8888`.

## Installation

To install, edit the Makefile parameters for your server:

	FQDN=     example.local
	PROTO=    http
	PORT=     8888
	ROOT=     $(PREFIX)/$(FQDN)

You probably do not need to edit ROOT, as it will be populated automatically.

Then run `make install`.
