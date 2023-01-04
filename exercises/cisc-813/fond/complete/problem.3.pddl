
(define (problem snow_3_1)
    (:domain snow3)
    (:objects home l1 l2 l3 l4)

    (:init
        (at home)
        (home home)
        (observed home)
        (road home home)

        (road home l1)
        (road l1 home)
        (road l1 l2)
        (road l2 l1)
        (road l2 l3)
        (road l3 l2)
        (road l3 l4)
        (road l4 l3)

        (= (total-cost) 0)
    )

    (:goal
        (and
            (at l4)
        )
    )

    ;un-comment the following line if metric is needed
    (:metric minimize
        (total-cost)
    )
)
