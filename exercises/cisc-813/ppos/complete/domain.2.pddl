
(define (domain secredoku)

    (:requirements :strips :typing :negative-preconditions)
    (:types loc num direction)

    (:constants
        num1 num2 num3 num4 - num
        l11 l12 l13 l14 l21 l22 l23 l24 l31 l32 l33 l34 l41 l42 l43 l44 - loc
    )

    (:predicates
        (solved ?l - loc)
        (assigned ?l - loc ?n - num)
        (at ?l - loc)
        (link ?l1 ?l2 - loc)
    )

    ; Check sensor to see if a location is assigned a number
    ;  Can only be done if at the location and not already solved.
    (:action check
        :parameters (?loc - loc ?n - num)
        :precondition (and
            (at ?loc)
            (not (solved ?loc))
        )
        :observe (assigned ?loc ?n)
    )

    ; Typical move action (can move on a link if at the source)
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

    ; Teleport instantly from one location to another (no link necessary!)
    (:action teleport
        :parameters (?l1 ?l2 - loc)
        :precondition(at ?l1)
        :effect (and
            (at ?l2)
            (not (at ?l1))
        )
    )

    ; Solve a location if we know the number there
    (:action solve
        :parameters (?loc - loc ?n - num)
        :precondition (assigned ?loc ?n)
        :effect (solved ?loc)
    )

)
