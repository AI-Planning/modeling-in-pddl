
import argparse, json, os

USAGE = "python prpviz.py <json_file>"

def main():
    parser = argparse.ArgumentParser(description="Visualize the PRP solution")
    parser.add_argument("json_file", help="JSON file containing solution graph")
    args = parser.parse_args()

    with open(args.json_file) as f:
        graph = json.load(f)

    dot = "digraph {\n"

    for n in graph['nodes']:
        if n == graph['init']:
            dot = dot + f"  {n} [label=\"{graph['nodes'][n]['action']}\", shape=box];\n"
        elif n == graph['goal']:
            dot = dot + f"  {n} [label=\"{graph['nodes'][n]['action']}\", shape=doublecircle];\n"
        else:
            dot = dot + f"  {n} [label=\"{graph['nodes'][n]['action']}\"];\n"

    for (s,d,t) in graph['edges']:
        assert d == ">"
        dot = dot + f"  {s} -> {t};\n"

    dot = dot + "}\n"
    with open('graph.dot', 'w') as f:
        f.write(dot)

    os.system("dot -Tpng -o graph.png graph.dot")

if __name__ == "__main__":
    main()
