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
      dataset_id = "latam_devops_dataset"
      friendly_name = "latam_devops_dataset"
      description = "Database for Data Analysis"
      location = "US"
      default_table_expiration_ms = "3600000"
    }
    bigquery_table = {
      table_id = "latam_devops_table"
    }
  }
  // Cloud Functions
  cloudfunctions-01 = {
    storage_bucket = {
      name = "latam-cloudfunctions-01-mariocalipo"
      location =  "US"
    }
    storage_bucket_object = {
      name = "function.zip"
      source = "./function/function.zip"
    }
    cloudfunctions_function = {
      name = "data-expose"
      description = "latamprocess"
      runtime = "nodejs16"
      available_memory_mb = "128"
      trigger_http = "true"
      entry_point = "helloGET"
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