
FROM ubuntu:22.04 AS builder


RUN apt-get update && apt-get -y install locales
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata

RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    build-essential \
    cmake           \
    make            \
    g++             \
    git             \
    libgmp3-dev     \
    make            \
    python3         \
    wget            \
    time            \
    graphviz        \
    time            \
    bc              \
    zlib1g-dev      \
    bison           \
    flex            \
    libbdd-dev      \
    vim

# install python and related
RUN apt-get install -y python3 python3-dev python3-pip python3-venv python-is-python3
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade graphviz
RUN pip3 install --upgrade networkx
RUN pip3 install --upgrade pydot


# install z3
WORKDIR /workspace
RUN git clone https://github.com/Z3Prover/z3.git
WORKDIR /workspace/z3
RUN python scripts/mk_make.py --prefix=/workspace/z3-install
WORKDIR /workspace/z3/build
RUN make
RUN make install
ENV Z3_ROOT=/workspace/z3-install


# install pyrddl
RUN apt-get install --no-install-recommends -y libsdl2-dev libfreetype6-dev
RUN pip3 install --upgrade ply
RUN pip3 install --upgrade pillow
RUN pip3 install --upgrade numpy
RUN pip3 install --upgrade matplotlib
RUN pip3 install --upgrade gym
RUN pip3 install --upgrade pygame
RUN pip3 install --upgrade requests


# RUN pip3 install --upgrade pyRDDLGym
WORKDIR /workspace
RUN git clone https://github.com/haz/pyRDDLGym.git


# install prost
WORKDIR /workspace
RUN git clone https://github.com/prost-planner/prost
WORKDIR /workspace/prost
RUN python build.py
RUN cp builds/release/rddl_parser/rddl-parser rddl-parser-release
RUN cp builds/release/search/search search-release

# Copy in the run scripts
COPY run.py /workspace/pyRDDLGym/run.py
RUN mkdir /workspace/bin
COPY run.sh /workspace/bin/rddlprost
COPY viz.py /workspace/bin/viz.py

# Add alias to vizualize things
RUN echo "alias viz='python3 /workspace/bin/viz.py'" >> ~/.bashrc

COPY fetch.py /workspace/fetch.py
RUN echo "#!/bin/bash" >> /workspace/bin/fetch-exercise
RUN echo "python3 /workspace/fetch.py \$@" >> /workspace/bin/fetch-exercise

ENV PATH="/workspace/bin:${PATH}"
RUN chmod -R 777 /workspace/bin

WORKDIR /PROJECT

ENTRYPOINT ["/bin/bash"]

