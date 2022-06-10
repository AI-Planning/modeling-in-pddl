; deliver cup to a person in a room
(define (domain cup-delivery)
    (:requirements :typing)

    (:types
        cup person room
    )

    (:predicates
        (ontable ?c - cup ?r - room)
        (in ?r - room)
        (handempty)
        (holding ?c - cup)
        (inperson ?p - person ?r - room)
        (delivered ?c - cup ?p - person)
    )

    (:action pick-up
        :parameters ()
        :precondition (and)
        :effect (and)
    )

    ; TODO move action

    ; TODO deliver cup action

)