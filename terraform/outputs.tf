output "bucket_name" {
  value = google_storage_bucket.bucket_name.name
}

output "topic_name" {
  value = google_pubsub_topic.topic_name.name
}

