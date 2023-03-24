
# python run.py dom.rddl prob.rddl <rounds (e.g., 30)> <time (e.g., 300)>

import sys

if len(sys.argv) != 5:
    print('Usage: python run.py dom.rddl prob.rddl <rounds (e.g., 30)> <time (e.g., 300)>')
    sys.exit(1)

from pyRDDLGym.Policies.RDDLSimAgent import RDDLSimAgent
agent = RDDLSimAgent(sys.argv[1], sys.argv[2], int(sys.argv[3]), int(sys.argv[4]))
agent.run()
agent.dump_data('/workspace/data.json')
