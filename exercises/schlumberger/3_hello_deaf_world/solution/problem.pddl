(define (problem hello-3-times) 
(:domain hello-deaf-world)

(:init
        ; if this was undefined, some planners would not assumed `0`
        (= (hello_counter) 0)
)

(:goal 
        (= (hello_counter) 3)
)
)