## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----eval = FALSE-------------------------------------------------------------
# library(delta.sharing)
# 
# client <- sharing_client(demo_profile())
# 
# housing <- client$table("delta_sharing.default.boston-housing")
# housing$snapshot(
#   columns = c("chas", "medv"),
#   limit = 5
# )$to_tibble()

## ----eval = FALSE-------------------------------------------------------------
# client <- sharing_client("~/config.share")

## ----eval = FALSE-------------------------------------------------------------
# client$list_shares()
# client$list_schemas("sales")
# client$list_tables("sales", "default")

## ----eval = FALSE-------------------------------------------------------------
# orders <- client$table("sales.default.orders")
# 
# orders
# orders$version()
# orders$schema()

## ----eval = FALSE-------------------------------------------------------------
# snapshot <- orders$snapshot(
#   columns = c("order_id", "status", "amount"),
#   limit = 1000
# )
# 
# orders_tbl <- snapshot$to_tibble()

## ----eval = FALSE-------------------------------------------------------------
# orders$snapshot(version = 42)$to_tibble()
# orders$snapshot(timestamp = "2024-01-01T00:00:00Z")$to_tibble()

## ----eval = FALSE-------------------------------------------------------------
# changes_tbl <- orders$changes(
#   starting_version = 120,
#   ending_version = 125,
#   columns = c(
#     "order_id",
#     "status",
#     "_change_type",
#     "_commit_version",
#     "_commit_timestamp"
#   )
# )$to_tibble()

