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
  visibility = "public"
}