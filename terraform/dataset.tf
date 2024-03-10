resource "google_bigquery_dataset" "manual_dataset" {
  count                       = lookup(var.env, "create_manual_dataset", true) ? 1 : 0
  dataset_id                  = "manual"
  friendly_name               = "Manual Dataset"
  description                 = "Dataset for manual updates"
  location                    = var.region
  default_table_expiration_ms = 3600000

  labels = {
    env = "manual"
  }

  access {
    role          = "READER"
    special_group = "projectWriters"
  }

  access {
    role          = "OWNER"
    user_by_email = "readerbigquery@portfolioentrada.iam.gserviceaccount.com"
  }
}

resource "google_bigquery_dataset" "auto_dataset" {
  count                       = lookup(var.env, "create_auto_dataset", true) ? 1 : 0
  dataset_id                  = "auto"
  friendly_name               = "Automatic Dataset"
  description                 = "Dataset for automatic updates"
  location                    = var.region
  default_table_expiration_ms = 3600000

  labels = {
    env = "automatic"
  }

  access {
    role          = "READER"
    special_group = "projectWriters"
  }

 access {
    role          = "OWNER"
    user_by_email = "readerbigquery@portfolioentrada.iam.gserviceaccount.com"
  }
}
