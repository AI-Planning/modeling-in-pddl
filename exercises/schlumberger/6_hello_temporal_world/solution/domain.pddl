;Hello colleague 1,2,..N and everyone else domain

(define (domain hello-colleagues-temporal)

    (:requirements :strips :typing :fluents :negative-preconditions :durative-actions)

    (:types
        colleague
    )

    (:predicates
        ; records that we said hello to the given colleague
        (said_hello_to ?c - colleague)
        ; records that we said hello everyone else
        (said_hello_everyone_else)
        ; for the hello actions invariant condition
        (speaking)
    )

    (:functions
        ; counts how many colleagues have we greeted
        (hello_counter)
        (hello_limit)
    )

    (:durative-action hello
        :parameters (?c - colleague)
        :duration (= ?duration 5)
        :condition (and
            (at start (not (speaking))) ; ensure you are not speaking already
            (over all (speaking)) ; ensure other actions are not intervening while you are speaking (actually there are no such actions in this domain)
            (over all (not (said_hello_to ?c)))
        )
        :effect (and
            (at end (said_hello_to ?c))
            ; increase the hello counter
            (at end (increase (hello_counter) 1))
            (at start (speaking))
            (at end (not (speaking)))
        )
    )

    (:durative-action hello-everyone-else
        :parameters ()
        :duration (= ?duration 1)
        :condition (and
            (at start (= (hello_counter) (hello_limit)))
            (at start (not (said_hello_everyone_else)))
        )
        :effect (and
            (at end (said_hello_everyone_else))
        )
    )

)