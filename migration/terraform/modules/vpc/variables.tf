variable "region" {
    description = "GCP Region"
    type        = string
    default     = "us-central1"
  
}

variable "project_id" {
    description = "GCP Project ID"
    type        = string
    default     = "mock-migration"
  
}
variable "project_name" {
    description = "GCP Project Name"
    type        = string
    default     = "ecommerce-migration"
  
}

variable "internal_cidrs" {
    description = "CIDR ranges for internal communication"
    type        = list(string)
    default     = ["10.0.0.0/16"]
}

variable "external_cidrs" {
    description = "CIDR ranges for external communication"
    type        = list(string)
    default     = ["10.1.0.0/16"]
  
}

variable "secondary_cidrs" {
    description = "Secondary CIDR ranges for VPC"
    type        = list(string)
    default     = ["10.1.1.0/24"]
  
}