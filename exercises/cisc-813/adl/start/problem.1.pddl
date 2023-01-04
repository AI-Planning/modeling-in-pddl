(define (problem shuttle_1_1)

    (:domain shuttle1)

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

        ; Car is at a location
        (at c1 l2)

    )

    (:goal
        (and

            ; Goal for a car location
            (at c1 l5)

        )
    )
)
