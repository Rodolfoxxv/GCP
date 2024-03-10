locals {
  tables = { for table in var.tables : table.table_id => table }
}

resource "google_bigquery_table" "tables" {
  for_each = local.tables

  dataset_id = each.value.dataset_id
  table_id   = each.value.table_id

  external_data_configuration {
    autodetect    = true
    source_format = "CSV"
    csv_options {
      encoding = "UTF-8"
      quote    = "\""
    }

    source_uris = [
      "gs://${var.manual_updates_bucket}/Supermarket/${each.value.table_id}.csv",
    ]
  }

  schema = local.schemas_map[each.value.schema_id]
}
