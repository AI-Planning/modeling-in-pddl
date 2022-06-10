;Hello world domain

(define (domain hello-world)

    ; only the 'strips' and 'negative-preconditions' requirements is needed
    (:requirements :strips :negative-preconditions :typing :fluents)

    (:types
        neighbor
    )

    (:predicates
        (said_hello_to ?n341341234 - neighbor) ; the name of the predicate here does not matter
    )

    (:functions
        (f) ; dummy function used to enforce total ordering between the hello actions in the plan
    )

    ; hello neighbor action
    (:action hello
        :parameters (?n - neighbor)
        :precondition (and
            (not (said_hello_to ?n))
            (>= (f) 0) ; this dummy condition makes the function `f` relevant
        )
        :effect (and
            (said_hello_to ?n)
            (increase (f) 1) ; this dummy effect causes the total ordering
        )
    )
)