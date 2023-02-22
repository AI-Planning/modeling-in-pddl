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
- Shuttles that move on a circuit (intersecting with other circuits) using a large set of `when` clauses.
- Shuttles that pickup and dropoff all passengers that satisfy desired preferences (mix of `forall` and `when`).
- Shuttles that stop when someone wants off (demonstrating `exists`).
- Only allowing moving when it looks safe

These elements are introduced incrementally throughout the exercise. The PDDL found in the [`adl`](adl/) directory is numbered based on the step of the tutorial, and the final completed version of the domain is just named [domain.pddl](adl/domain.pddl) and [problem.pddl](adl/problem.pddl). Finally, the slides are in the [`adl`](adl/) directory [here](adl/slides.pptx).

----

## Fully Observable Non-deterministic Planning

This tutorial walks students through increasingly complex applications of non-determinism in PDDL. It is loosely based on the tried-and-true Canadian Traveller's Problem (CTP) domain, but with a few twists to make it more interesting. The slides and PDDL (template + complete) are all in the [`fond`](fond/) directory. Aspects explored:

- Simple non-determinism that disables the repeated sensing (encoding simple observability).
- Nesting of non-determinism in universal (check all adjacent roads).
- Reset actions that can bring things back to being fair (encoding technique).
- Nesting of oneof clauses (if a road is passable, only one way is).
- Long-lived agent that resets when everything is clear (shifting to a snow-plow perspective).

----

## Probabilistic Planning

### Summary

- Focuses on the RDDL language.
- Exercise walks through the fire fighter domain.
- Slides for the tutorial are [here](rddl/slides.pptx).

### Setup

- Use the custom Dockerfile provided in the [`rddl`](rddl/) directory.
- It will take a while to build (largely due to z3 being required)
- Once built, students can mount a local directory (with their rddl code in it) using,

```bash
docker run -it -v $(pwd):/PROJECT rddlprost
```

----

## Partially Observable Planning

Walks through Secredoku -- a made up domain that has an embodied agent walking around a Sudoku board (or teleporting) in order to solve things. Also explores how limited sensing can be done with an object-based counting mechanism. Planners used are POPRP and CPOR, both of which are equipped to visualize contingent plans. Slides and PDDL are in the [`ppos`](ppos/) directory.

----

## Temporal Planning

Coming soon...

----

## Hybrid Planning

Coming soon...

----

## Epistemic Planning

Coming soon...
