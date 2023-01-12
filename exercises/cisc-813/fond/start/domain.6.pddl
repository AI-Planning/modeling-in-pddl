;Header and description

(define (domain snow3)

    (:requirements :action-costs :conditional-effects :negative-preconditions :equality :adl :non-deterministic)

    (:predicates
        (at ?x)
        (road ?x ?y)
        (snow ?x ?y)
        (maybe-snow ?x ?y) ; NOTE: Shifted to a "maybe-snow" instead of "observed" predicate
        (home ?x)


        ; NOTE: Two new fluents
        (mustsleep) ; TODO: make sure this is false for every action except sleep
        (done) ; NOTE: This is the new goal
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

            ; TODO: shouldn't be snow (and shouldn't maybe be snow)
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

            ; TODO: No longer need to sleep

            ; TODO: Every road has it's snow and maybe-snow status reset

            (increase (total-cost) 1)
        )
    )

    (:action look

        :parameters (?x ?y)

        :precondition (and

            ; TODO: Can only look at adjacent locations when there may be snow

        )

        :effect (and

            (not (maybe-snow ?x ?y))
            (not (maybe-snow ?y ?x))

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

    (:action plow
        :parameters (?x ?y)
        :precondition (and
            ; TODO: Can plow the road to an adjacent location if there's certainly snow
        )
        :effect (and
            ; TODO: Road is now snow free
            (increase (total-cost) 10)
        )
    )

    (:action done
        :parameters (?x)
        :precondition (and
            ; TODO: Can only be done if at home and all roads are known to be snow free.
        )
        :effect (and
            ; TODO: Been a long day. Now you must sleep and you're possibly done (or not ;)).
        )
    )
)
