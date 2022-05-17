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

# clone the ci-cd config base
git remote add -f "$workflow_remote" "$workflow"
git pull "$workflow_remote" "${workflow_branch}"

# clone the main-code-base repository
git remote add -f "$function_remote" "$function"
git pull "$function_remote" "${function_branch}" --allow-unrelated-histories


# commit new changes (merge histories)
git add . 
git commit -m "${initial_commit_message} :: add main code base"

# push to created repo
git push "https://${github_access_token}@github.com/${github_username}/${generated}.git" "HEAD:refs/heads/main"

cd ../

rm -rf "${temp_folder}"

