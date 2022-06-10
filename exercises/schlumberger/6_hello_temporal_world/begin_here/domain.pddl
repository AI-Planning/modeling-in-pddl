;Hello colleague 1,2,..N and everyone else domain

(define (domain hello-colleagues-temporal)

; TODO: add :durative-actions
(:requirements :strips :typing :fluents :negative-preconditions)

(:types colleague)

(:predicates 
    ; records that we said hello to the given colleague
    (said_hello_to ?c - colleague) 
    ; records that we said hello everyone else
    (said_hello_everyone_else)
)

(:functions
    ; counts how many colleagues have we greeted
    (hello_counter)
    (hello_limit)
)

; TODO: convert to durative action with duration set to 5
(:action hello
     :parameters (?c - colleague)
     :precondition (and (not (said_hello_to ?c)))
     :effect (and 
            (said_hello_to ?c)
            ; increase the hello counter
            (increase (hello_counter) 1)
        )
)

; TODO: convert to durative action with duration set to 1
(:action hello-everyone-else
     :parameters ()
     :precondition (and 
        (= (hello_counter) (hello_limit))
        (not (said_hello_everyone_else))
        )
     :effect (and (said_hello_everyone_else)))

)