# Exercise: Hello World

Create two empty files `domain.pddl` and `problem.pddl` and design the simplest possible _hello world_ domain and problem, which would make the planner print `say-hello-world`.

## Challenges

Make your model more realistic by checking, whether you have (enough) breath before you start saying hello. If you then plan from a state, where you do not have breath, the plan should make sure you `breath-in` first.

## Need help?

There is no specific solution provided here. You have to type every character and to gain the full experience that you understand the basic structure and syntax of PDDL.

You will need following PDDL constructs:

- [PDDL domain](https://planning.wiki/ref/pddl/domain)
  - [Action](https://planning.wiki/ref/pddl/domain#actions)
  - [Predicate](https://planning.wiki/ref/pddl/domain#predicates)
- [PDDL problem](https://planning.wiki/ref/pddl/problem)
  - [Goal](https://planning.wiki/ref/pddl/problem#goal)

If you are unsure where to start, the live coding demo is in this video: [Modeling in PDDL - Episode2 - Hello world](https://youtu.be/EXdRAF9Yea8).
