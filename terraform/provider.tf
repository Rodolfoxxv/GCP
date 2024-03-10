provider "google" {
  credentials = file("creds.json")
  project     = var.project_id
  region      = var.region
}