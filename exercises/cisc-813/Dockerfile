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

# HTN
RUN planutils install -f -y panda

COPY htn/htnviz.py /workspace/bin/htnviz.py
RUN echo "#!/bin/bash" >> /usr/local/bin/panda-viz
RUN echo "panda \$@ | tee panda.out" >> /usr/local/bin/panda-viz
RUN echo "python3 /workspace/bin/htnviz.py panda.out" >> /usr/local/bin/panda-viz
RUN chmod 777 /usr/local/bin/panda-viz

# Temporal
RUN planutils install -f -y popf
RUN planutils install -f -y optic

COPY temporal/make-music.py /workspace/bin/make-music.py
RUN echo "#!/bin/bash" >> /usr/local/bin/make-music
RUN echo "python3 /workspace/bin/make-music.py \$@" >> /usr/local/bin/make-music
RUN chmod 777 /usr/local/bin/make-music


# Hybrid
RUN planutils install -f -y enhsp


# Epistemic
RUN planutils install -f -y rpmep


# Misc
RUN planutils install -f -y val

COPY fetch.py /workspace/bin/fetch.py
RUN echo "#!/bin/bash" >> /usr/local/bin/fetch-exercise
RUN echo "python3 /workspace/bin/fetch.py \$@" >> /usr/local/bin/fetch-exercise
RUN chmod 777 /usr/local/bin/fetch-exercise

RUN planutils configure -s PAAS_SERVER http://cisc813.caslab.queensu.ca:5001

WORKDIR /root/cisc813

# Comment out this line (or modify and deploy your own PaaS) if using outside of
#  the Queen's University context.
RUN planutils configure -s PAAS_SERVER http://cisc813.caslab.queensu.ca:5001

CMD planutils activate
