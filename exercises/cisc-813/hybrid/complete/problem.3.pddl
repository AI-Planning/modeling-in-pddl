(define (problem shuttle_3_1)

    (:domain shuttle3)

    (:objects
        p1 p2 p3 p4 p5 - person
    )

    (:init
        (on s1 c1)
        (= (at s1 c1) 0)
        (= (speed s1) 2)
        (= (circuit-length c1) 10)

        (on s2 c2)
        (= (at s2 c2) 0)
        (= (speed s2) 4)
        (= (circuit-length c2) 10)

        ; (= (loops) 0)
        ; (going c1)
        ; (going c2)
    )

    (:goal (done))

)