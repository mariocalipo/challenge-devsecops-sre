data "google_project" "current" {}

data "archive_file" "main" {
  type        = "zip"
  output_path = "/tmp/main.zip"
  source_dir  = "./functions/"
}