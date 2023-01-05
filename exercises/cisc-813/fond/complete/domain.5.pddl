;Header and description

(define (domain snow3)

    (:requirements :action-costs :conditional-effects :negative-preconditions :equality :adl :non-deterministic)

    (:predicates
        (at ?x)
        (road ?x ?y)
        (snow ?x ?y)
        (home ?x)
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
                (not (observed ?y ?z)))
            (increase (total-cost) 1)
        )
    )

    (:action look

        :parameters (?x ?y)

        :precondition (and
            (at ?x)
            (road ?x ?y)
            (not (observed ?x ?y))
        )

        :effect (and

            (observed ?x ?y)
            (observed ?y ?x)

            (oneof
                ; snowy
                (oneof
                    (and (snow ?x ?y) (not (snow ?y ?x)))
                    (and (snow ?y ?x) (not (snow ?x ?y)))
                )

                ; not snowy
                (and
                    (not (snow ?x ?y))
                    (not (snow ?y ?x))
                )
            )
        )

    )

)
