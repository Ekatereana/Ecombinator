import os
import sys
import subprocess
import json

sys.path.insert(1, os.path.join(os.path.dirname(__file__), 'helpers'))
import validation
import process_settings

DEFAULT_CONFIGS = ['provider', 'version_control']

def pass_validation(settings):
        return validation(settings, DEFAULT_CONFIGS)

def init_environment(settings):
        # add public keys to env
        subprocess.run(
                ['./scripts/init.sh'], 
                shell=True)
        return process_settings.config_to_env(settings, DEFAULT_CONFIGS)

def run_repository_init(env):
        subprocess.run(['./scripts/version_control/' +
          os.getenv('version_control_type') + '.sh'],
          shell=True,
          env=env)

        

with open('./local.settings.json', 'r') as file:
        settings = json.load(file)
        isValid, message = pass_validation(settings)
        print(message)
        if (isValid):
                env = init_environment(settings)
                run_repository_init(env)

        

