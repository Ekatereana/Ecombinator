import os
import sys
import subprocess
import json

sys.path.insert(1, os.path.join(os.path.dirname(__file__), 'helpers'))
sys.path.insert(1, os.path.join(os.path.dirname(__file__), 'scripts'))

import process_cmd_args
import validation
import process_config


DEFAULT_CONFIGS = ['provider', 'version_control', 'app']


def pass_validation(config):
    return validation(config, DEFAULT_CONFIGS)


def shell_source(script, env):
    """Function for run source in bash, set public env variables"""
    pipe = subprocess.Popen(". %s; env" %
                            script, stdout=subprocess.PIPE, shell=True, env=env)
    output = pipe.communicate()[0].decode('utf-8')
    env = dict(line.split("=", 1) for line in output.splitlines())
    os.environ.update(env)
    return os.environ.copy()

def sev_shell_sources(scripts, env):
    for script in scripts:
        env = shell_source(script, env)
    return env


def init_environment(config):
    # add public keys to env
    subprocess.run(
        ['./scripts/init.sh'],
        shell=True)
    configured_env = process_config.config_to_env(config, DEFAULT_CONFIGS)
    configured_env["PATH"] = "/usr/sbin:/sbin:" + configured_env["PATH"]
    expanded_env = sev_shell_sources(
        [
            './scripts/public.env'
        ], 
        configured_env)
    return expanded_env


def run_repository_init(composed_env):
    subprocess.run(
        [
            './scripts/create/' +
            os.getenv('version_control_type') +
            '/' +
            os.getenv('provider_type') +
            '.sh'
        ],
        shell=True,
        env=composed_env)


def run_code_composing(composed_env):
    subprocess.run(
        [
            './scripts/init_content/' +
            os.getenv('app_type') +
            '.sh'
        ],
        shell=True,
        env=composed_env)


def read_env_config(filename):
    with open(filename, 'r') as file:
        config = json.load(file)
        isValid, message = pass_validation(config)
        return isValid, config


def parse_env_config_file(filename):
    isValid, config = read_env_config(filename)
    if (isValid):
        env = init_environment(config)
        return env
    else:
        raise Exception('Incorrect json config')


def generate_project(config):
    env = parse_env_config_file(config)
    run_repository_init(env)
    run_code_composing(env)


def revoke_resources(config):
    env = parse_env_config_file(config)
    subprocess.run(
         [
            './scripts/revoke/' +
            os.getenv('version_control_type') +
            '/' +
            os.getenv('provider_type') +
            '.sh'
        ],
        shell=True,
        env=env)


def run(args):
    if args.revoke:
        revoke_resources(args.config[0])
    else:
        generate_project(args.config[0])


if __name__ == "__main__":
    args = process_cmd_args()
    run(args)
