/*data "google_storage_bucket_object" "object" {
  count  = length(var.schemas)
  name   = var.schemas[count.index].schema
  bucket = var.schemas[count.index].bucket
}

locals {
  schemas_map = { for idx, schema in var.schemas : schema.schema_id => data.google_storage_bucket_object.object[idx].content }
}*/
