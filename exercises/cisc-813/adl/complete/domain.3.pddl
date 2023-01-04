(define (domain shuttle3)

    (:requirements :equality :negative-preconditions :typing :adl)

    (:types
        locateable location - object
        car person - locateable
        av mv - car
    )

    (:predicates
        (at ?obj - locateable ?loc - location)
        (in ?per - person ?car - car)
        (link ?loc1 ?loc2 - location)
        (destination ?per - person ?loc - location)

        (path ?car - av ?loc1 ?loc2 - location)
    )

    (:action step

        :parameters ()

        :precondition ()

        :effect (and

            ; Shuttle movement
            (forall (?shuttle - av ?loc1 ?loc2 - location)
                (when
                    (and
                        (at ?shuttle ?loc1)
                        (path ?shuttle ?loc1 ?loc2)
                    )

                    (and
                        (not (at ?shuttle ?loc1))
                        (at ?shuttle ?loc2)
                    )
                )
            )
        )
    )


    (:action move

        :parameters (?car - mv ?loc1 ?loc2 - location)

        :precondition (and
            (at ?car ?loc1)
            (link ?loc1 ?loc2)
        )

        :effect (and
            (not (at ?car ?loc1))
            (at ?car ?loc2)
        )
    )

    (:action getin

        :parameters (?per - person ?car - mv ?loc - location)

        :precondition (and
            (at ?car ?loc)
            (at ?per ?loc)
        )

        :effect (and
            (in ?per ?car)
            (not (at ?per ?loc))
        )
    )

    (:action getout

        :parameters (?per - person ?car - mv ?loc - location)

        :precondition (and
            (at ?car ?loc)
            (in ?per ?car)
        )

        :effect (and
            (not (in ?per ?car))
            (at ?per ?loc)
        )
    )

)
