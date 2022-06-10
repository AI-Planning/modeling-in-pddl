; Hello world with continuous effects

(define (domain hello_continuous_world)

    (:requirements :typing :durative-actions :duration-inequalities :negative-preconditions :fluents)

    (:types
        person
    )

    (:predicates
        (said_hello_to ?p - person)
        (diaphrame_busy)
    )
    (:functions
        (air_in_lungs)
        (lungs_capacity)
        (name-length ?p - person)
)

    (:durative-action inhale
        :parameters ()
        :duration (>= ?duration 0)
        :condition (and
            (at start (not (diaphrame_busy)))
            (over all (< (air_in_lungs) (lungs_capacity)))
        )
        :effect (and
            (at start (diaphrame_busy))
            (increase (air_in_lungs) (* #t 2.0))
            (at end (not (diaphrame_busy)))
        )
    )

    (:durative-action say_hello
        :parameters (?p - person)
        :duration (= ?duration (name-length ?p))
        :condition (and
            (at start (and
                    (not (diaphrame_busy))
                    (not (said_hello_to ?p))
                ))
            (over all (and
                    (> (air_in_lungs) 0)
                ))
        )
        :effect (and
            (at start (diaphrame_busy))
            (decrease (air_in_lungs) (* #t 1.0))
            (at end (and
                    (said_hello_to ?p)
                    (not (diaphrame_busy))
                ))
        )
    )

)