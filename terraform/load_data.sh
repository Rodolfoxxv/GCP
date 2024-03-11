#!/bin/bash

# Define the variables
BUCKET="entrada_manual"
DATASET="manual"
PROJECT_ID="portfolioentrada"

# Load data into tb_super_invoice
gcloud bigquery load --source_format=CSV --skip_leading_rows=1 \
  --autodetect \
  --source_uris=gs://${BUCKET}/supermarket/Invoices.csv \
  ${PROJECT_ID}:${DATASET}.tb_super_invoice

# Load data into tb_super_orderleads
gcloud bigquery load --source_format=CSV --skip_leading_rows=1 \
  --autodetect \
  --source_uris=gs://${BUCKET}/supermarket/OrderLeads.csv \
  ${PROJECT_ID}:${DATASET}.tb_super_orderleads

# Load data into tb_super_salesteam
gcloud bigquery load --source_format=CSV --skip_leading_rows=1 \
  --autodetect \
  --source_uris=gs://${BUCKET}/supermarket/SalesTeam.csv \
  ${PROJECT_ID}:${DATASET}.tb_super_salesteam
