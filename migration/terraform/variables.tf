variable "region" {
    description = "GCP Region"
    default     = "us-central1"
}

variable "cluster_name" {
    description = "GKE Cluster Name"
    default     = "ecommerce-cluster"
}

variable "project_id" {
    description = "GCP Project ID"
    default     = "mock-migration"
}

variable "node_count" {
    description = "Number of nodes in the GKE cluster"
    default     = 3
}

variable "node_machine_type" {
    description = "Machine type for the GKE nodes"
    default     = "e2-standard-4"
}

variable "node_disk_size" {
    description = "Disk size for the GKE nodes in GB"
    default     = 50
}   