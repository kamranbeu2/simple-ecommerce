module "vpc" {
    source = "modules/vpc"
    project_id = var.project_id
    region = var.region
}

module "gke" {
    source = "modules/gke"
    project_id = var.project_id
    region = var.region
    cluster_name = var.cluster_name
    node_count = var.node_count
    node_machine_type = var.node_machine_type
    node_disk_size = var.node_disk_size
    vpc_network = module.vpc.vpc_network
    vpc_subnet = module.vpc.vpc_subnet_private
}

module "storage" {
    source = "./modules/storage"
    project_id = var.project_id
    region = var.region
}
