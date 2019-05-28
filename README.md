## Installation
    git remote add origin https://github.com/ozombo/frogpond.git
    $ cd frogpond
    $ composer install

#### Import the DB

Create database called `pond`.

    mysql> create database pond;
    $ mysql -u root -p root < dump.sql


## Tests and Code sniffs

    $ composer run-script phpunit
    $ composer run-script phpcs

##

    Edit config/.env data