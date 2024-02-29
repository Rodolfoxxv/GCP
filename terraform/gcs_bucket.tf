#resource "google_storage_bucket" "bucket_name" {
#  count    = lookup(var.env, "create_bucket", true) ? 1 : 0
#  name     = "my-terraform-bucket-${random_integer.bucket_suffix.result}"
# location = var.region

#  versioning {
#    enabled = true
#  }
#}

#resource "random_integer" "bucket_suffix" {
#  min = 100
#  max = 999
#}

#terraform {
#  backend "gcs" {
#    bucket  = "nome-do-seu-bucket"
#    prefix  = "terraform/state"
#  }
#}