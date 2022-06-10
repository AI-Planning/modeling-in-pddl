; Hello world with continuous effects

(define (problem hello)
    (:domain hello_continuous_world)

    (:objects
        world universe - person
    )

    (:init
        (= (name-length world) 5)
        (= (name-length universe) 8)

        (= (air_in_lungs) 1)
        (= (lungs_capacity) 10)
    )

    (:goal
        (and
            (said_hello_to world)
            (said_hello_to universe)
        )
    )
)