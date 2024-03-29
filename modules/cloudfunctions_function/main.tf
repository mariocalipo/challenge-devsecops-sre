// Creates a new Cloud Function

resource "google_storage_bucket" "main" {
  name     = var.storage_bucket.name
  location = var.storage_bucket.location
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "main" {
  name   = var.storage_bucket_object.name
  bucket = google_storage_bucket.main.name
  source = data.archive_file.main.output_path
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

resource "google_project_service" "run" {
  project = data.google_project.current.id 
  service = "run.googleapis.com"
}

resource "google_cloudfunctions2_function" "main" {
  name        = var.cloudfunctions_function.name
  location    = var.cloudfunctions_function.location
  description = var.cloudfunctions_function.description

  build_config {
    runtime     = var.cloudfunctions_function.runtime
    entry_point = var.cloudfunctions_function.entry_point
    source {
      storage_source {
        bucket = google_storage_bucket.main.name
        object = google_storage_bucket_object.main.name
      }
    }
  }

  service_config {
    max_instance_count = 1
    available_memory   = var.cloudfunctions_function.available_memory_mb
    timeout_seconds    = 60
  }

  depends_on = [google_project_service.cloud_functions, google_project_service.artifact_registry, google_project_service.cloudbuild, google_project_service.run]

}

// IAM entries
resource "google_cloud_run_service_iam_member" "member" {
  location = google_cloudfunctions2_function.main.location
  service  = google_cloudfunctions2_function.main.name
  role     = "roles/run.invoker"
  member   = "allUsers"

  depends_on = [ google_cloudfunctions2_function.main ]
}

resource "google_storage_bucket_iam_member" "viewer" {
  bucket = google_storage_bucket.main.name
  role   = "roles/storage.objectViewer"
  member = var.storage_bucket.member

  depends_on = [ google_storage_bucket.main ]
}