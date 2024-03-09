output "bucket_name" {
  value = [for i in google_storage_bucket.bucket_name : i.name]
}

output "fixed_bucket_name" {
  value = [for i in google_storage_bucket.fixed_bucket_name : i.name]
}

output "topic_names" {
  value = [for i in google_pubsub_topic.topic_name : i.name]
}

output "dataset_ids" {
  value = [for i in google_bigquery_dataset.dataset : i.dataset_id]
}

output "dataset_locations" {
  value = [for i in google_bigquery_dataset.dataset : i.location]
}

output "dataset_links" {
  value = [for i in google_bigquery_dataset.dataset : i.self_link]
}
