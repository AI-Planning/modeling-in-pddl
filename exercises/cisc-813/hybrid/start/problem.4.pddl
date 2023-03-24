(define (problem shuttle_4_1)

    (:domain shuttle4)

    (:init
        (on s1 c1)
        (= (at s1 c1) 0)
        (= (speed s1) 1)
        (= (circuit-length c1) 10)

        (on s2 c2)
        (= (at s2 c2) 0)
        (= (speed s2) 0.6)
        (= (circuit-length c2) 10)

        (= (loops c1) 0)
        (= (loops c2) 0)

        ; New countdown functions
        (= (light-countdown) 10)
        (= (light-duration) 10)

        (going c1)
    )

    (:goal (done))

)
