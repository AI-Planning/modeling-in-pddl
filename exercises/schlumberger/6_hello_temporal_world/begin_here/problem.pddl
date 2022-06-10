(define (problem hello-colleagues-temporal) 
(:domain hello-colleagues-temporal)

(:objects
        angela emmanuel mark stefan paolo viktor - colleague
)

(:init
        ; initialize the hello counter
        (= (hello_counter) 0)
        ; set the colleague number
        (= (hello_limit) 3)
)

; define as many `said_hello_to` goals as you have neighbors
(:goal 
        (and
                ; greeted everyone else
                (said_hello_everyone_else)
        )
)
)