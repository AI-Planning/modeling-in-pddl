; Hello world with continuous effects

(define (domain hello_world)
    (:requirements :typing :fluents :durative-actions :duration-inequalities :negative-preconditions)

    (:types
        ; we declare two types and let one _extend_ the other
        person - locatable
    )

    (:constants
        nowhere - locatable
    )

    (:predicates
        (said-hello ?p - person)
        (busy)
        (walking)
        (busy_speaking)
        (close-to ?l - locatable)
)
    (:functions
        (name-length ?p - person)
        (air-in-lungs)
        (lungs-capacity)
    )

    (:durative-action breath-in
        :parameters ()
        :duration (>= ?duration 0)
        :condition (and
            (at start (not (busy)))
            (over all (< (air-in-lungs) (lungs-capacity)))
        )
        :effect (and
            (at start (busy))
            (increase (air-in-lungs) (* #t 3.0))
            (at end (not (busy)))
        )
    )

    (:durative-action hello
        :parameters (?p - person)
        :duration (= ?duration (name-length ?p))
        :condition (and
            (at start (not (busy)))
            (at start (not (busy_speaking)))
            (over all (>= (air-in-lungs) 0))
            (over all (close-to ?p))
        )
        :effect (and
            (at start (busy))
            (at start (busy_speaking))
            (at end (said-hello ?p))
            (decrease (air-in-lungs) (* #t 1.0))
            (at end (not (busy)))
            (at end (not (busy_speaking)))
        )
    )

    (:durative-action walk
        :parameters (?from ?to - locatable)
        :duration (= ?duration 3)
        :condition (and
            (at start (and
                    (close-to ?from)
                    (not (walking))
                ))
            (over all (not (busy_speaking)))
        )
        :effect (and
            (at start (walking))
            (at start (not (close-to ?from)))
            (at end (and
                    (not (walking))
                    (close-to ?to)
                ))
        )
    )

)