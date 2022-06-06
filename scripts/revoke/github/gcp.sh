cd ./terraform/github/

# general \ version contol \ provider
TF_VAR_cloud_provider="${provider_type}"  \
TF_VAR_environment="${environment}" \
TF_VAR_project_name="${project_name}" \
TF_VAR_github_token="${github_access_token}" \
TF_VAR_genereted_repo_name="${repository_name}" \
TF_VAR_project_id="${project_id}" \
TF_VAR_service_token="${service_token}"\
TF_VAR_service_account_name="${service_account_name}"\
TF_VAR_region="${region}" \
TF_VAR_zone="${zone}" terraform destroy

cd ../../