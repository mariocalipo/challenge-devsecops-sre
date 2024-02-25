// Datasets allow you to organize and control access to your tables

resource "google_bigquery_dataset" "main" {
  dataset_id                  = var.bigquery_dataset.dataset_id
  friendly_name               = var.bigquery_dataset.friendly_name
  description                 = var.bigquery_dataset.description
  location                    = var.bigquery_dataset.location
  default_table_expiration_ms = var.bigquery_dataset.default_table_expiration_ms

  labels = {
    env = "default"
  }
}

// Creates a table resource in a dataset for Google BigQuery

resource "google_bigquery_table" "main" {
  dataset_id = google_bigquery_dataset.main.dataset_id
  table_id   = var.bigquery_table.table_id

  time_partitioning {
    type = "DAY"
  }

  labels = {
    env = "default"
  }

  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF

}

resource "google_bigquery_table" "sheet" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "sheet"

  external_data_configuration {
    autodetect    = true
    source_format = "GOOGLE_SHEETS"

    google_sheets_options {
      skip_leading_rows = 1
    }

    source_uris = [
      "https://docs.google.com/spreadsheets/d/123456789012345",
    ]
  }
}