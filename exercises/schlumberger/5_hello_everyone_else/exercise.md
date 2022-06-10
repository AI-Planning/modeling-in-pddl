# Exercise: Hello, .... everyone else

Suppose you enter a busy meeting room and want to be polite to everyone, but as you are rushing in late, you only have time to greet the first _3_ different people by their name and then just greet _everyone else_.

Extend the `domain.pddl` and `problem.pddl` files in the `begin_here` sub-folder to make the planner print plan that looks like this:

```lisp
(hello angela)
(hello emmanuel)
(hello mark)
(hello-everyone-else)
```

## Challenges

- Do you think it is possible to keep the number _3_ flexible by only declaring it in the problem file?
- Does the planner always greet the same people?
- What if you declare exactly 3 people? Will the planner greet everyone else although there is none else?
- What if you only declare 2 people? What happens?
