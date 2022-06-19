variable "github_token" {
  type = string
  description = "PAT Token for the account"
  sensitive = true
}

variable "genereted_repo_name" {
  type = string
  description = "Name of the future repository "
}

variable "cloud_provider" {
  type = string
  description = "Name of could provider that will host client's solution"
  default = "azure"
  
}

# general configs for application 
variable "project_name" {
  type = string
  description = "Project name"
}

variable "environment" {
  type = string
  default = "dev"
  description = "Environment (dev / stage / prod)"
}


# azure related variables 

variable "tenant_id" {
  type = string
  description = "Azure active directory id"
  sensitive = true
  default = ""
}

variable "client_id" {
  type = string
  description = "Azure client id"
  sensitive = true
  default = ""
}

variable "client_secret" {
  type = string
  description = "Azure client secret for the application"
  sensitive = true
  default = ""
}

variable "subscription_id" {
  type = string
  description = "Azure subscription id that would be used"
  sensitive = true
  default = ""
}

variable "location" {
  type = string
  description = "cloud region to deploy module to"
  default = ""
}

# gcp variables

variable "service_token" {
    type = string
    description = "GCP service account token"
    sensitive = true
    default = ""
}

variable "service_account_name" {
    type = string
    description = "GCP service account name"
    sensitive = true
    default = ""
}

variable "project_id" {
    type = string
    description = "Project id on GCP"
    default = ""
}

variable "region" {
    type = string
    description = "GCP region to host the generated solution"
    default = ""
}

variable "zone" {
    type = string
    description = "GCP zone to host the generated solution"
    default = ""
}

# templates variables

variable "template" {
  type = string
  description = "Code template name"
  default = ""
}