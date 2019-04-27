import argparse

parser = argparse.ArgumentParser(description='My important application')

parser.add_argument(
    'integer', type=int, help='Integer number'
)

parser.add_argument(
    'wybr', type=str,  choices=['a','b','c']
)

parser.add_argument("-i", dest="filename", required=True,
                    help="input file with two matrices",
                    metavar="FILE")

parser.add_argument(
    '--flaga', default=False, action='store_true'
)


args = parser.parse_args()
print(args.integer)
print(args.wybr)
print(args.flaga)
print(args.filename)