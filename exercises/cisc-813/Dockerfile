# Build the Planutils image and install the selected packages
FROM aiplanning/planutils:latest

# Needed for the server (useful for many of the modules with the vscode plugin)
RUN pip3 install flask

# Uncomment whichever subset (or all) of the following you want to install

# FOD + ADL
RUN planutils install -f -y lama-first
RUN planutils install -f -y lama

# FOND
RUN planutils install -f -y prp

# RDDL

# PPOS
RUN planutils install -f -y poprp
# RUN planutils install -f -y cpor

# Temporal

# Hybrid

# Epistemic

CMD planutils activate
