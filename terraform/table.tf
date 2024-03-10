resource "google_bigquery_table" "tb_manual_invoices" {
  dataset_id = var.manual_dataset
  table_id   = "tb_manual_invoices"

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

  schema = "gs://${var.schema_bucket}/Invoices_schema.json"
}



resource "google_bigquery_table" "tb_manual_salesteam" {
  dataset_id = var.manual_dataset
  table_id   = "tb_manual_salesteam"

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
    schema = "gs://${var.schema_bucket}/SalesTeam_schema.json"
}


resource "google_bigquery_table" "tb_manual_orderleads" {
  dataset_id = var.manual_dataset
  table_id   = "tb_manual_orderleads"

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
      schema = "gs://${var.schema_bucket}/OrderLeads_schema.json"
}