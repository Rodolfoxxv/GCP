terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }

  backend "gcs" {
    bucket = "entrada_terraform1"
    prefix = "terraform/state"
  }
}

provider "google" {
  credentials = file("creds.json")
  project     = var.project_id
  region      = var.region
}

#Bucket--------------------------------------------------------------------

resource "google_storage_bucket" "fixed_bucket_name" {
  count    = lookup(var.env, "create_fixed_bucket", false) ? 1 : 0
  name     = var.ent_terraform
  location = var.region
  force_destroy = true
  versioning {
    enabled = false
  }
}

resource "google_storage_bucket" "schema_bucket1" {
  count    = lookup(var.env, "create_schema_bucket", true) ? 1 : 0
  name     = var.schema_bucket
  location = var.region
  force_destroy = true
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "entrada_manual1" {
  name     = var.entrada_manual
  location = var.region
  force_destroy = true

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "entrada_auto1" {
  name     = var.entrada_auto
  location = var.region
  force_destroy = true
  versioning {
    enabled = true
    
  }
}

#Folder-----------------------------------------------------------------------------------------

resource "google_storage_bucket_object" "object" {
  name    = "supermarket/"
  bucket  = google_storage_bucket.entrada_manual1.name
  content = " "
  depends_on = [google_storage_bucket.entrada_manual1]
}


#Dataset-----------------------------------------------------------------------------------------

resource "google_bigquery_dataset" "manual" {
  dataset_id                  = "manual"
  friendly_name               = "manual"
  description                 = "Dataset manual"
  location                    = var.region
  default_table_expiration_ms = 3600000
}

resource "google_bigquery_dataset" "auto" {
  dataset_id                  = "auto"
  friendly_name               = "auto"
  description                 = "Dataset auto"
  location                    = var.region
  default_table_expiration_ms = 3600000
}
