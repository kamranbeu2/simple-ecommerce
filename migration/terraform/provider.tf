provider "google" {
project     = "mock-migration"
region      = var.region
credentials = file("gke-creds.json")
}

terraform {
required_providers {
google = {
source  = "hashicorp/google"
version = "~> 6.0"
}
}
required_version = ">= 1.10.0"
}
