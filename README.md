# README

https://najwas-pn-assignment.herokuapp.com/api/coach_directory

Pagination params:

* page
* per_page


Search params:

* country
* name
* postal_code

Example:
https://najwas-pn-assignment.herokuapp.com/api/coach_directory?per_page=5&page=2&name=Daniel&country=Canada

## Setting up your development environment

1. Clone the repo and install all dependencies
```
git clone git@github.com:najwa/pn-assignment.git
cd pn-assignment
bundle
```
2. Create the database
```
rails db:create
pg_restore -d pn-assignment_development db/datasets/postgres-wp_fitpro_directory.dump
```
3. Start the server with `rails s` then visit http://localhost:3000/api/coach_directory

## Running tests
1. `rails db:test:prepare`
2. `rails test`

## A note about the data
The original data can be found [here](https://to-serve-files.s3.amazonaws.com/wp_fitpro_directory.sql?AWSAccessKeyId=AKIAJIN5VVUBN3EJDOYA&Expires=1525389215&Signature=LYPuex1tErwQIdjDHNzKuMm0aGs%3D). This is a MySQL export.

Our API needs to read from Postgres, not MySQL. So I imported the original dataset into a MySQL database, then used pg-loader to load it into my development environment's Postgres database.

Then, to get the data onto production, I used pg_dump to create a data dump of my Postgres database. I then imported this into Heroku.

This Postgres data dump is also used when creating a new development environment from scratch - see step 2 of the 'Setting up your development environment' section.
