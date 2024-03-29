// Development Environment

config = {
  // BigQuery
  bigquery-01 = {
    bigquery_dataset = {
      dataset_id = "latam_devops_dataset"
    }
    bigquery_table = {
      table_id = "latam_devops_table"
    }
  }
  // Pub/Sub
  pubsub-01 = {
    topic = {
      name = "pubsub-01-topic"
    }
    subscription = {
      name = "pubsub-01-subscription"
    }
  }
  // Cloud Functions
  combined_function = {
    storage_bucket = {
      name = "latam-combined-function-mariocalipo"
      location =  "US"
      member = "user:mariohtcalipo@gmail.com"
    }
    storage_bucket_object = {
      name = "main.zip"
      source = "./functions/"
    }
    cloudfunctions_function = {
      name = "combined-function-mariocalipo"
      description = "Cloud Function for combined functionality"
      location = "us-central1"
      runtime = "python312"
      available_memory_mb = "256M"
      trigger_http = "true"
      entry_point = "http_response"
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