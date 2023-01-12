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
            (observed ?y) ; NOTE: This was added as a precondition
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

            ; TODO: Can only look at an unobserved destination next to where we are

        )

        :effect (and

            ; TODO: It's observed, and either snowy or snow-free

        )

    )

)
