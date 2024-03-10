resource "google_storage_bucket_object" "upload_object" { 
  count  = length(var.schema_files)
  name   = var.schema_files[count.index]
  bucket = var.schema_bucket
  source = "${path.module}/schema/${var.schema_files[count.index]}"
}
