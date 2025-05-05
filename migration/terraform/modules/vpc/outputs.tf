output "vpc_network" {
  value = google_compute_network.vpc.id
}

output "vpc_subnet_private" {
  value = google_compute_subnetwork.subnetwork-internal.id
}

output "vpc_subnet_public" {
  value = google_compute_subnetwork.subnetwork-external.id
}