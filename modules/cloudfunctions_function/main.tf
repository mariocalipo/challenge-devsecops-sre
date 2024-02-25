// Creates a new Cloud Function

resource "google_storage_bucket" "main" {
  name     = var.storage_bucket.name
  location = var.storage_bucket.location
}

resource "google_storage_bucket_object" "main" {
  name   = var.storage_bucket_object.name
  bucket = google_storage_bucket.main.name
  source = var.storage_bucket_object.source
}

resource "google_project_service" "cloud_functions" {
  project = data.google_project.current.id
  service = "cloudfunctions.googleapis.com"

  disable_dependent_services = false
}

resource "google_project_service" "artifact_registry" {
  project = data.google_project.current.id
  service = "artifactregistry.googleapis.com"

  disable_dependent_services = false
}

resource "google_project_service" "cloudbuild" {
  project = data.google_project.current.id
  service = "cloudbuild.googleapis.com"

  disable_dependent_services = false
}

resource "google_cloudfunctions_function" "main" {
  name        = var.cloudfunctions_function.name
  description = var.cloudfunctions_function.description
  service_account_email = var.cloudfunctions_function.service_account_email
  runtime     = var.cloudfunctions_function.runtime

  available_memory_mb   = var.cloudfunctions_function.available_memory_mb
  source_archive_bucket = google_storage_bucket.main.name
  source_archive_object = google_storage_bucket_object.main.name
  trigger_http          = var.cloudfunctions_function.trigger_http
  entry_point           = var.cloudfunctions_function.entry_point

  depends_on = [google_project_service.cloud_functions, google_project_service.artifact_registry, google_project_service.cloudbuild]
}

// IAM entries
resource "google_cloudfunctions_function_iam_member" "main" {
  project        = google_cloudfunctions_function.main.project
  region         = google_cloudfunctions_function.main.region
  cloud_function = google_cloudfunctions_function.main.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}

resource "google_project_iam_member" "cloud_functions_reader" {
  project = data.google_project.current.id
  role    = "roles/artifactregistry.reader"

  member = "serviceAccount:${google_cloudfunctions_function.main.service_account_email}"
}