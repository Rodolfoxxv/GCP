locals {
  schemas_map = { for schema in var.schemas : schema.schema_id => file(schema.schema) }
}

resource "google_bigquery_table" "tables" {
  for_each = { for tbl in var.tables : tbl.table_id => tbl }

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
