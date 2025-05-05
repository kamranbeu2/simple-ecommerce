variable "project_id" {
  description = "GCP Project ID"
  type        = string
  
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
  
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
  default     = "ecommerce-cluster"
  
}

variable "vpc_network" {
  description = "VPC Network ID for GKE Cluster"
  type        = string
  
}

variable "vpc_subnet" {
  description = "VPC Subnet ID for GKE Cluster"
  type        = string
  
}

variable "node_count" {
  description = "Number of nodes in the GKE cluster"
  type        = number
  default     = 3
  
}

variable "node_machine_type" {
  description = "Machine type for the GKE nodes"
  type        = string
  default     = "e2-standard-4"
  
}

variable "node_disk_size" {
  description = "Disk size for the GKE nodes in GB"
  type        = number
  default     = 50
  
}
variable "node_pool_name" {
  description = "Name of the node pool"
  type        = string
  default     = "default-pool"
  
}
