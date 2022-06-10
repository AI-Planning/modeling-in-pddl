(define (problem hello-colleagues-temporal)
    (:domain hello-colleagues-temporal)

    (:objects
        angela emmanuel ; mark stefan; paolo viktor  
        - colleague
    )

    ; This solution assumes the problem file is generated from the data collected by the card-reader at the door. 
    ; In real execution environment, the problem file is always auto-generated from data. 

    (:init
        ; initialize the hello counter
        (= (hello_counter) 0)
        ; set the greeting limit (must be less than or equal to the colleague_count)
        (= (hello_limit) 3)
        ; read the colleague count automatically from the card reader at the door
        (= (colleague_count) 2)
    )

    (:goal
        (and
            (= (hello_counter) (colleague_count))
        )
    )
)