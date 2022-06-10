;Hello deaf world domain
(define (domain hello-deaf-world)

(:requirements :strips :negative-preconditions :fluents)


(:functions 
    (hello_counter)
)

(:action hello-world
     :parameters ()
     :precondition ( )
     :effect (and (increase (hello_counter) 1))
)
)