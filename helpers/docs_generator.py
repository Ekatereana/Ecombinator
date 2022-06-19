import os
import sys
from json_schema_for_humans.generate import generate_from_filename
from json_schema_for_humans.generation_configuration import GenerationConfiguration

SCHEMAS = os.path.join(os.path.dirname(__file__), '..', 'schemas')
INPUT = './schemas/input.schema.json'
DOCS = './docs/schemas.html'




def generate():
    config = GenerationConfiguration(description_is_markdown=True, expand_buttons=True)
    generate_from_filename(INPUT, DOCS, config=config)

sys.modules[__name__] = generate