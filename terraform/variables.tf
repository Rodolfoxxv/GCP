locals {
  tables = { for table in var.tables : table["table_id"] => table }
}

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
variable "schemas" {
  description = "Lista de esquemas"
  type        = list(object({
    schema_id = string
    schema    = string
    bucket    = string
  }))
  default = [
    {
      schema_id = "invoices_schema"
      schema    = "./Invoices_schema.json"
      bucket    = "entrada_schema_bucket"
    },
    {
      schema_id = "orderLeads_schema"
      schema    = "./OrderLeads_schema.json"
      bucket    = "entrada_schema_bucket"
    },
    {
      schema_id = "salesTeam_schema"
      schema    = "./SalesTeam_schema.json"
      bucket    = "entrada_schema_bucket"
    }
  ]
}

variable "schema_files" {
  default = [
    "Invoices_schema.json",
    "OrderLeads_schema.json",
    "SalesTeam_schema.json"
    // Adicione mais nomes de arquivos conforme necessário
  ]
}



#tables--------------------------------------------------------------------
variable "tables" {
  description = "Lista de tabelas"
  type        = list(object({
    table_id   = string
    schema_id  = string
    dataset_id = string
  }))
  default = [
    { 
    table_id          = "manual_mk_invoices",
    schema_id         = "invoices_schema",  
    dataset_id        = "manual"
    },
    
    { 
    table_id          = "manual_mk_orderleads",
    schema_id         = "orderLeads_schema",  
    dataset_id        = "manual"
    },

    {
    table_id          = "manual_mk_salesteam",
    schema_id         = "salesTeam_schema",  
    dataset_id        = "manual"
    }    
  ]
}