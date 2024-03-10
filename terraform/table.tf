locals {
  schemas_map = { for schema in var.schemas : schema.schema_id => schema }
}

resource "google_bigquery_table" "tb_manual_invoices" {
  dataset_id = var.manual_dataset
  table_id   = var.tables[0].table_id

  external_data_configuration {
    autodetect    = true
    source_format = "CSV"
    csv_options {
      encoding = "UTF-8"
      quote    = "\""
    }

    source_uris = [
      "gs://${var.manual_updates_bucket}/Supermarket/Invoices.csv",
    ]
  }

  schema = local.schemas_map[var.tables[0].schema_id].schema
}

resource "google_bigquery_table" "tb_manual_salesteam" {
  dataset_id = var.manual_dataset
  table_id   = var.tables[1].table_id

  external_data_configuration {
    autodetect    = true
    source_format = "CSV"
    csv_options {
      encoding = "UTF-8"
      quote    = "\""
    }

    source_uris = [
      "gs://${var.manual_updates_bucket}/Supermarket/SalesTeam.csv",
    ]
  }

  schema = local.schemas_map[var.tables[1].schema_id].schema
}

resource "google_bigquery_table" "tb_manual_orderleads" {
  dataset_id = var.manual_dataset
  table_id   = var.tables[2].table_id

  external_data_configuration {
    autodetect    = true
    source_format = "CSV"
    csv_options {
      encoding = "UTF-8"
      quote    = "\""
    }

    source_uris = [
      "gs://${var.manual_updates_bucket}/Supermarket/OrderLeads.csv",
    ]
  }

  schema = local.schemas_map[var.tables[2].schema_id].schema
}
