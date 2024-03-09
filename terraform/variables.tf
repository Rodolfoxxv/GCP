variable "project_id" {
  type        = string
  description = "The ID of the project where resources will be created."
}

variable "region" {
  type        = string
  description = "The region where resources will be created."
}

variable "env" {
  type = map(string)
  default = {}
}

resource "google_storage_bucket" "bucket" {
  name     = "entrada_terraform"
  location = var.region
}