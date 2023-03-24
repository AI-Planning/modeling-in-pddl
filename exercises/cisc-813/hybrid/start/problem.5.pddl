(define (problem shuttle_5_1)

    (:domain shuttle5)

    (:init
        (on s1 c1)
        (= (at s1) 0)
        (= (speed s1) 1)
        (= (circuit-length c1) 20)

        (on s2 c2)
        (= (at s2) 0)
        (= (speed s2) 2)
        (= (circuit-length c2) 20)

        (= (loops c1) 0)
        (= (loops c2) 0)

        (= (light-countdown) 10)
        (= (light-duration) 10)

        (going c1)

        (= (idle-countdown s1) 0)
        (= (idle-countdown s2) 0)
        (= (idle-time) 4)

        ; Random locations for each person
        (= (at p1) 3)
        (= (at p2) 7)
        (= (at p3) 7)
        (= (at p4) 9)
        (= (at p5) 1)

        (on p1 c1)
        (on p2 c2)
        (on p3 c1)
        (on p4 c2)
        (on p5 c2)

        ; Destinations for each person on the other circuit
        (= (destination p1 c2) 7)
        (= (destination p2 c1) 2)
        (= (destination p3 c2) 3)
        (= (destination p4 c1) 13)
        (= (destination p5 c1) 2)

    )

    (:goal (done))

)
