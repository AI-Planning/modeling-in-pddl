(define (domain shuttle)

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
        (hub ?loc - location)

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

            ; People boarding
            (forall (?per - person ?loc - location ?shuttle - av)
                (when
                    (and
                        (at ?per ?loc)
                        (at ?shuttle ?loc)
                        (not (destination ?per ?loc))
                    )

                    (and
                        (not (at ?per ?loc))
                        (in ?per ?shuttle)
                    )
                )
            )

            ; People disembarking
            (forall (?per - person ?loc - location ?shuttle - av)
                (when
                    (and
                        (in ?per ?shuttle)
                        (at ?shuttle ?loc)
                        (or (destination ?per ?loc) (hub ?loc))
                    )

                    (and
                        (not (in ?per ?shuttle))
                        (at ?per ?loc)
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

            ; Safe movement
            (or
                ; No shuttles around me
                (forall (?loc3 - location)
                    (imply
                        (link ?loc3 ?loc1)
                        (forall (?car2 - av)
                            (not (at ?car2 ?loc3))
                        )
                    )
                )

                ; No shuttles around the destination
                (forall (?loc3 - location)
                    (imply
                        (link ?loc3 ?loc2)
                        (forall (?car2 - av)
                            (not (at ?car2 ?loc3))
                        )
                    )
                )
            )
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
            ; (forall (?per2 - person) (not (in ?per2 ?car)))
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
