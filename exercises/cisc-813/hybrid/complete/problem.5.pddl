(define (problem shuttle_5_1)

    (:domain shuttle5)

    (:objects
        p1 p2 - person
        ; p1 p2 p3 p4 p5 - person
    )

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

        (= (light-countdown) 10)
        (= (light-duration) 10)
        (going c1)

        (= (idle-countdown s1) 0)
        (= (idle-countdown s2) 0)
        (= (idle-time) 1)

        ; Random locations for each person
        (= (at p1 c1) 3)
        (= (at p2 c2) 7)
        ; (= (at p3 c1) 7)
        ; (= (at p4 c2) 9)
        ; (= (at p5 c2) 1)
        (on p1 c1)
        (on p2 c2)

        ; Destinations for each person on the other circuit
        (= (destination p1 c2) 7)
        (= (destination p2 c1) 2)
        ; (= (destination p3 c1) 3)
        ; (= (destination p4 c2) 8)
        ; (= (destination p5 c2) 2)
    )

    (:goal (done))

)
