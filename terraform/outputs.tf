output "bucket_name" {
  value = google_storage_bucket.bucket_name.name
}

output "topic_name" {
  value = google_pubsub_topic.topic_name.name
}

output "service_account_id" {
  value       = google_service_account.sa.id
  description = "ID da service account criada."
}

output "key_json" {
  value       = local.key_json
  sensitive   = true
  description = "Chave privada da service account criada em formato JSON."
}
