resource "github_repository" "created-by-app-dem-s1" {
  name             = var.genereted_repo_name
  description      = "A demo GitHub repository created by Terraform"
  visibility = "private"
}

resource "github_actions_secret" "azure_secrets" {

  for_each = var.cloud_provider == "azure" ? {
    tenant_id: var.tenant_id
    subscription_id: var.subscription_id
    client_id: var.client_id
    client_secret: var.client_secret
    project: var.project_name
    environment: var.environment
    location: var.location
    } : {}
  repository       = github_repository.created-by-app-dem-s1.name
  secret_name      = each.key
  plaintext_value  = each.value
}

resource "github_actions_secret" "gcp_secrets" {
  for_each = var.cloud_provider == "gcp" ? {
    service_token: var.service_token
    service_account_name: var.service_account_name
    project_id: var.project_id
    project_name: var.project_name
    region: var.region
    zone: var.zone
    } : {}
  repository       = github_repository.created-by-app-dem-s1.name
  secret_name      = each.key
  plaintext_value  = each.value
}

