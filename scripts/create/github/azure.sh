#/bin/bash
cd ./terraform/github/

terraform init
#general \version control \ provider
TF_VAR_cloud_provider="${provider_type}"  \
TF_VAR_environment="${environment}" \
TF_VAR_project_name="${project_name}" \
TF_VAR_github_token="${github_access_token}" \
TF_VAR_genereted_repo_name="${repository_name}" \
TF_VAR_tenant_id="${tenant_id}" \
TF_VAR_subscription_id="${subscription_id}"  \
TF_VAR_client_id="${client_id}" \
TF_VAR_client_secret="${client_secret}"  \
TF_VAR_location="${location}" \
terraform apply -auto-approve

cd ../../