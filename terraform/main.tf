terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }

  backend "gcs" {
    bucket = "entrada_terraform"
    prefix = "terraform/state"
  }
}

#Folder-------------------------------------------------------------------------
resource "google_storage_bucket" "bucket" {
  name     = var.manual_updates_bucket
  location = var.region
}

resource "google_storage_bucket_object" "object" {
  name   = "Supermarket/"
  bucket = google_storage_bucket.bucket.name
  content = ""
}

