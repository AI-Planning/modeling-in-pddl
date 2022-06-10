# Cup of tea for grandpa

You have a robot and grandpa. Robot can pick up a cup of tea in the kitchen and deliver it to the grandpa, who deserves it. Grandpa may be in either the kitchen or the living room. Robot can move through the doorway between the kitchen and living room.

Hint: modify the problem file to be able to develop the domain incrementally and test each new action.

For example: to unit test the _pick-up cup_ action, set the goal this way:

```lisp
(:goal
    ;(delivered cup-of-tea grandpa)
    (and
        (holding cup-of-tea)
        (not (handempty))
    )
)
```

Similarly, to test the move action, define the goal this way:

```lisp
(:goal
    ;(delivered cup-of-tea grandpa)
    (and
        (in living-room)
        (not (in kitchen))
    )
)
```

## Challenges

- What if you have two cups and two thirsty grand parents in two different rooms?
- Rooms are separated by walls. What if some rooms are not interconnected by door ways?

## Credits

Maria Fox, Derek Long, Schlumberger AI Planning course
