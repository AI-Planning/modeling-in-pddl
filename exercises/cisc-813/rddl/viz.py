
import argparse, json

USAGE = "python viz.py data.json"

RED = '\x1b[6;30;48;2;255;0;0m'
DARKRED = '\x1b[6;30;48;2;124m'
GREEN = '\x1b[6;30;48;5;120m'
DARKGREEN = '\x1b[6;30;48;5;28m'


def main(data):
    traces = []
    plans = []
    for trace in data:
        traces.append([])
        plans.append([])
        for step in trace:
            print(step)
            traces[-1].append(step['state'])
            if step['actions']:
                plans[-1].append(', '.join(step['actions']))
            else:
                plans[-1].append('')

    for trace, plan in zip(traces, plans):
        print_trace(trace, plan)

def print_trace(trace, plan):

    fluents = list(sorted(trace[0].keys()))
    maxfluentlen = max(len(f) for f in fluents)+2

    print("\nActions:")
    for i in range(len(plan)):
        print(str(i).rjust(2) + ': ' + str(plan[i]))

    print("\nTrace:\n")

    # Print the step numbers
    print(' '*maxfluentlen, end=' ')
    for i in range(len(trace)):
        print(str(i).rjust(2), end=' ')
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

