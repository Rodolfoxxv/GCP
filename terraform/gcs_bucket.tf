#resource "google_storage_bucket" "bucket_name" {
 # name     = "my-terraform-bucket-${random_integer.bucket_suffix.result}"
  #location = var.region

#  versioning {
#    enabled = true
#  }
#}

#resource "random_integer" "bucket_suffix" {
#  min = 100
#  max = 999
#}
