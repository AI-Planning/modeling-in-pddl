;Hello neighbors domain

(define (domain hello-neighbors)

; add :typing requirement and also :negative-preconditions
(:requirements :strips :typing :negative-preconditions)

(:types neighbor)

(:predicates 
     (said_hello_to ?n - neighbor) 
)

(:action hello
     :parameters (?n - neighbor)
     :precondition (and (not (said_hello_to ?n)))
     :effect (and (said_hello_to ?n)))

)