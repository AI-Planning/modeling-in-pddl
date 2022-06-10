;Hello deaf world domain
(define (domain hello-deaf-world)

; TODO: add the :fluents requirement
(:requirements :strips :negative-preconditions)

(:predicates 
     ; TODO: is this going to be needed?
     (said_hello)
)

; TODO: define hello counter 

; single action needs to be define, so the planner can pick it
(:action hello-world
     :parameters ()
     ; TODO: modify the pre-condition
     :precondition (and (not (said_hello)))
     ; TODO: increase the hello counter
     :effect (and (said_hello))
)
)