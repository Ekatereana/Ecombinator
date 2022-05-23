import os

# This function sets the evn variable with name and value
def set_env_var(name, value):
     os.environ[name] = value

# This function maps composed obj to the evn variables with names 
# of attributes and values
def obj_to_config(configs):
    for config, value in configs.items():
        set_env_var(config, value)

# This function maps obj consisted from another objs and inline 
# attributes to env configurations
def config_to_env(json_config, composed_config): 
    for config, value in json_config.items():
        if config in composed_config:
            obj_to_config(value)
        else:
           set_env_var(config, value)
    return os.environ.copy()
    