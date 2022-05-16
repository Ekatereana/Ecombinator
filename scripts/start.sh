#/bin/bash

# Check for required tools
declare -a req_tools=("terraform" "curl")
for tool in "${req_tools[@]}"; do
  if ! command -v "$tool" > /dev/null; then
    fail "It looks like '${tool}' is not installed; please install it and run this setup script again."
    exit 1
  fi
done

source ./scripts/env.sh
./scripts/github_workflow.sh
# ./scripts/init_content.sh