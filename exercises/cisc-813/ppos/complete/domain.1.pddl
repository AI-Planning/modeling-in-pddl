
(define (domain secredoku)

    (:requirements :strips :typing)
    (:types loc num)

    (:constants
        num1 num2 num3 num4 - num
        l11 l12 l21 l22 - loc
    )

    (:predicates
        (solved ?l - loc)
        (assigned ?l - loc ?n - num)
    )

    (:action check
        :parameters (?loc - loc ?n - num)
        :observe (assigned ?loc ?n)
    )

    (:action solve
        :parameters (?loc - loc ?n - num)
        :precondition (assigned ?loc ?n)
        :effect (solved ?loc)
    )

)
