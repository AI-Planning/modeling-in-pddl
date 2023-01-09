
import argparse, json

USAGE = "python viz.py data.json"

RED = '\x1b[6;30;41m'
GREEN = '\x1b[6;30;42m'


def main(data):
    trace = [
        {
            'a': True,
            'b': False,
            'c': False,
        },
        {
            'a': False,
            'b': True,
            'c': False,
        },
        {
            'a': False,
            'b': False,
            'c': True,
        }
    ]

    print_trace(trace)

def print_trace(trace):

    fluents = list(sorted(trace[0].keys()))
    maxfluentlen = max(len(f) for f in fluents)+2

    print()
    for f in  fluents:
        # print the fluent right aligned with maxfluentlen characters
        print(f.rjust(maxfluentlen), end=' ')
        for t in trace:
            if t[f]:
                print(GREEN + '  ' + '\x1b[0m', end=' ')
            else:
                print(RED + '  ' + '\x1b[0m', end=' ')
        print()
    print()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('data', help='Path to data file')
    args = parser.parse_args()

    with open(args.data) as f:
        data = json.load(f)

    main(data)

