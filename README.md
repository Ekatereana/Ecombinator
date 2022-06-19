# Commerce Composer Package
```
                          _     _             _             
  ___  ___ ___  _ __ ___ | |__ (_)_ __   __ _| |_ ___  _ __ 
 / _ \/ __/ _ \| '_ ` _ \| '_ \| | '_ \ / _` | __/ _ \| '__|
|  __/ (_| (_) | | | | | | |_) | | | | | (_| | || (_) | |   
 \___|\___\___/|_| |_| |_|_.__/|_|_| |_|\__,_|\__\___/|_|   

```   

CLI tool for composing commerce infrastructures in one click


# Getting started 

1. install local dependencies with
```
pip install -r ./requirements.txt
```
2. allow reading and make alias 
```
chmod +x './ecombinator.sh' 
COMPOSER_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
alias ecom="${DIR}/ecombinator.sh"
```
3. run ecom --help command to see details

# Usage

***__Commerce-Composer__*** allows you to automate creation of small business projects\
such as landing pages, function app etc.

With commerce composer you can create, and delete could resources and repositories in one click

- Check the documentation on settings [here](https://ekatereana.github.io/Ecombinator/)
- Check [settings examples folder](./examples/settings/)
### Available cloud providers
- Google Cloud Platform 
- Microsoft Azure

### Available code templates
- Google cloud storage static website hosting
- Azure Lambda function hosting

# Contribution

Check details of contribution process [here](./guidelines/contribution.md)