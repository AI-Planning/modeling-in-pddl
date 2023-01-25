# Build the Planutils image and install the selected packages
FROM aiplanning/planutils:latest


RUN apt-get update && apt-get -y install locales
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get update && apt-get install --no-install-recommends -y \
    graphviz

# Needed for the server (useful for many of the modules with the vscode plugin)
RUN pip3 install --upgrade flask
RUN pip3 install --upgrade graphviz


# Uncomment whichever subset (or all) of the following you want to install


# To run:  docker run -it --privileged -v $(pwd):/root cjmuise/cisc813


# FOD + ADL
RUN planutils install -f -y lama-first
RUN planutils install -f -y lama


# FOND
RUN planutils install -f -y prp
RUN mkdir /workspace
RUN mkdir /workspace/bin
COPY fond/prpviz.py /workspace/bin/prpviz.py
COPY fond/prppp.sif /workspace/bin/prppp.sif
# Add bash scripts
RUN echo "#!/bin/bash" >> /usr/local/bin/prpviz
RUN echo "python3 /workspace/bin/prpviz.py \$@" >> /usr/local/bin/prpviz
RUN chmod 777 /usr/local/bin/prpviz
RUN echo "#!/bin/bash" >> /usr/local/bin/prppp
RUN echo "singularity run /workspace/bin/prppp.sif \$@" >> /usr/local/bin/prppp
RUN chmod 777 /usr/local/bin/prppp


# RDDL
# Done with a separate dedicated docker image


# PPOS
RUN planutils install -f -y poprp
RUN planutils install -f -y cpor


# Temporal


# Hybrid


# Epistemic


# Misc
RUN planutils install -f -y val

WORKDIR /root/cisc813

CMD planutils activate
