// Development Environment

config = {
  // Pub/Sub
  pubsub-01 = {
    topic = {
      name = "pubsub-01-topic"
    }
    subscription = {
      name = "pubsub-01-subscription"
    }
  }
  // BigQuery
  bigquery-01 = {
    bigquery_dataset = {
      dataset_id = "test01"
      friendly_name = "test01"
      description = "Database for Data Analysis"
      location = "US"
      default_table_expiration_ms = "3600000"
    }
    bigquery_table = {
      table_id = "test01"
    }
  }
  // Compute Instances
  ingestion_instance = {
    instance_count = "1"
    name         = "ingestion"
    machine_type = "e2-medium"
    zone         = "us-central1-a"
    boot_disk = {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
    network_interface = {
      network = "default"
    }
  }
}