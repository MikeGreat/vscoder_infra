resource "google_compute_instance" "app" {
  name         = "reddit-app-${var.environment}"
  machine_type = "g1-small"
  zone         = var.zone
  tags         = ["reddit-app"]
  boot_disk {
    initialize_params {
      image = var.app_disk_image
    }
  }
  network_interface {
    network = "${var.network_name}-${var.environment}"
    access_config {
      nat_ip = var.use_static_ip ? google_compute_address.app_ip[0].address : null
    }
  }
  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}
resource "google_compute_address" "app_ip" {
  name  = "reddit-app-ip-${var.environment}"
  count = var.use_static_ip ? 1 : 0
}
resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default-${var.environment}"
  network = "${var.network_name}-${var.environment}"
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
