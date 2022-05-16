#/bin/bash

mkdir -p "${temp_folder}"

cd "${temp_folder}"
git init

# clonning first config repo (terraform) and clear git history
git clone -b "${terraform_branch}" "$terraform"
cd "${terraform_config}"
git remote rm origin
rm -rf .git
cd ../

# clone the main-code-base repository
git remote add -f "$function_remote" "$function"
git pull "$function_remote" "${function_branch}"

# commit new changes (merge histories)
git add . 
git commit -m "${initial_commit_message}"

# push to created repo
git push "https://${github_access_token}@github.com/${github_username}/${generated}.git" "HEAD:refs/heads/main"

cd ../

rm -rf "${temp_folder}"

