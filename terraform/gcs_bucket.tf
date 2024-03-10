resource "google_storage_bucket" "fixed_bucket_name" {
  count    = lookup(var.env, "create_fixed_bucket", true) ? 1 : 0
  name     = var.ent_terraform
  location = var.region

  versioning {
    enabled = true
  }
}
/*
resource "google_storage_bucket" "schema_bucket" {
  count    = lookup(var.env, "create_schema_bucket", true) ? 1 : 0
  name     = var.schema_bucket
  location = var.region

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "manual_updates" {
  count    = lookup(var.env, "create_manual_updates_bucket", true) ? 1 : 0
  name = var.manual_updates_bucket
  location = var.region

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "automatic_updates" {
  count    = lookup(var.env, "create_automatic_updates_bucket", true) ? 1 : 0
  name = var.automatic_updates_bucket
  location = var.region

  versioning {
    enabled = true
  }
}*/

