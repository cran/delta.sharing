## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----eval = FALSE-------------------------------------------------------------
# client <- sharing_client("~/config.share")
# 
# orders <- client$table("sales.default.orders", concurrency = 4)
# faster_downloads <- client$table("sales.default.orders", concurrency = 8)
# 
# identical(orders$cache_path, faster_downloads$cache_path)
# #> TRUE

## ----eval = FALSE-------------------------------------------------------------
# orders$cache_path
# fs::dir_info(orders$cache_path)

## ----eval = FALSE-------------------------------------------------------------
# fs::dir_delete(orders$cache_path)

## ----eval = FALSE-------------------------------------------------------------
# orders <- client$table(
#   "sales.default.orders",
#   concurrency = 8
# )

## ----eval = FALSE-------------------------------------------------------------
# reader <- orders$snapshot(
#   columns = c("status", "amount")
# )$to_arrow_reader()
# 
# con <- DBI::dbConnect(duckdb::duckdb())
# duckdb::duckdb_register_arrow(con, "orders", reader)
# 
# summary <- withr::with_options(
#   list(arrow.use_threads = FALSE),
#   DBI::dbGetQuery(con, "
#     SELECT
#       status,
#       count(*) AS orders,
#       sum(amount) AS total_amount
#     FROM orders
#     GROUP BY status
#     ORDER BY status
#   ")
# )
# 
# duckdb::duckdb_unregister_arrow(con, "orders")
# DBI::dbDisconnect(con)

