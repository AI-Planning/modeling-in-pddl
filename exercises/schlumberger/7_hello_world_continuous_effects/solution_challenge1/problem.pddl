; Hello world with continuous effects

(define (problem hello) (:domain hello_world)
(:objects 
    world universe - person
)

(:init
    (close-to nowhere)
    (= (name-length world) 5)
    (= (name-length universe) 8)
    (= (lungs-capacity) 10)
    (= (air-in-lungs) 1)
)

(:goal (and
    (forall (?p - person) 
        (said-hello ?p)
    )
))

)
