variable "schema_invoice" {
  default = <<EOF
[
  {"name": "Order Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Date", "type": "STRING", "mode": "NULLABLE"}, 
  {"name": "Meal Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Company Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Date of Meal", "type": "STRING", "mode": "NULLABLE"},  
  {"name": "Participants", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Meal Price", "type": "FLOAT", "mode": "NULLABLE"},
  {"name": "Type of Meal", "type": "STRING", "mode": "NULLABLE"}
]
EOF
}

variable "schema_orderleads" {
  default = <<EOF
[
  {"name": "Order Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Company Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Company Name", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Date", "type": "STRING", "mode": "NULLABLE"}, 
  {"name": "Order Value", "type": "FLOAT", "mode": "NULLABLE"},
  {"name": "Converted", "type": "INTEGER", "mode": "NULLABLE"} 
]
EOF
}

variable "schema_salesteam" {
  default = <<EOF
[
  {"name": "Sales Rep", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Sales Rep Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Company Name", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Company Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "string_field_0", "type": "STRING", "mode": "NULLABLE"}  
]
EOF
}
