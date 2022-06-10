# Exercise: Hello colleagues - temporal

Extend the _hello everyone else_ to include action durations.

As a reminder, here is the example syntax of [durative actions](https://planning.wiki/ref/pddl21/domain#durative-actions):

```lisp
(:durative-action actionName
    :parameters (?t type1)
    :duration (=?duration 1)
    :condition (and
        (at start (not (predicate1)))
        (over all (predicate2))
        (at end (predicate3))
    )
    :effect (and
        (at end (predicate1))
        (at start (not (predicate2)))
        (increase (function1) (* #t (function2 ?t)))
    )
)
```

## Reminders

* Do not forget to add `:durative-actions` requirement. And if you are facing syntax error issues, you may have forgotten to rename `:precondition` keyword to `:condition`.
* Verify that you are not saying hello to several people at the same time - in other words your `hello xyz` actions are not overlapping in the plan. How do you ensure that you greet people one after the other?

## Additional challenges

* **Challenge1:** Can you use the planner to calculate the total time it takes to greet people if you knew how long does it take to pronounce their name? If you add some really long name, will the planner ever greet that person? Why not? Because it is looking for a shortest plan. Try that!
* **Challenge2:** You are supposed to greet 3 colleagues by their name. What if the meeting is poorly attended and only 2 colleagues come? Does your solution work?\
The plan should not include the `hello-everyone-else` action, if there isn't anyone else.

## Hints

If you are unsure where to start, the live coding demo is in this video: [Modeling in PDDL Episode 5 - Hello world (temporal)](https://youtu.be/4-3WnU86KG8).
