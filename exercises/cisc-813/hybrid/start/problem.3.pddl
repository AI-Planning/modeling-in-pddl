(define (problem shuttle_3_1)

    (:domain shuttle3)

    (:init
        (on s1 c1)
        (= (at s1 c1) 0)
        (= (speed s1) 2)
        (= (circuit-length c1) 10)

        (on s2 c2)
        (= (at s2 c2) 0)
        (= (speed s2) 4)
        (= (circuit-length c2) 10)

        (= (loops c1) 0)
        (= (loops c2) 0)

    )

    (:goal (done))

)
