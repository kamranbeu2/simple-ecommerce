resource "google_compute_disk" "postgres_disk" {
  name  = "postgres-disk"
  type  = "pd-standard"
  zone  = "${var.region}-a"
  size  = 10
  
}

resource "google_compute_disk" "storage_disk" {
  name  = "storage-disk"
  type  = "pd-standard"
  zone  = "${var.region}-a"
  size  = 10
  
}