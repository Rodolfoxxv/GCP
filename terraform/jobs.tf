#Jobs-----------------------------------------------------------------------------------------

resource "google_bigquery_job" "job_invoice" {
  job_id     = "job_invoice"
  location   = "EU"

  load {
    source_uris = [
      "gs://${google_storage_bucket.entrada_manual.name}/supermarket/Invoices.csv",
    ]

    destination_table {
      project_id = var.project_id
      dataset_id = google_bigquery_dataset.manual.dataset_id
      table_id   = google_bigquery_table.tb_super_invoice.table_id
    }

    skip_leading_rows = 1

    source_format = "CSV"
  }
}

resource "google_bigquery_job" "job_orderleads" {
  job_id     = "job_orderleads"
  location   = "EU"

  load {
    source_uris = [
      "gs://${google_storage_bucket.entrada_manual.name}/supermarket/OrderLeads.csv",
    ]

    destination_table {
      project_id = var.project_id
      dataset_id = google_bigquery_dataset.manual.dataset_id
      table_id   = google_bigquery_table.tb_super_orderleads.table_id
    }

    skip_leading_rows = 1

    source_format = "CSV"
  }
}

resource "google_bigquery_job" "job_salesteam" {
  job_id     = "job_salesteam"
  location   = "EU"

  load {
    source_uris = [
      "gs://${google_storage_bucket.entrada_manual.name}/supermarket/SalesTeam.csv",
    ]

    destination_table {
      project_id = var.project_id
      dataset_id = google_bigquery_dataset.manual.dataset_id
      table_id   = google_bigquery_table.tb_super_salesteam.table_id
    }

    skip_leading_rows = 1

    source_format = "CSV"
  }
}
