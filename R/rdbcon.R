#' Initialize db connection object
#'
#' This package uses yaml file to connect/close db using necessary packages.
#' Params in yaml maybe encypted using safer package
#' 
#' Supported databases:  SQL and MySQL

#' Used for decrypting connection params
#' @param str string to decrypt
#' @param key secret key
#' @param encrypted T or F

getDecryptParam <- function(str,encrypted,key){
  raw_str <- str
  if(encrypted==T){
    raw_str <- decrypt_string(str, key)
  }
  return (raw_str)
}

#' Open connection
#' @param file Path to db config => valid yaml file
#' @param db_object database object you want to connect to
#' @param encrypted_params T if soap params are encrypted otherwise F
#' @param key Secret key for encryption
#' @return A connection object as con
#' 
#' @export
openDb <- function(file,db_object, encrypted_params = F, key = "") {
  config <- config::get(
    file = file,
    config = Sys.getenv("R_CONFIG_ACTIVE", db_object)
  )

  soap <- config$dataconnection
  
  db_type <- getDecryptParam(soap$db_type, encrypted_params, key);
  
  if(db_type == "SQL"){
    con_string <- paste(
      'Driver={'
      ,getDecryptParam(soap$driver, encrypted_params, key)
      ,'};Server='
      ,getDecryptParam(soap$server, encrypted_params, key)
      ,';database='
      ,getDecryptParam(soap$database, encrypted_params, key)
      ,';UID='
      ,getDecryptParam(soap$uid, encrypted_params, key)
      ,';PWD='
      ,getDecryptParam(soap$pwd, encrypted_params, key)
      ,';'
      ,sep = ""
    )
    con <- odbcDriverConnect(connection = con_string)
  }
  
  if(db_type == "MySQL"){
    con <- dbConnect(
      drv = RMariaDB::MariaDB()
      ,username = getDecryptParam(soap$uid, encrypted_params, key)
      ,password = getDecryptParam(soap$pwd, encrypted_params, key)
      ,host = getDecryptParam(soap$server, encrypted_params, key)
      ,port = getDecryptParam(soap$port, encrypted_params, key)
      ,db_name = getDecryptParam(soap$database, encrypted_params, key)
    )
    
  }
  
  return (con)
}

#' Closes db connection
#' @param con current db object
#' @param db_type SQL or MySQL
#' @export
closeDb <- function(con, db_type){
  switch(db_type,
       SQL = {odbcClose(con)},
       MySQL = {dbDisconnect(con)}
  )
}


#setwd("E:\\Data Science\\R\\package\\rdbcon\\R")
