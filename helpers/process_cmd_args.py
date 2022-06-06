import argparse
import sys

parser = argparse.ArgumentParser(
         prog='composer',
         description='CLI tool for composing commerce infrastructure')
parser.add_argument(
     '-c','--config-file', metavar='path', type=str, action='store', nargs=1,
     dest='config', required=True, default='./local.settings.json',
     help='generate repository on configuration file (settings file in json format)')
parser.add_argument(
     '-r','--revoke', action='store_true', default=False,
     dest='revoke', required=False,
     help='destroy generated repository'
)

def process_args():
    return parser.parse_args()

sys.modules[__name__] = process_args