provider "google" {
  project = var.project_id
  credentials = var.service_token
  region = var.region
  zone = var.zone

}

resource "google_cloud_run_service" "cc-generated" {
  name     = var.project_name
  location = var.region

  traffic {
    percent         = 100
    latest_revision = true
  }
}