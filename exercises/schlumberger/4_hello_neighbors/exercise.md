# Exercise: Hello, neighbors

Extend the `domain.pddl` and `problem.pddl` files in the `begin_here` sub-folder to make the planner print plan that greets your two neighbors. Supposing your neighbors are Peter and Mary, the plan should look something like this:

```lisp
(hello peter)
(hello mary)
```

Note, the plan domain should only declare one action and the problem should declare your neighbors' names.

## PDDL constructs to exercise

* [Types](https://planning.wiki/ref/pddl/domain#object-types)
* [Objects](https://planning.wiki/ref/pddl/problem#objects)
* `:parameters` in `:action` and `:predicate`

## Hints

If you are unsure where to start, the live coding demo is in this video: [Modeling in PDDL - Episode 4 - Types and objects](https://youtu.be/zr_l_WuCoYs).
