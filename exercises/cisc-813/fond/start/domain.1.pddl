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

            ; TODO: Must be in the right location, road must exist, and it must be snow-free

        )

        :effect (and

            ; TODO: Update the location

        )
    )
)
