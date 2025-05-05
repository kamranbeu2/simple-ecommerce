output "postgres_disk_name" {
  value = google_compute_disk.postgres_disk.name
  
}

output "storage_disk_name" {
  value = google_compute_disk.storage_disk.name
  
}