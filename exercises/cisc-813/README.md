# CISC 813: Automated Planning

This repository contains the exercises for the course CISC 813: Automated Planning, taught at Queen's University by [Christian Muise](http://haz.ca). For 8 different formalisms, it contains the slide deck, example PDDL/RDDL files, final example files, and build scripts needed to get students started.

----

## Fully Observable Deterministic Planning

### Summary

- Takes students through blocksworld, moving between rooms, and combining them.
- Largely driven through the online PDDL editor -- links provided in the slides.

### Setup

Nothing required -- just use the online PDDL editor, or adapt the links to open in VSCode with the PDDL plugin enabled. Slides are in the [`fod`](fod/) directory.

----

## Advanced Deterministic Modeling (ADL, etc.)

Walks through a mixed autonomous and non-autonomous domain of shuttling around passengers in a small network of nodes. Introduces a forced `step` action to occur at regular intervals (manual actions can only happen once per `step`) and exercises the following elements:

- Car that can manually move around using the usual `move` action.
- Shuttles that pickup and dropoff all passengers that satisfy desired preferences (mix of `forall` and `when`).
- Shuttles that stop when someone wants off (demonstrating `exists`).
- Shuttles that move on a circuit (intersecting with other circuits) using a large set of `when` clauses.

These elements are introduced incrementally throughout the exercise. The PDDL found in the [`adl`](adl/) directory is numbered based on the step of the tutorial, and the final completed version of the domain is just named [domain.pddl](adl/domain.pddl) and [problem.pddl](adl/problem.pddl). Finally, the slides are in the [`adl`](adl/) directory [here](adl/slides.pptx).

----

## Fully Observable Non-deterministic Planning

Coming soon...

----

## Probabilistic Planning

### Summary

- Focuses on the RDDL language.
- Exercises walk through the fire fighter domain.

### Setup

- Use the custom Dockerfile provided in the [`rddl`](rddl/) directory.

----

## Partially Observable Planning

Coming soon...

----

## Temporal Planning

Coming soon...

----

## Hybrid Planning

Coming soon...

----

## Epistemic Planning

Coming soon...
