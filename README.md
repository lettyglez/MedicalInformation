# MedicalInformation

# Postgresql & PgAdmin
## Requirements:
* docker
* docker-compose

## Quick Start
* Clone or download this repository
* Go inside of directory,  `sql`
* Run this command `docker-compose up -d`


## Environments
This Compose file contains the following environment variables:

* `POSTGRES_USER` the default value is **Admin**
* `POSTGRES_PASSWORD` the default value is **123456**
* `PGADMIN_PORT` the default value is **8081**
* `PGADMIN_DEFAULT_EMAIL` the default value is **Admin@google.com**
* `PGADMIN_DEFAULT_PASSWORD` the default value is **123456**

## Access to postgres: 
* `localhost:5432`
* **Username:** Admin (as a default)
* **Password:** 123456 (as a default)

## Access to PgAdmin: 
* **URL:** `http://localhost:8081`
* **Username:** Admin@google.com (as a default)
* **Password:** 123456 (as a default)

## Add a new server in PgAdmin:
* **Host name/address** `Exercise-db`
* **Port** `5432`
* **Username** as `POSTGRES_USER`, by default: `Admin`
* **Password** as `POSTGRES_PASSWORD`, by default `123456`

## Run scrip to create and populate dataBase
* Inside the directory sql copy the content of DBcreation.sql
* Paste in a query tool and run the script