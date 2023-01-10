;Header and description

(define (domain snow3)

    (:requirements :action-costs :conditional-effects :negative-preconditions :equality :adl :non-deterministic)

    (:predicates
        (at ?x)
        (road ?x ?y)
        (snow ?x ?y)
        (maybe-snow ?x ?y)
        (home ?x)
        (mustsleep)
        (done)
    )

    (:functions
        (total-cost)
    )

    (:action move

        :parameters (?x ?y)

        :precondition (and

            (at ?x)
            (not (mustsleep))

            ; Can only travel if there's a road and the
            ; destination is observed to be snow free
            (road ?x ?y)
            (not (maybe-snow ?x ?y))
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
            (not (mustsleep))
            (forall
                (?y ?z)
                (when
                    (road ?y ?z)
                    (and (not (snow ?y ?z)) (maybe-snow ?y ?z)))
            )
            (increase (total-cost) 1)
        )
    )

    (:action look

        :parameters (?x ?y)

        :precondition (and
            (at ?x)
            (road ?x ?y)
            (maybe-snow ?x ?y)
            (not (mustsleep))
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
            (at ?x)
            (road ?x ?y)
            (snow ?x ?y)
            (not (maybe-snow ?x ?y))
            (not (mustsleep))
        )
        :effect (and
            (not (snow ?x ?y))
            (increase (total-cost) 10)
        )
    )

    (:action done
        :parameters (?x)
        :precondition (and
            (home ?x)
            (at ?x)
            (not (mustsleep))
            (forall
                (?y ?z)
                (and
                    (not (maybe-snow ?y ?z))
                    (not (snow ?y ?z))
                )
            )
        )
        :effect (and
            (mustsleep)
            (oneof
                (done)
                (not (done)))
        )
    )
)
