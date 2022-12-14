# rdbcon

- It initializes db connection object
- This package uses yaml file to connect/close db using relavant packages.
- It supports both databases SQL and MySQL

## yaml structure
- refer to https://github.com/samiemphamba/rdbcon/blob/main/db.yaml
- rdbcon encyption is based on safer package. Below is syntax for encrypting texts in the package
```r 
    encrypt_string(string="database_name", key = "secret_key", pkey = NULL, ascii = TRUE)
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

## Usage
- Run these commands in Rstudio or linux (R-terminal):
```r
    devtools::install_github("samiemphamba/rdbcon",dependencies=TRUE,force = TRUE)
    library(rdbcon)

    # Open connection
    con <- openDb(file="Path/db.yaml", db_object="xxx")
    # OR
    con <- openDb(file="D:\\Data Science\\R\\config\\db2.yaml", db_object="obj_name2",encrypted_params = T, key = "secret_key" )
    # Close connection
    closeDb(con, db_type="SQL") #SQL or MySQL. You must specify
```
- You may reference by the actual package name when calling openDb function
```r
    con <- rdbcon::openDb(file="Path/db.yaml", db_object="xxx")
```



