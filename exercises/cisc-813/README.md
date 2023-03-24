# CISC 813: Automated Planning

This repository contains the exercises for the course CISC 813: Automated Planning, taught at Queen's University by [Christian Muise](http://haz.ca). For 8 different formalisms, it contains the slide deck, example PDDL/RDDL files, final example files, and build scripts needed to get students started.


----

## General

All of the exercises (with the exception of RDDL) can be run using a pre-existing Docker container build for the course. Instructions for students to run once before the term/tutorial (and then again if there are updates to the container) are as follows:

```bash
docker pull cjmuise/cisc813
```

Then, from a directory students wish to work from, they can run the following command to get a shell in the container:

```bash
docker run -it --privileged -v $(pwd):/root/cisc813 cjmuise/cisc813
```

This will mount the current directory as `/root/cisc813` in the container, and will also give the container ability to run the planners (`--privileged` is required for planutils).

In each of the slide decks, there will be examples indicated by a pair of terms: `{formalism} / {example}`. These can be retrieved by the students, in the docker image above, but running the following command:

```bash
fetch-exercise {formalism} {example}
```

Alternatively, these can be found via the online PDDL editor at the URL: `http://editor.planning.domains/planning-course/{formalism}/{example}`

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

### Alternative Setup

The following docker image can be used (simply a pre-built version of the above):

```bash
docker pull cjmuise/cisc813-rddlprost
```

----

## Partially Observable Planning

Walks through Secredoku -- a made up domain that has an embodied agent walking around a Sudoku board (or teleporting) in order to solve things. Also explores how limited sensing can be done with an object-based counting mechanism. Planners used are POPRP and CPOR, both of which are equipped to visualize contingent plans. Slides and PDDL are in the [`ppos`](ppos/) directory.

----

## Temporal Planning

General idea is to build a model that corresponds to playing music through a chord progression. Tackles things with heavy use of functions / numeric variables (e.g., counting the times a note is played), and chords + chord changes play a role in making things interesting temporally. Additional notes:

- Uses `popf` or `optic` for the planner
- Both must be run with the `-T` option, since the partial-order search plateaus quickly
- "Chord change" presents an interesting element to wrap the end/start of actions (chord plays)
- "Chord" presents an interesting example of wrapping a set of durative actions (the notes played)
- Students can toy around with the initial / final numeric constraints, making the melody more or less complex
- A script is included to convert the plan to ABC format which can be pasted online to hear the melody+chords

----

## Hybrid Planning

This exercise revisits the shuttle example (from ADL), but takes a very different angle on things. Shuttles are placed on two circuits at a continuous location (numeric function) and they loop around to run continuously. At the midway point on the two circuits, passengers can switch between them, but the shuttles will collide causing an accident. The set of exercises walks students through events, processes, modeling of timers, etc. Additional notes:

- Uses the `enhsp-2020` planner.
- Early problems can be validated by `val`, but eventually become too full of synhronous events (not allowed with the epsilon semantics of time).
- The final domain adds a significant amount to the problem, and can only be solved with specific command-line options (provided in the [slides](hybrid/slides.pptx)).
- Best to leave the final setting as one where students just explore and toy with the model.

----

## Epistemic Planning

The final tutorial setting covers epistemic planning with the `rpmep` planner. In runs through several goals of deception, misconception, etc. All of the scenarios center around agents finding/taking treasure, and then talking about it. There isn't any explicit lying actions included, but sequences of actions can demonstrate the same effect. Additional notes:

- Explores the conditioned mutual awareness.
- Includes both ontic and epistemic actions.
- Goal design plays a central role.
- Some of the problems are better investigated by keeping the PDDL files and running with an optimizing planner like lama (as it shows what a perfect reasoner would come up with). Details are included in the slides.
- "Asking" for information is modelled, as is eavesdropping.
- Being conservative with belief (so as to not hold false beliefs) is explored.
- Final example demonstrates how a pure reasoning action can be included (to capture limited disjunctive reasoning).
