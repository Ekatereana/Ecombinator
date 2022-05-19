import json
import sys
import jsonschema
from jsonschema import validate

SCHEMA = '../schemas/input.schema.json'


def get_schema():
    """This function loads the given schema available"""
    with open(SCHEMA, 'r') as file:
        schema = json.load(file)
    return schema


def validate(json_data):
    """REF: https://json-schema.org/ """
    # load data schema
    execute_api_schema = get_schema()

    try:
        validate(instance=json_data, schema=execute_api_schema)
    except jsonschema.exceptions.ValidationError as err:
        print(err)
        err = "Given JSON data is InValid"
        return False, err

    message = "Given JSON data is Valid"
    return True, message

sys.modules[__name__] = validate
