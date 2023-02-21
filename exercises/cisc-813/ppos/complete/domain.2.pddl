
(define (domain secredoku)

    (:requirements :strips :typing :negative-preconditions)
    (:types loc num direction)

    (:constants
        num1 num2 num3 num4 - num
        l11 l12 l13 l14 l21 l22 l23 l24 l31 l32 l33 l34 l41 l42 l43 l44 - loc
        N S E W - direction
    )

    (:predicates
        (solved ?l - loc)
        (assigned ?l - loc ?n - num)
        (at ?l - loc)
        (link ?l1 ?l2 - loc)
    )

    (:action check
        :parameters (?loc - loc ?n - num)
        :precondition (and
            (at ?loc)
            (not (solved ?loc))
        )
        :observe (assigned ?loc ?n)
    )

    (:action move
        :parameters (?l1 ?l2 - loc)
        :precondition (and
            (at ?l1)
            (link ?l1 ?l2)
        )
        :effect (and
            (at ?l2)
            (not (at ?l1))
        )
    )

    (:action teleport
        :parameters (?l1 ?l2 - loc)
        :precondition(at ?l1)
        :effect (and
            (at ?l2)
            (not (at ?l1))
        )
    )

    (:action solve
        :parameters (?loc - loc ?n - num)
        :precondition (assigned ?loc ?n)
        :effect (solved ?loc)
    )

)
