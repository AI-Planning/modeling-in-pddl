
(define (problem snow_3_1)
    (:domain snow3)
    (:objects home l1 l2 l3 l4 l5)

    (:init

        ; Set up home
        (at home)
        (home home)
        (observed home)
        (road home home)

        (road home l1)
        (road l1 home)

        (road home l2)
        (road l2 home)

        (road l1 l2)
        (road l2 l1)

        (road l1 l3)
        (road l3 l1)

        (road l2 l4)
        (road l4 l2)

        (road l3 l4)
        (road l4 l3)

        (road l3 l5)
        (road l5 l3)
        (road l4 l5)
        (road l5 l4)

        (= (total-cost) 0)
    )

    ; Goal to get to the end of the street
    (:goal
        (and
            (at l5)
        )
    )

    (:metric minimize
        (total-cost)
    )
)
