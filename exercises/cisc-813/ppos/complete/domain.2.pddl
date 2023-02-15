
(define (domain secredoku)

    (:requirements :strips :typing)
    (:types loc num)

    (:constants
        num1 num2 num3 num4 - num
        l11 l12 l13 l14 l21 l22 l23 l24 l31 l32 l33 l34 l41 l42 l43 l44 - loc
        N S E W - direction
    )

    (:predicates
        (solved ?l - loc)
        (assigned ?l - loc ?n - num)
        (at ?l - loc)
        (link ?l1 ?l2 - loc ?d - direction)
        (wall ?l1 ?l2 - loc)
        (started)
    )

    (:action check
        :parameters (?loc - loc ?n - num)
        :precondition (and
            (at ?loc)
            (not (solved ?loc))
            (not (assigned ?loc ?n))
        )
        :observe (assigned ?loc ?n)
    )

    (:action move-east
        :parameters (?d - direction)
        :precondition (and
            (started)
        )
        :effect (and
            (when (at l11) (at l21))
        )
    )


    (:action solve
        :parameters (?loc - loc ?n - num)
        :precondition (assigned ?loc ?n)
        :effect (solved ?loc)
    )

)
