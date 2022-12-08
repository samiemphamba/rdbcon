#' Initialize db connection object
#'
#' This function uses yaml file to connect to db using necessary packages.
#' Supported databases:  SQL and MySQL
#' Below is the structure of expected object in yaml
#' db_name: 
#'   dataconnection: 
#'     driver: 'ODBC Driver 17 for SQL Server' 
#'     server: 'xx.xx.xx.xx' 
#'     uid: 'xxx' 
#'     pwd: 'xx' 
#'     port: 1433 
#'     db_type: 'SQL'  or MySQL
#'     database: 'xxx'
#'
#' @param file Path to db config => valid yaml file
#' @param db_object database object you want to connect to
#' @return A connection object as con
#' @export
init <- function(file,db_object) {
  config <- config::get(
    file = file,
    config = Sys.getenv("R_CONFIG_ACTIVE", db_object)
  )
  
  soap <- config$dataconnection
  if(soap$db_type == "SQL"){
    con_string <- paste(
      'Driver={'
      ,soap$driver
      ,'};Server='
      ,soap$server
      ,';database='
      ,soap$database
      ,';UID='
      ,soap$uid
      ,';PWD='
      ,soap$pwd
      ,';'
      ,sep = ""
    )
    con <- odbcDriverConnect(connection = con_string)
  }
  
  return (con)
}