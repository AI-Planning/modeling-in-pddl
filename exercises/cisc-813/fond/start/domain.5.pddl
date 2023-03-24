;Header and description

(define (domain snow3)

    (:requirements :action-costs :conditional-effects :negative-preconditions :equality :adl :non-deterministic)

    (:predicates
        (at ?x)
        (road ?x ?y)
        (snow ?x ?y)
        (home ?x)


        ; NOTE: We've now made the /road/ observable
        (observed ?x ?y)
    )

    (:functions
        (total-cost)
    )

    (:action move

        :parameters (?x ?y)

        :precondition (and

            (at ?x)

            ; Can only travel if there's a road and the
            ; destination is observed to be snow free
            (road ?x ?y)
            (observed ?x ?y)
            (not (snow ?x ?y))
        )

        :effect (and

            (not (at ?x))
            (at ?y)

            (increase (total-cost) 1)
        )
    )

    ; Sleeping at home resets the observed status of all locations
    (:action sleep
        :parameters (?x)
        :precondition (and
            (at ?x)
            (home ?x)
        )
        :effect (and
            (forall
                (?y ?z)
                (and
                    (not (observed ?y ?z))
                    (not (snow ?y ?z))
                )
            )
            (increase (total-cost) 1)
        )
    )

    (:action look

        :parameters (?x ?y)

        :precondition (and
            ; TODO: Can look at an unobserved adjacent location
        )

        :effect (and

            ; TODO: Both directions of the road are observed

            ; TODO: Either snow is detected or not
            ; TODO: If snow is detected, then one one direction has snow
            ; HINT: Use a nested oneof
        )

    )

)
