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

#Bucket--------------------------------------------------------------------
variable "manual_updates_bucket" {
  description = "O nome do bucket de atualizações manuais"
  type        = string
  default     = "entrada_manual_updates"
}

variable "automatic_updates_bucket" {
  description = "O nome do bucket de atualizações automáticas"
  type        = string
  default     = "entrada_automatic_updates"
}

variable "schema_bucket" {
  description = "O nome do bucket para os esquemas"
  type        = string
  default     = "entrada_schema_bucket"
}


#Dataset --------------------------------------------------------------------
variable "manual_dataset" {
  description = "O ID do dataset manual"
  type        = string
  default     = "manual"
}

variable "auto_dataset" {
  description = "O ID do dataset automático"
  type        = string
  default     = "auto"
}


#schema--------------------------------------------------------------------