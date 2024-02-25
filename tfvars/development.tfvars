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
  bq_query = {
    storage_bucket = {
      name = "latam-bq_query-mariocalipo"
      location =  "US"
    }
    storage_bucket_object = {
      name = "bq_query.zip"
      source = "./functions/bq_query/main.zip"
    }
    cloudfunctions_function = {
      name = "bq_query"
      description = "Cloud Function to query BigQuery"
      service_account_email = ""
      runtime = "python310"
      available_memory_mb = "128"
      trigger_http = "true"
      entry_point = "bq_query"
    }
  }
  http_response = {
    storage_bucket = {
      name = "latam-http_response-mariocalipo"
      location =  "US"
    }
    storage_bucket_object = {
      name = "http_response.zip"
      source = "./functions/http_response/main.zip"
    }
    cloudfunctions_function = {
      name = "http_response"
      description = "Cloud Function for HTTP response"
      service_account_email = ""
      runtime = "python310"
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