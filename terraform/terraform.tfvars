project_id = "portfolioentrada"
region     = "us-central1"


# Buckts------------------------------------------------------
manual_updates_bucket    = "entrada_manual_updates"
automatic_updates_bucket = "entrada_automatic_updates"
schema_bucket            = "entrada_schema_bucket"


#Datasets-----------------------------------------------------
manual_dataset = "manual"
auto_dataset   = "auto"

#tables-------------------------------------------------------
tables = [ 
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


