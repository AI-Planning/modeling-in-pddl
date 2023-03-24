
(define (problem snow_3_1)
    (:domain snow3)
    (:objects home l1 l2 l3 l4 l5)

    (:init

        ; Set up home
        (at home)
        (home home) ; NOTE: The first "home" is a fluent while the second "home" is the object
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

        (= (total-cost) 0) ; NOTE: Simple start to get cheaper plans
    )

    ; Goal to get to the end of the street
    (:goal
        (and
            (at l5)
        )
    )

    ; NOTE: This is how we tell the planner to minimize the total cost
    (:metric minimize
        (total-cost)
    )
)
