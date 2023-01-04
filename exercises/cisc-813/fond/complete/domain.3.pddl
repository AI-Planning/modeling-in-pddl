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
            (road ?x ?y)
            (observed ?y)
            (not (snow ?y))
        )

        :effect (and

            (not (at ?x))
            (at ?y)

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
