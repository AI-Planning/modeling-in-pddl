(define (problem shuttle_2_1)

    (:domain shuttle2)

    (:objects
        p1 p2 p3 p4 p5 - person
        l1 l2 l3 l4 l5 - location
        s1 s2 - av
        c1 - mv
    )

    (:init
        ; Two 3-node loops with l1 being the common point
        (link l1 l2)
        (link l2 l3)
        (link l3 l1)
        (link l1 l4)
        (link l4 l5)
        (link l5 l1)

        ; People are at locations
        (at p1 l2)
        (at p2 l2)
        (at p3 l3)
        (at p4 l4)
        (at p5 l5)

        ; Car is at a location
        (at c1 l1)

        ; People have destinations
        (destination p1 l4)
        (destination p2 l5)
        (destination p3 l1)
        (destination p4 l2)
        (destination p5 l3)
    )

    (:goal
        (and

            ; Goal for a car location
            ; (at c1 l2)

            ; Goal for a person location
            ; (at p1 l4)

            ; Goal for all desired destinations
            (forall (?per - person ?loc - location)
                (imply (destination ?per ?loc) (at ?per ?loc)))

        )
    )
)
