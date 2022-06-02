variable "service_token" {
    type = string
    description = "GCP service account token"
    sensitive = true
}

variable "project_id" {
    type = string
    description = "Project id on GCP"
}

variable "project_name" {
    type = string
    description = "Project name on GCP"
}

variable "region" {
    type = string
    description = "GCP region to host the generated solution"
}

variable "zone" {
    type = string
    description = "GCP zone to host the generated solution"
}