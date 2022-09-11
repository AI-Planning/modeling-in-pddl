;Hello colleague 1,2,..N and everyone else domain

(define (domain ex5_hello_everyone_else)

    (:requirements :strips :typing :negative-preconditions)

    (:types
        colleague
    )

    (:predicates
        ; records that we said hello to the given colleague
        (said_hello_to ?c - colleague)
    )

    ; add something that would help you count to N

    ; this action greets one colleague by their name
    (:action hello
        :parameters (?c - colleague)
        :precondition (and (not (said_hello_to ?c)))
        :effect (and
            (said_hello_to ?c)
            ; you probably need to add something here
        )
    )

    ; add action that would greet everyone else in the room

)