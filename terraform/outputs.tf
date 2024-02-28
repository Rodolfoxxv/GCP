#output "bucket_name" {
#  value = google_storage_bucket.bucket_name.name
#}

output "topic_names" {
  value = [for i in google_pubsub_topic.topic_name : i.name]
}



output "dataset_id" {
  value = google_bigquery_dataset.dataset.dataset_id
}

output "dataset_location" {
  value = google_bigquery_dataset.dataset.location
}

output "dataset_self_link" {
  value = google_bigquery_dataset.dataset.self_link
}