variable "project" {
  type = string
  description = "Project name"
}

variable "environment" {
  type = string
  description = "Environment (dev / stage / prod)"
}

variable "location" {
  type = string
  description = "Azure region to deploy module to"
}

variable "tenant_id" {
  type = string
  description = "Azure active directory id"
}

variable "client_id" {
  type = string
  description = "Azure client id"
}

variable "client_secret" {
  type = string
  description = "Azure client secret for the application"
}

variable "subscription_id" {
  type = string
  description = "Azure subscription id that would be used"
}