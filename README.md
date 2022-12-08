# rdbcon

- It initialize db connection object
    This function uses yaml file to connect to db using necessary packages.
    Supported databases:  SQL and MySQL
    Below is the structure of expected object in yaml
- db_name: 
    - dataconnection: 
        - driver: 'ODBC Driver 17 for SQL Server' 
        - server: 'xx.xx.xx.xx' 
        - uid: 'xxx' 
        - pwd: 'xx' 
        - port: 1433 
        - db_type: 'SQL'  or 'MySQL'
        - database: 'xxx'
## Params
- @param file Path to db config => valid yaml file
- @param db_object database object you want to connect to
- @return A connection object as con

## Usage
- Run this command in Rstudio:
devtools::install_github("samiemphamba/rdbcon")
rdbcon<-init("file_path","db_object")

## Dependacies:
- devtools
- RODBC,
- DBI,
- odbc,
- yaml,
- config

