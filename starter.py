import os
import sys
import json


sys.path.insert(1, os.path.join(os.path.dirname(__file__), 'helpers'))
import validation


with open('./local.settings.json', 'r') as file:
        settings = json.load(file)
        validation(settings)

