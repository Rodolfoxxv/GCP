output "entrada_terraform" {
  value = [for i in google_storage_bucket.schema_bucket : i.name]
}
/*
output "schema_bucket_name" {
  value = [for i in google_storage_bucket.schema_bucket : i.name]
}

output "manual_bucket_name" {
  value = [for i in google_storage_bucket.manual_updates : i.name]
}

output "auto_bucket_name" {
  value = [for i in google_storage_bucket.automatic_updates : i.name]
}

output "manual_dataset_id" {
  value = [for i in google_bigquery_dataset.dataset : i.dataset_id if i.dataset_id == var.manual_dataset]
}

output "manual_dataset_location" {
  value = [for i in google_bigquery_dataset.dataset : i.location if i.dataset_id == var.manual_dataset]
}

output "manual_dataset_link" {
  value = [for i in google_bigquery_dataset.dataset : i.self_link if i.dataset_id == var.manual_dataset]
}

output "auto_dataset_id" {
  value = [for i in google_bigquery_dataset.dataset : i.dataset_id if i.dataset_id == var.auto_dataset]
}

output "auto_dataset_location" {
  value = [for i in google_bigquery_dataset.dataset : i.location if i.dataset_id == var.auto_dataset]
}

output "auto_dataset_link" {
  value = [for i in google_bigquery_dataset.dataset : i.self_link if i.dataset_id == var.auto_dataset]
}
*/
