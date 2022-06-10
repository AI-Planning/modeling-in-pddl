;Hello world domain

(define (domain hello-world)

    ; TODO: the :typing requirement will be needed
    (:requirements :strips :negative-preconditions)

    ; TODO: add the :types section and declare the `neighbor` type

    (:predicates
        ; TODO: add the `neighbor` parameter to the predicate
        (said_hello)
    )

    ; TODO: the `hello` action also needs to be parametrised
    (:action hello
        :parameters ()
        :precondition (and (not (said_hello)))
        :effect (and (said_hello))
    )

)