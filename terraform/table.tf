locals {
  tables = { for table in var.tables : table["table_id"] => table }
}

resource "google_bigquery_table" "tables" {
  count = length(local.tables)

  dataset_id = local.tables[count.index]["dataset_id"]
  table_id   = local.tables[count.index]["table_id"]

  external_data_configuration {
    autodetect    = true
    source_format = "CSV"
    csv_options {
      encoding = "UTF-8"
      quote    = "\""
    }

    source_uris = [
      "gs://${var.manual_updates_bucket}/Supermarket/${local.tables[count.index]["table_id"]}.csv",
    ]
  }

  schema = data.google_storage_bucket_object.object[count.index].content
}
