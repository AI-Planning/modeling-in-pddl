(define (problem hello-world)
    (:domain hello-world)
    (:requirements :universal-preconditions)

    (:objects
        derek maria n3 n4 n5 n6 - neighbor
    )

    (:init
        (= (f) 0) ; initialize the dummy function
    )

    (:goal
        (and
            (forall
                (?n - neighbor)
                (said_hello_to ?n)
            )
        )
    )
)