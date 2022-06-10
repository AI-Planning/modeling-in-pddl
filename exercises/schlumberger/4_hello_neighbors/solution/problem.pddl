(define (problem hello-neighbors)
    (:domain hello-neighbors)

    (:objects
        peter mary - neighbor
    )

    (:init
        ; there is no need to specify any initial values
    )

    (:goal
        (and
            ; define as many `said_hello_to` goals as you have neighbors
            (said_hello_to peter)
            (said_hello_to mary)
        )
    )
)