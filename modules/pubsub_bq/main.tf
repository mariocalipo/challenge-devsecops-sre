// Named resource to which messages are sent by publishers

resource "google_pubsub_topic" "main" {
  name = var.pubsub_topic.name
}

// Datasets allow you to organize and control access to your tables

resource "google_bigquery_dataset" "main" {
  dataset_id                  = var.bigquery_dataset.dataset_id
}

// Creates a table resource in a dataset for Google BigQuery

resource "google_bigquery_table" "main" {
  deletion_protection = false
  table_id   = var.bigquery_table.table_id
  dataset_id = google_bigquery_dataset.main.dataset_id

  schema = <<EOF
[
  {
    "name": "data",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The data"
  }
]
EOF
}

// Named resource representing the stream of messages from a single, specific topic, to be delivered to the subscribing application (bq)

resource "google_pubsub_subscription" "main" {
  name   = var.pubsub_subscription.name
  topic  = google_pubsub_topic.main.id

  bigquery_config {
    table = "${google_bigquery_table.main.project}.${google_bigquery_table.main.dataset_id}.${google_bigquery_table.main.table_id}"
  }

  depends_on = [google_project_iam_member.viewer, google_project_iam_member.editor]
}

// IAM entries

resource "google_project_iam_member" "viewer" {
  project = data.google_project.current.project_id
  role   = "roles/bigquery.metadataViewer"
  member = "serviceAccount:service-${data.google_project.current.number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "editor" {
  project = data.google_project.current.project_id
  role   = "roles/bigquery.dataEditor"
  member = "serviceAccount:service-${data.google_project.current.number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}