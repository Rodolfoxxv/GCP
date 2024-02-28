#output "bucket_name" {
#  value = google_storage_bucket.bucket_name.name
#}

output "topic_names" {
  value = [for i in google_pubsub_topic.topic_name : i.name]
}
