// Manages a VM instance resource within GCE

resource "google_compute_instance" "main" {
  count = var.compute_instance.instance_count

  name         = "${var.config.name}-${count.index}"
  machine_type = var.compute_instance.machine_type
  zone         = var.compute_instance.zone

  boot_disk {
    initialize_params {
      image = var.compute_instance.boot_disk.image
    }
  }

  network_interface {
    network = var.compute_instance.network_interface.network

  }

}