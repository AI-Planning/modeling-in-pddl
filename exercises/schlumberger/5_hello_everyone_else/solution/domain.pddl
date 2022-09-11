; Schlumberger Public

(define (domain ex5_hello_everyone_else)

    (:requirements :strips :typing :fluents :negative-preconditions)

    (:types
        colleague
    )

    (:predicates
        (present ?c - colleague) ; specifies that the colleague `?c` is present
        (said_hello_to ?c - colleague) ; keeps track of whether we greeted the colleague `?c`
    )
    (:functions
        (number_of_hellos) ; hello counter
        (max_hellos) ; number of people to greet by name
        (colleague_count) ; number of people in the room
    )

    (:action hello
        :parameters (?c - colleague)
        :precondition (and
            (< (number_of_hellos) (max_hellos))
            (present ?c) ; only greet them if they are present
            (not (said_hello_to ?c)))
        :effect (and
            (said_hello_to ?c)
            (increase (number_of_hellos) 1))
    )

    (:action hello-everyone-else
        :parameters ()
        :precondition (and
            (= (number_of_hellos) (max_hellos))
            (> (colleague_count) (max_hellos)))
        :effect (and
            (assign (number_of_hellos) (colleague_count)))
    )
)