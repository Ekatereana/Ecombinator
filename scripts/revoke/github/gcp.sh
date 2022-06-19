#!/bin/bash

mkdir -p "${temp_folder}"

cd "${temp_folder}"

git clone "https://${github_access_token}@github.com/${github_username}/${repository_name}.git" 
cd "${repository_name}/${terraform_config}"
terraform init

if [[ $service_token_type == "сontent" ]]; then
key_content="${service_token}"
else
key_content="../../../${service_token}" 
fi

TF_VAR_project_name="${project_name}" \
TF_VAR_project_id="${project_id}" \
TF_VAR_service_token="${key_content}" \
TF_VAR_service_account_name="${service_account_name}" \
TF_VAR_region="${region}" \
terraform destroy --auto-approve
cd ../../../
rm -rf "${temp_folder}"

cd ./terraform/github/

# general \ version contol \ provider
TF_VAR_cloud_provider="${provider_type}"  \
TF_VAR_environment="${environment}" \
TF_VAR_project_name="${project_name}" \
TF_VAR_github_token="${github_access_token}" \
TF_VAR_genereted_repo_name="${repository_name}" \
TF_VAR_project_id="${project_id}" \
TF_VAR_service_token="${service_token}" \
TF_VAR_service_account_name="${service_account_name}" \
TF_VAR_region="${region}" \
TF_VAR_zone="${zone}" terraform destroy --auto-approve

cd ../../