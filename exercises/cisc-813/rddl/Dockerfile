
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
    libbdd-dev

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
RUN pip3 install --upgrade ply
RUN pip3 install --upgrade pillow
RUN pip3 install --upgrade numpy
RUN pip3 install --upgrade matplotlib
RUN pip3 install --upgrade gym
RUN pip3 install --upgrade pygame


# RUN pip3 install --upgrade pyRDDLGym
WORKDIR /workspace
RUN git clone https://github.com/thomaskeller79/pyRDDLGym.git


# install prost
WORKDIR /workspace
RUN git clone https://github.com/prost-planner/prost
WORKDIR /workspace/prost
RUN python build.py


ENTRYPOINT ["/bin/bash"]

