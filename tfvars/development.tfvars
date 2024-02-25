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
  cloudfunctions-01 = {
    storage_bucket = {
      name = "latam-cloudfunctions-01-mariocalipo"
      location =  "US"
    }
    storage_bucket_object = {
      name = "main.zip"
      source = "./function/main.zip"
    }
    cloudfunctions_function = {
      name = "data-expose"
      description = "latamprocess"
      service_account_email = "mariohtcalipo@gmail.com"
      runtime = "python310"
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