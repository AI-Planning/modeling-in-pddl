(define (problem hello-3-times)
        (:domain hello-deaf-world)

        ; there is no need to specify any initial values
        (:init
                (= (counter) 0)
                (at 5.0
                        (not (busy)))
        )

        (:goal
                (and
                        (= (counter) 3)
                )
        )
)