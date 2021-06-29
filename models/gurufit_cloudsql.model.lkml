connection: "gurufit-cloudsql"

# include all the views
include: "/views/**/*.view"

datagroup: gurufit_cloudsql_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: gurufit_cloudsql_default_datagroup

explore: es_order {}
