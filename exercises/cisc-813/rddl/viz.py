
import argparse, json

USAGE = "python viz.py data.json"

RED = '\x1b[6;30;41m'
DARKRED = '\x1b[6;30;48;5;124m'
GREEN = '\x1b[6;30;42m'
DARKGREEN = '\x1b[6;30;48;5;28m'


def main(data):
    traces = []
    for trace in data:
        traces.append([])
        for step in trace:
            traces[-1].append(step['state'])

    for trace in traces:
        print_trace(trace)

def print_trace(trace):

    fluents = list(sorted(trace[0].keys()))
    maxfluentlen = max(len(f) for f in fluents)+2

    print()
    for f in  fluents:
        # print the fluent right aligned with maxfluentlen characters
        print(f.rjust(maxfluentlen), end=' ')
        lastf = "init"
        for t in trace:
            if t[f] != lastf:
                lastf = t[f]
                if t[f]:
                    print(GREEN + '  ' + '\x1b[0m', end=' ')
                else:
                    print(RED + '  ' + '\x1b[0m', end=' ')
            else:
                if t[f]:
                    print(DARKGREEN + '  ' + '\x1b[0m', end=' ')
                else:
                    print(DARKRED + '  ' + '\x1b[0m', end=' ')
        print()
    print()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('data', help='Path to data file')
    args = parser.parse_args()

    with open(args.data) as f:
        data = json.load(f)

    main(data)

