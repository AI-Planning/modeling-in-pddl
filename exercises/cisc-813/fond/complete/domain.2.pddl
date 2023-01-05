;Header and description

(define (domain snow3)

    (:requirements :conditional-effects :negative-preconditions :equality :adl :non-deterministic)

    (:predicates
        (at ?x)
        (road ?x ?y)
        (snow ?x)
        (observed ?x)
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
        )
    )

    (:action look

        :parameters (?x ?y)

        :precondition (and
            (at ?x)
            (road ?x ?y)
            (not (observed ?y))
        )

        :effect (and

            (observed ?y)

            (oneof
                (snow ?y)
                (not (snow ?y)))
        )

    )

)
