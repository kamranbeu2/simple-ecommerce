resource "google_container_cluster" "primary" {
    name     = var.cluster_name
    location = var.region
    network = var.vpc_network
    subnetwork = var.vpc_subnet
    
    node_pool {
        name       = "default-pool"
        node_count = var.node_count
        node_config {
            machine_type = var.node_machine_type
            disk_size_gb = var.node_disk_size
            oauth_scopes = [
                "https://www.googleapis.com/auth/cloud-platform",
            ]
        }
    

     autoscaling {
        min_node_count = 1
        max_node_count = 5
     }

     management {
        auto_upgrade = true
        auto_repair  = true
     }
    }

     release_channel {
        channel = "REGULAR"
     }

     cluster_autoscaling {
        enabled = true
        resource_limits {
            resource_type = "cpu"
            minimum = 1
            maximum = 4
        }
        resource_limits {
            resource_type = "memory"
            minimum = 1
            maximum = 16
        }

     }
    
}