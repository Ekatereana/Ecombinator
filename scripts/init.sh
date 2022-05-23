#!/bin/bash

# Check for required tools
req_tools=("terraform" "git" "curl")
for tool in "${req_tools[@]}"
do
  if ! command -v "$tool" > /dev/null; then
    fail  "It looks like '${tool}' is not installed; please install it and run this setup script again"
    exit 1
  fi
done
