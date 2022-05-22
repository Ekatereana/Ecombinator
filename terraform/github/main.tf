terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  token        = var.github_token
}


resource "github_repository" "created-by-app-dem" {
  name             = var.genereted_repo_name
  description      = "A demo GitHub repository created by Terraform"
  visibility = "private"
}


resource "github_actions_secret" "azure_int_secret" {
  for_each = var.cloud_provider == "azure" ? {
    tenant_id: var.tenant_id
    subscription_id: var.subscription_id
    client_id: var.client_id
    client_secret: var.client_secret
    project: var.project
    environment: var.environment
    location: var.location
    } : {}
  repository       = github_repository.created-by-app-dem.name
  secret_name      = each.key
  plaintext_value  = each.value
}