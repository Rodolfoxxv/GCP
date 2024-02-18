resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "projeto"
  friendly_name               = "My Dataset"
  description                 = "Dataset projetos"
  location                    = var.region
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }
}

resource "google_bigquery_dataset_access" "access" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id

  role          = "READER"
  special_group = "projectWriters"
}

output "dataset_id" {
  value = google_bigquery_dataset.dataset.dataset_id
}

output "dataset_location" {
  value = google_bigquery_dataset.dataset.location
}

output "dataset_self_link" {
  value = google_bigquery_dataset.dataset.self_link
}
