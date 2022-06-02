import getopt
import sys

def process_args(argv):
     opts, args = getopt.getopt(argv[1:], "c:", ["config_file="])
     print(opts)
     print(args)

sys.modules[__name__] = process_args