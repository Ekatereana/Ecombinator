#!/bin/bash

cd ./terraform/github/

if [[ $service_token_type == "сontent" ]]; then
key_content="${service_token}"
else
key_content=$( cat "../../${service_token}" | sed 's/"/\\"/g' | tr -d \\n | sed -e "s/.*/\"&\"/g" ) 
fi


terraform init
# general \ version contol \ provider
TF_VAR_cloud_provider="${provider_type}" \
TF_VAR_environment="${environment}" \
TF_VAR_project_name="${project_name}" \
TF_VAR_github_token="${github_access_token}" \
TF_VAR_genereted_repo_name="${repository_name}" \
TF_VAR_project_id="${project_id}" \
TF_VAR_service_token="${key_content}" \
TF_VAR_service_account_name="${service_account_name}" \
TF_VAR_template="${template}" \
TF_VAR_region="${region}" \
TF_VAR_zone="${zone}" terraform apply -auto-approve

cd ../../