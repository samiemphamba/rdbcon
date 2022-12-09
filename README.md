# rdbcon

- It initializes db connection object
- This package uses yaml file to connect/close db using relavant packages.
- It supports these databases:  SQL and MySQL

# yaml structure
- refer to https://github.com/samiemphamba/rdbcon/blob/main/db.yaml

## Usage
- Run this command in Rstudio:
```r
    - devtools::install_github("samiemphamba/rdbcon",dependencies=TRUE,force = TRUE)
    - library(rdbcon)

    - con <- openDb(file="Path/db.yaml", db_object="xxx")
    - You may reference to the actual package name when calling openDb function
        - con <- rdbcon::openDb(file="Path/db.yaml", db_object="xxx")
    - closeDb(con, db_type="SQL")
    - encrypt_string(string="", key = "", pkey = NULL, ascii = TRUE) %>% print() #for encypting connection params in yaml
```

## Dependacies:
install devtools
```r
    install.packages("devtools")
```
## Preloaded dependancies
- No need to install these packages. rdbcon loads them. However, they were built under R version 4.2.2
    - RODBC,
    - DBI,
    - odbc,
    - yaml,
    - config
    - RMariaDB
    - safer


