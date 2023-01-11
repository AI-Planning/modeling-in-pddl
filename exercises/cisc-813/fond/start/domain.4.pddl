;Header and description

(define (domain snow3)

    (:requirements :action-costs :conditional-effects :negative-preconditions :equality :adl :non-deterministic)

    (:predicates
        (at ?x)
        (road ?x ?y)
        (snow ?x)
        (home ?x)
        (observed ?x)
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
            (observed ?y)
            (not (snow ?y))
        )

        :effect (and

            (not (at ?x))
            (at ?y)

            ; Observe snow status on all connected locations
            (forall
                (?z)
                (when
                    (and
                        (road ?y ?z)
                        (not (observed ?z)))
                    (and
                        (observed ?z)
                        (oneof
                            (snow ?z)
                            (not (snow ?z))))
                )
            )

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
                (?y)
                (when
                    (not (home ?y)) (not (observed ?y))))
            (increase (total-cost) 100)
        )
    )

)
