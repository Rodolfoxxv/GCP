/*resource "google_storage_bucket" "bucket_name" {
  count    = lookup(var.env, "create_bucket", true) ? 1 : 0
  name     = "my-terraform-bucket-${random_integer.bucket_suffix.result}"
  location = var.region

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "fixed_bucket_name" {
  count    = lookup(var.env, "create_fixed_bucket", true) ? 1 : 0
  name     = "entrada_terraform_fixed"
  location = var.region

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "additional_bucket_name" {
  count    = lookup(var.env, "create_additional_bucket", true) ? 1 : 0
  name     = "entrada_terraform_additional"
  location = var.region

  versioning {
    enabled = true
  }
}

resource "random_integer" "bucket_suffix" {
  min = 100
  max = 999
} */
