;Hello deaf world domain
(define (domain hello-deaf-world)

(:requirements :strips :fluents)


(:functions 
    (hello_counter)
)

(:action hello-world
     :parameters ()
     :precondition (and )
     :effect (and (increase (hello_counter) 1))
)
)