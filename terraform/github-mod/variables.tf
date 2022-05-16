variable "github_token" {
  type = string
  description = "PAT Token for the account"
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
variable "project" {
  type = string
  default = "templ"
  description = "Project name"
}

variable "environment" {
  type = string
  default = "dev"
  description = "Environment (dev / stage / prod)"
}

variable "location" {
  type = string
  description = "cloud region to deploy module to"
}


# azure related variables 

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