provider "google" {
  credentials = file("key")
  project     = var.project_id
  region      = var.region
}
