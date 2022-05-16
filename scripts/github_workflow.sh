#/bin/bash
cd ./terraform/github-mod/

terraform init
TF_VAR_github_token="${github_access_token}" \
TF_VAR_genereted_repo_name="${generated}" \
TF_VAR_provider="${provider}"  \
TF_VAR_tenant_id="${tenant_id}" \
TF_VAR_subscription_id="${subscription_id}"  \
TF_VAR_client_id="${client_id}" \
TF_VAR_client_secret="${client_secret}"  \
TF_VAR_location="${location}" \
TF_VAR_environment="${env}" \
TF_VAR_project="${project}" \
terraform apply -auto-approve

cd ../../