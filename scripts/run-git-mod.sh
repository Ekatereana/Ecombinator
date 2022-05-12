#/bin/bash
cd github-mod/

terraform init
TF_VAR_github_token="${github_access_token}" TF_VAR_genereted_repo_name="${generated}" terraform apply
