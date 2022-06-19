import sys
import os

import json
import jsonschema

SCHEMAS = os.path.join(os.path.dirname(__file__), '..', 'schemas')
INPUT = '/input.schema.json'

def load_schemas_from_dir(dir, schemas):
    """This function loads all schemas in one directory"""
    for filename in os.listdir(dir):
        with open(os.path.join(dir, filename), 'r') as f:
            schemas.append(json.load(f))
    return schemas


def load_schema_variants(config, schemas):
    "This function loads schemas for specific config"
    return load_schemas_from_dir(config, schemas)


def load_all_schemas(config_options):
    """This function loads the given schema available"""
    ref_schemas = []

    for config in config_options:
        ref_schemas = load_schema_variants( os.path.join(SCHEMAS , config), ref_schemas)

    with open(SCHEMAS + INPUT, 'r') as j:
            main_schema = json.load(j)
    
    return main_schema, ref_schemas

def build_refs(main, refs):
    """This function builds dictionary of refs for jsonschema app"""
    store = {
        main.get('$id') : main,
    }

    for ref in refs:
        store[ref.get('$id')] = ref

    return store


def validate_schema(json_data, config_options):
    # load data schema
    main, refs = load_all_schemas(config_options)
    store = build_refs(main, refs)

    try:
        resolver = jsonschema.RefResolver.from_schema(main, store=store)
        jsonschema.validate(json_data, main, resolver=resolver)
    except jsonschema.exceptions.ValidationError as err:
        print(err)
        err = "Given JSON data is InValid"
        return False, err
    message = "Given JSON data is Valid"
    return True, message


sys.modules[__name__] = validate_schema
