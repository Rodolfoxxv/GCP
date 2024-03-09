variable "project_id" {
  type        = string
  description = "The ID of the project where resources will be created."
}

variable "region" {
  type        = string
  description = "The region where resources will be created."
}

variable "env" {
  type = map(string)
  default = {}
}

variable "google_credentials" {
  description = "The Google Cloud credentials"
  type        = object({
    project_id = string
  })
}
