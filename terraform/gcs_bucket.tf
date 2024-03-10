resource "google_storage_bucket" "fixed_bucket_name" {
  count    = lookup(var.env, "create_fixed_bucket", false) ? 1 : 0
  name     = "entrada_terraform"
  location = var.region

  versioning {
    enabled = false
  }
}

resource "google_storage_bucket" "manual_updates" {
  count    = lookup(var.env, "create_manual_updates_bucket", true) ? 1 : 0
  name     = "entrada_manual_updates"
  location = var.region

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "automatic_updates" {
  count    = lookup(var.env, "create_automatic_updates_bucket", true) ? 1 : 0
  name     = "entrada_automatic_updates"
  location = var.region

  versioning {
    enabled = true
  }
}
