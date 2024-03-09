terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

terraform {
  backend "gcs" {
    bucket = "entrada_terraform"
    prefix = "terraform/state"
  }
}


resource "google_bigquery_dataset" "dataset" {
  count                       = lookup(var.env, "create_dataset", true) ? 1 : 0
  dataset_id                  = "projeto"
  friendly_name               = "My Dataset"
  description                 = "Dataset projetos"
  location                    = var.region
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "READER"
    special_group = "projectWriters"
  }
}
