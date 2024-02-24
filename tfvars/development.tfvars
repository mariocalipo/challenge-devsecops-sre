// Development Environment

config = {
  // Compute Instances
  ingestion_instance = {
    name         = "ingestion"
    machine_type = "e2-medium"
    zone         = "us-central1"
    boot_disk = {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
    network_interface = {
      network = "default"
    }
  }
}