import argparse
import sys


def init_parser(): 
     "Init parser with basic description"
     parser = argparse.ArgumentParser(
          prog='composer',
          description='CLI tool for composing commerce infrastructure',
          conflict_handler='resolve')
     
     # commands for resource managing

     manage_group = parser.add_argument_group('resources manage options')
     manage_group.add_argument(
          '-c','--config-file', metavar='path', type=str, action='store', nargs=1,
          dest='config',
          help='generate repository on configuration file (settings file in json format) \
          default value = ./local.settings.json')
     manage_group.add_argument(
          '-r','--revoke', action='store_true', default=False,
          dest='revoke', required=False,
          help='destroy generated repository \
               default value = false')
     
     # commands for documentation management 
     docs_group = parser.add_argument_group('documentation manage options')
     docs_group.add_argument(
          '-d', '--generate-docs', action='store_true', default=False, dest='docs',
          help='generate documentation according to schema files \
               default enter point = ./schemas/input.schema.json'
     )

     return parser




def process_args():
     parser = init_parser()
     return parser.parse_args()

sys.modules[__name__] = process_args