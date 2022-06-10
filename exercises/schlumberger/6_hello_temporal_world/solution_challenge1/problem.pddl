(define (problem hello-colleagues-temporal)
    (:domain hello-colleagues-temporal)

    (:objects
        angela emmanuel PARAMESHWAR mark stefan paolo viktor - colleague
    )

    (:init
        ; initialize the hello counter
        (= (hello_counter) 0)
        ; set the colleague number
        (= (hello_limit) 6)

        ; name lengths
        (= (name_length angela) 6)
        (= (name_length emmanuel) 8)
        (= (name_length PARAMESHWAR) 16) ; the colleague with the longest name will not be greeted, unless (hello_limit) is set to 7 (maximum)
        (= (name_length mark) 4)
        (= (name_length stefan) 6)
        (= (name_length paolo) 5)
        (= (name_length viktor) 6)
    )

    ; define as many `said_hello_to` goals as you have neighbors
    (:goal
        (and
            ; greeted everyone else
            (said_hello_everyone_else)
        )
    )
)