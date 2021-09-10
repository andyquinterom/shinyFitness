library(shiny)
library(shinyMobile)
library(DBI)
library(RPostgres)
library(dplyr)
library(purrr)
library(DT)
library(jsonlite)

conn <- DBI::dbConnect(
  RPostgres::Postgres(),
  dbname = Sys.getenv("DB_NAME"),
  host = Sys.getenv("DB_HOST"),
  port = Sys.getenv("DB_PORT"),
  user = Sys.getenv("DB_USER"),
  password = Sys.getenv("DB_PW")
)

