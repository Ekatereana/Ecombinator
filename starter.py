import os
import sys
import subprocess
import json

sys.path.insert(1, os.path.join(os.path.dirname(__file__), 'helpers'))
sys.path.insert(1, os.path.join(os.path.dirname(__file__), 'scripts'))

import process_settings
import validation
import process_cmd_args




DEFAULT_CONFIGS = ['provider', 'version_control', 'app']


def pass_validation(settings):
    return validation(settings, DEFAULT_CONFIGS)


def shell_source(script, env):
    """Function for run source in bash, set public env variables"""
    pipe = subprocess.Popen(". %s; env" %
                            script, stdout=subprocess.PIPE, shell=True, env=env)
    output = pipe.communicate()[0].decode('utf-8')
    print(output)
    env = dict(line.split("=", 1) for line in output.splitlines())
    os.environ.update(env)
    return os.environ.copy()


def init_environment(settings):
    # add public keys to env
    subprocess.run(
        ['./scripts/init.sh'],
        shell=True)
    configured_env = process_settings.config_to_env(settings, DEFAULT_CONFIGS)
    configured_env["PATH"] = "/usr/sbin:/sbin:" + configured_env["PATH"]
    expanded_env = shell_source('./scripts/public.env', configured_env)

    return expanded_env


def run_repository_init(composed_env):
    subprocess.run([
            './scripts/version_control/' +
            os.getenv('version_control_type') +
            '/' +
            os.getenv('provider_type') +
            '.sh'
        ],
        shell=True,
        env=composed_env)


def run_code_composing(composed_env):
    subprocess.run(['./scripts/init_content.sh'],
                   shell=True,
                   env=composed_env)


def run():
    with open('./v2.local.settings.json', 'r') as file:
        settings = json.load(file)
        isValid, message = pass_validation(settings)
        print(message)
        if (isValid):
                env = init_environment(settings)
                run_repository_init(env)
                run_code_composing(env)


if __name__ == "__main__":
        process_cmd_args(sys.argv)
        run()
