## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# library(s3pe)
# s3_config()
# 
# cfg <- s3_config(endpoint = "https://example.org", bucket = "archive",
#                  access_key = Sys.getenv("ARCHIVE_KEY"),
#                  secret_key = Sys.getenv("ARCHIVE_SECRET"))

## -----------------------------------------------------------------------------
# # JSON -> list
# meta <- read_s3("data/manifest.json")
# meta$generated_at
# 
# # gzipped CSV -> tibble (readr); `...` reaches the reader
# sales <- read_s3("series/sales.csv.gz", col_types = "Dncl")
# 
# # GeoJSON -> sf, when sf is installed
# regions <- read_s3("data/regions.geojson")
# 
# # Parquet -> data frame (nanoparquet)
# panel <- read_s3("etl/panel.parquet")
# 
# # anything else -> raw bytes; or ask for them
# png <- read_s3("report/figure1.png")
# txt <- read_s3("data/manifest.json", format = "text")

## -----------------------------------------------------------------------------
# cache <- "batch-cache.rds"
# meta <- read_s3("data/manifest.json")
# if (!file.exists(cache) || readRDS(cache)$generated_at != meta$generated_at) {
#   batch <- list(
#     generated_at = meta$generated_at,
#     series = read_s3("data/series.json"),
#     ranking = read_s3("data/ranking.json")
#   )
#   saveRDS(batch, cache)
# }

## -----------------------------------------------------------------------------
# write_s3(panel, "report/panel.parquet")
# write_s3(panel, "report/panel.csv.gz")
# write_s3(list(generated_at = Sys.time(), rows = nrow(panel)),
#          "report/manifest.json", pretty = TRUE)
# write_s3(model, "report/model.rds")
# write_s3(c("# Report", "", "Text..."), "report/README.md")

## -----------------------------------------------------------------------------
# upload_s3("output/figure1.png", "report/")
# download_s3("data/regions.geojson", "data/regions.geojson", overwrite = TRUE)

## -----------------------------------------------------------------------------
# list_s3("data/")                   # tibble: key, size, last_modified, etag
# head_s3("data/manifest.json")      # one row, or NULL
# exists_s3("data/manifest.json")    # TRUE/FALSE
# delete_s3("report/draft.csv")
# buckets_s3()

## -----------------------------------------------------------------------------
# upload_s3("exports/full.parquet", "archive/", bucket = "my-bucket",
#           metadata = c(run = "2026-10-23"))

## -----------------------------------------------------------------------------
# presign_s3("reports/report.pdf", bucket = "my-bucket", expires = 3600)

## -----------------------------------------------------------------------------
# sync_up_s3("output/", "reports/2026/", bucket = "my-bucket", last = "manifest.json")
# sync_down_s3("reports/2026/", "reports-2026/", bucket = "my-bucket")
# copy_s3("reports/2026/manifest.json", "reports/latest.json", bucket = "my-bucket")
# delete_s3(list_s3("tmp/", bucket = "my-bucket")$key, bucket = "my-bucket")

## -----------------------------------------------------------------------------
# meta <- tryCatch(
#   read_s3("data/manifest.json"),
#   s3pe_error_not_found = function(e) NULL
# )

## -----------------------------------------------------------------------------
# use_endpoint("http://127.0.0.1:9000")

