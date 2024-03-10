output "fixed_bucket_name" {
  value = [for i in google_storage_bucket.fixed_bucket_name : i.name]
}

output "manual_bucket_name" {
  value = [for i in google_storage_bucket.manual_updates : i.name]
}

output "auto_bucket_name" {
  value = [for i in google_storage_bucket.automatic_updates : i.name]
}

output "manual_dataset_id" {
  value = [for i in google_bigquery_dataset.manual_dataset : i.dataset_id]
}

output "manual_dataset_location" {
  value = [for i in google_bigquery_dataset.manual_dataset : i.location]
}

output "manual_dataset_link" {
  value = [for i in google_bigquery_dataset.manual_dataset : i.self_link]
}

output "auto_dataset_id" {
  value = [for i in google_bigquery_dataset.auto_dataset : i.dataset_id]
}

output "auto_dataset_location" {
  value = [for i in google_bigquery_dataset.auto_dataset : i.location]
}

output "auto_dataset_link" {
  value = [for i in google_bigquery_dataset.auto_dataset : i.self_link]
}
