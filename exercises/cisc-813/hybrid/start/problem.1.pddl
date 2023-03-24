(define (problem shuttle_1_1)

    (:domain shuttle1)

    (:init
        (on s1 c1)
        (= (at s1 c1) 0)
        (= (speed s1) 2)

        (on s2 c2)
        (= (at s2 c2) 0)
        (= (speed s2) 4)

        (going c1)
    )

    (:goal
        (and
            ; Note that we use a special "done" fluent so an
            ;  action preconditions can be used for the real goal.
            (done)
        )
    )
)
