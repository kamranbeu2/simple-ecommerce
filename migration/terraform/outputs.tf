output "gke_cluster_name" {
  value = google_container_cluster.gke-cluster.name
  
}

output "gke_cluster_endpoint" {
  value = google_container_cluster.gke-cluster.endpoint
  
}