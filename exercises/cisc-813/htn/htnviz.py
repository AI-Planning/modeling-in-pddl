
import sys
import urllib.parse

def htnviz(fname):
    with open(fname) as f:
        lines = [l.strip() for l in f.readlines()]
    plan = '\n'.join(lines)
    plan = plan.split("==>\n")[-1]
    plan = urllib.parse.quote(plan)

    print("Plan Visualized:")

    print(f"\n\nhttps://maumagnaguagno.github.io/HTN_Plan_Viewer/?plan={plan}\n\n")

if __name__ == "__main__":
    htnviz(sys.argv[1])
