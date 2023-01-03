(define (problem shuttle-1)

    (:domain shuttle)

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

        (hub l1)

        ; People are at locations
        (at p1 l2)
        (at p2 l2)
        (at p3 l3)
        (at p4 l4)
        (at p5 l5)

        ; Shuttles are at locations
        (at s1 l1)
        (at s2 l4)

        ; Shuttles have their circuits
        (path s1 l1 l2)
        (path s1 l2 l3)
        (path s1 l3 l1)
        (path s2 l4 l5)
        (path s2 l5 l1)
        (path s2 l1 l4)

        ; Car is at a location
        (at c1 l1)

        ; Shuttles are empty

        ; People have destinations
        (destination p1 l4)
        (destination p2 l5)
        (destination p3 l1)
        (destination p4 l2)
        (destination p5 l3)
    )

    (:goal
        (and

            ; (at c1 l2)

            ; (at p1 l4)

            (forall (?per - person ?loc - location)
                (imply (destination ?per ?loc) (at ?per ?loc)))

        )
    )
)
