data "google_storage_bucket_object" "object" {
  count  = length(var.schema_files)
  name   = var.schema_files[count.index]
  bucket = var.schema_bucket
}

locals {
  schemas_map = { for idx, schema in var.schemas : schema.schema_id => data.google_storage_bucket_object.object[idx].content }
}
