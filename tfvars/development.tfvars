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
    }
    storage_bucket_object = {
      name = "main.zip"
      source = "./functions/main.zip"
    }
    cloudfunctions_function = {
      name = "combined_function_mariocalipo"
      description = "Cloud Function for combined functionality"
      service_account_email = ""
      runtime = "python312"
      available_memory_mb = "128"
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