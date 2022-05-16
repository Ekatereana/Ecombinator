#/bin/bash

export terraform="https://github.com/grizik-templates-edition/terraform.git"
export terraform_branch="azure-func-deploy"

export function="https://github.com/grizik-templates-edition/azure-func-simple-templ.git"
export function_branch="feature/servless-connector"
export function_remote="function"

export temp_folder="temp"
export initial_commit_message="generated by the terraform + bash scripts"
export terraform_config="./terraform"

export providers=["azure"]

