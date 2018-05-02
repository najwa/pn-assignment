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
