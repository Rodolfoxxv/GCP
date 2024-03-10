resource "google_bigquery_dataset" "dataset" {
  for_each                    = toset([var.manual_dataset, var.auto_dataset])
  dataset_id                  = each.key
  friendly_name               = each.key
  description                 = "Dataset for ${each.key} updates"
  location                    = var.region
  default_table_expiration_ms = 3600000

  labels = {
    env = each.key
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
