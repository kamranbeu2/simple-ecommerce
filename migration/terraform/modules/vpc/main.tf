resource "google_compute_network" "vpc" {
  name = "${var.project_name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "allow-internal" {
  name    = "${var.project_name}-allow-internal"
  network = google_compute_network.vpc.id

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }

  source_ranges = var.internal_cidrs
  target_tags   = ["allow-internal"]
  
}

resource "google_compute_subnetwork" "subnetwork-internal" {
  name          = "${var.project_name}-subnetwork"
  ip_cidr_range = var.internal_cidrs[0]
  region        = var.region
  network       = google_compute_network.vpc.id

  private_ip_google_access = true
  
}

resource "google_compute_subnetwork" "subnetwork-external" {
  name          = "${var.project_name}-subnetwork-external"
  ip_cidr_range = var.external_cidrs[0]
  region        = var.region
  network       = google_compute_network.vpc.id

  private_ip_google_access = false
  secondary_ip_range {
    range_name    = "${var.project_name}-secondary-range"
    ip_cidr_range = var.secondary_cidrs[0]
  }
  
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.project_name}-allow-ssh"
  network = google_compute_network.vpc.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.internal_cidrs
  target_tags   = ["allow-ssh"]
  
}

resource "google_compute_firewall" "allow-postgres" {
  name    = "${var.project_name}-allow-postgres"
  network = google_compute_network.vpc.id

  allow {
    protocol = "tcp"
    ports    = ["5432"]
  }

  source_ranges = var.internal_cidrs
  target_tags   = ["allow-postgres"]
  priority = 1000
  direction = "INGRESS"
  
}