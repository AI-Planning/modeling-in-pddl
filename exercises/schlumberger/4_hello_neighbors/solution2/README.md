# Improved solution

## Total ordering of actions in the plan

An improved solution to the challenge features an `f` function, which does nothing useful for the `:goal`,
but its effect is that the actions in the plan are totally ordered. Otherwise the plan does not prescribe
the order of the actions and appears to allow the greetings to happen in parallel.

## Universal `forall` quantifier in the `:goal`

The problem file also shows that a [universal quantifier](https://planning.wiki/ref/pddl/problem#forall)
to simplify the goal declaration.
