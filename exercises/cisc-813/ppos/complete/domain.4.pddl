
(define (domain secredoku)

    (:requirements :strips :typing :negative-preconditions)
    (:types loc num direction)

    (:constants
        num0 num1 num2 num3 num4 num5 num6 num7 num8 num9 num10 num11 num12 num13 num14 num15 num16 - num
        l11 l12 l13 l14 l21 l22 l23 l24 l31 l32 l33 l34 l41 l42 l43 l44 - loc
    )

    (:predicates
        (solved ?l - loc)
        (assigned ?l - loc ?n - num)
        (at ?l - loc)
        (link ?l1 ?l2 - loc)
        (check-count ?n)
        (teleport-count ?n)
        (succ ?n1 ?n2 - num)
        (can-check ?l - loc)
        (even ?l - loc)
    )


    (:action check
        :parameters (?loc - loc ?n - num)
        :precondition (and
            (at ?loc)
            (not (solved ?loc))
            (can-check ?loc)
        )
        :observe (assigned ?loc ?n)
    )_

    (:action setup-check
        :parameters (?loc - loc ?n1 ?n2 - num)
        :precondition (and
            (at ?loc)
            (not (can-check ?loc))
            (succ ?n1 ?n2)
            (check-count ?n1)
            (not (check-count num5)) ; try 5 down to 2 observing when it breaks
        )
        :effect (and
            (check-count ?n2)
            (not (check-count ?n1))
            (can-check ?loc)
        )
    )

    (:action evenodd
        :parameters (?loc - loc)
        :precondition (at ?loc)
        :observe (even ?loc)
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
        :parameters (?l1 ?l2 - loc ?n1 ?n2 - num)
        :precondition (and
            (at ?l1)
            (succ ?n1 ?n2)
            (teleport-count ?n1)
            (not (teleport-count num1))
        )
        :effect (and
            (at ?l2)
            (not (at ?l1))
            (not (teleport-count ?n1))
            (teleport-count ?n2)
        )
    )

    (:action solve
        :parameters (?loc - loc ?n - num)
        :precondition (assigned ?loc ?n)
        :effect (solved ?loc)
    )

)
