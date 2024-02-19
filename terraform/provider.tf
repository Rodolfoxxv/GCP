provider "google" {
<<<<<<< HEAD
  credentials = local.key_json
=======
  credentials = file("KEY.json")
>>>>>>> ac3c108d3075fe3049041996e35ab07533f78632
  project     = var.project_id
  region      = var.region
}

