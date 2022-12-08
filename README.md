# rdbcon

- It initializes db connection object
- This package uses yaml file to connect to db using relavant packages.
- It supports these databases:  SQL and MySQL

# yaml structure
- refer to https://github.com/samiemphamba/rdbcon/blob/main/db.yaml

## Usage
- Run this command in Rstudio:

    - devtools::install_github("samiemphamba/rdbcon",dependencies=TRUE,force = TRUE)
    - library(rdbcon)
    - con <- init(file="Path/db.yaml", db_object="xxx")
    - You may reference to the actual package name when calling init function
        - con <- rdbcon::init(file="Path/db.yaml", db_object="xxx")

## Dependacies:
- Windows.
    - install.packages("devtools")
- Linux (ubuntu)
    - install.packages("testthat") 
    - install.packages("pkgload") 
    - install.packages("devtools")

## Preloaded dependancies
- No need to install these packages. rdbcon loads them. However, they were built under R version 4.2.2
    - RODBC,
    - DBI,
    - odbc,
    - yaml,
    - config


