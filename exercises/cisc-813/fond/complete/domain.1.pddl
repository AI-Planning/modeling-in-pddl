;Header and description

(define (domain snow3)

    (:requirements :conditional-effects :negative-preconditions :equality :adl :non-deterministic)

    (:predicates
        (at ?x)
        (road ?x ?y)
        (snow ?x)
    )

    (:action move

        :parameters (?x ?y)

        :precondition (and

            (at ?x)

            ; Can only travel if there's a road and the
            ; destination is observed to be snow free
            (road ?x ?y)
            (not (snow ?y))
        )

        :effect (and
            (not (at ?x))
            (at ?y)
        )
    )
)
