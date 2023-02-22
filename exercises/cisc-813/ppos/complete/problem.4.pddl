(define (problem secredoku-2)
    (:domain secredoku)

    (:init
        (and

            ; Each location has a number
            (oneof (assigned l11 num1) (assigned l11 num2) (assigned l11 num3) (assigned l11 num4))
            (oneof (assigned l12 num1) (assigned l12 num2) (assigned l12 num3) (assigned l12 num4))
            (oneof (assigned l13 num1) (assigned l13 num2) (assigned l13 num3) (assigned l13 num4))
            (oneof (assigned l14 num1) (assigned l14 num2) (assigned l14 num3) (assigned l14 num4))
            (oneof (assigned l21 num1) (assigned l21 num2) (assigned l21 num3) (assigned l21 num4))
            (oneof (assigned l22 num1) (assigned l22 num2) (assigned l22 num3) (assigned l22 num4))
            (oneof (assigned l23 num1) (assigned l23 num2) (assigned l23 num3) (assigned l23 num4))
            (oneof (assigned l24 num1) (assigned l24 num2) (assigned l24 num3) (assigned l24 num4))
            (oneof (assigned l31 num1) (assigned l31 num2) (assigned l31 num3) (assigned l31 num4))
            (oneof (assigned l32 num1) (assigned l32 num2) (assigned l32 num3) (assigned l32 num4))
            (oneof (assigned l33 num1) (assigned l33 num2) (assigned l33 num3) (assigned l33 num4))
            (oneof (assigned l34 num1) (assigned l34 num2) (assigned l34 num3) (assigned l34 num4))
            (oneof (assigned l41 num1) (assigned l41 num2) (assigned l41 num3) (assigned l41 num4))
            (oneof (assigned l42 num1) (assigned l42 num2) (assigned l42 num3) (assigned l42 num4))
            (oneof (assigned l43 num1) (assigned l43 num2) (assigned l43 num3) (assigned l43 num4))
            (oneof (assigned l44 num1) (assigned l44 num2) (assigned l44 num3) (assigned l44 num4))

            ; Each number is in one of the four locations of a quadrant
            (oneof (assigned l11 num1) (assigned l12 num1) (assigned l21 num1) (assigned l22 num1))
            (oneof (assigned l11 num2) (assigned l12 num2) (assigned l21 num2) (assigned l22 num2))
            (oneof (assigned l11 num3) (assigned l12 num3) (assigned l21 num3) (assigned l22 num3))
            (oneof (assigned l11 num4) (assigned l12 num4) (assigned l21 num4) (assigned l22 num4))

            (oneof (assigned l31 num1) (assigned l32 num1) (assigned l41 num1) (assigned l42 num1))
            (oneof (assigned l31 num2) (assigned l32 num2) (assigned l41 num2) (assigned l42 num2))
            (oneof (assigned l31 num3) (assigned l32 num3) (assigned l41 num3) (assigned l42 num3))
            (oneof (assigned l31 num4) (assigned l32 num4) (assigned l41 num4) (assigned l42 num4))

            (oneof (assigned l13 num1) (assigned l14 num1) (assigned l23 num1) (assigned l24 num1))
            (oneof (assigned l13 num2) (assigned l14 num2) (assigned l23 num2) (assigned l24 num2))
            (oneof (assigned l13 num3) (assigned l14 num3) (assigned l23 num3) (assigned l24 num3))
            (oneof (assigned l13 num4) (assigned l14 num4) (assigned l23 num4) (assigned l24 num4))

            (oneof (assigned l33 num1) (assigned l34 num1) (assigned l43 num1) (assigned l44 num1))
            (oneof (assigned l33 num2) (assigned l34 num2) (assigned l43 num2) (assigned l44 num2))
            (oneof (assigned l33 num3) (assigned l34 num3) (assigned l43 num3) (assigned l44 num3))
            (oneof (assigned l33 num4) (assigned l34 num4) (assigned l43 num4) (assigned l44 num4))

            ; Rows
            (oneof (assigned l11 num1) (assigned l12 num1) (assigned l13 num1) (assigned l14 num1))
            (oneof (assigned l21 num1) (assigned l22 num1) (assigned l23 num1) (assigned l24 num1))
            (oneof (assigned l31 num1) (assigned l32 num1) (assigned l33 num1) (assigned l34 num1))
            (oneof (assigned l41 num1) (assigned l42 num1) (assigned l43 num1) (assigned l44 num1))

            ; Cols
            (oneof (assigned l11 num1) (assigned l21 num1) (assigned l31 num1) (assigned l41 num1))
            (oneof (assigned l12 num1) (assigned l22 num1) (assigned l32 num1) (assigned l42 num1))
            (oneof (assigned l13 num1) (assigned l23 num1) (assigned l33 num1) (assigned l43 num1))
            (oneof (assigned l14 num1) (assigned l24 num1) (assigned l34 num1) (assigned l44 num1))


            (not (solved l11)) (not (solved l21)) (not (solved l31)) (not (solved l41))
            (not (solved l12)) (not (solved l22)) (not (solved l32)) (not (solved l42))
            (not (solved l13)) (not (solved l23)) (not (solved l33)) (not (solved l43))
            (not (solved l14)) (not (solved l24)) (not (solved l34)) (not (solved l44))

            (at l11) (not (at l21)) (not (at l31)) (not (at l41))
            (not (at l12)) (not (at l22)) (not (at l32)) (not (at l42))
            (not (at l13)) (not (at l23)) (not (at l33)) (not (at l43))
            (not (at l14)) (not (at l24)) (not (at l34)) (not (at l44))

            ; Links between locations up and down, left and right
            (link l11 l12) (link l13 l14) (link l14 l13) (link l12 l11)
            (link l21 l22) (link l23 l24) (link l24 l23) (link l22 l21)
            (link l31 l32) (link l33 l34) (link l34 l33) (link l32 l31)
            (link l41 l42) (link l43 l44) (link l44 l43) (link l42 l41)
            (link l11 l21) (link l31 l41) (link l41 l31) (link l21 l11)
            (link l12 l22) (link l32 l42) (link l42 l32) (link l22 l12)
            (link l13 l23) (link l33 l43) (link l43 l33) (link l23 l13)
            (link l14 l24) (link l34 l44) (link l44 l34) (link l24 l14)

            ; Numbers from 0 to 4
            (succ num0 num1) (succ num1 num2) (succ num2 num3) (succ num3 num4)
            (succ num4 num5) (succ num5 num6) (succ num6 num7) (succ num7 num8)
            (succ num8 num9) (succ num9 num10) (succ num10 num11) (succ num11 num12)
            (succ num12 num13) (succ num13 num14) (succ num14 num15) (succ num15 num16)

            ; For each location, even means it's num2 or num4 (similar for odd)
            (or (not (even l11)) (assigned l11 num2) (assigned l11 num4))
            (or (not (assigned l11 num2)) (even l11))
            (or (not (assigned l11 num4)) (even l11))
            (or (even l11) (assigned l11 num1) (assigned l11 num3))
            (or (not (assigned l11 num1)) (not (even l11)))
            (or (not (assigned l11 num3)) (not (even l11)))

            (or (not (even l21)) (assigned l21 num2) (assigned l21 num4))
            (or (not (assigned l21 num2)) (even l21))
            (or (not (assigned l21 num4)) (even l21))
            (or (even l21) (assigned l21 num1) (assigned l21 num3))
            (or (not (assigned l21 num1)) (not (even l21)))
            (or (not (assigned l21 num3)) (not (even l21)))

            (or (not (even l31)) (assigned l31 num2) (assigned l31 num4))
            (or (not (assigned l31 num2)) (even l31))
            (or (not (assigned l31 num4)) (even l31))
            (or (even l31) (assigned l31 num1) (assigned l31 num3))
            (or (not (assigned l31 num1)) (not (even l31)))
            (or (not (assigned l31 num3)) (not (even l31)))

            (or (not (even l41)) (assigned l41 num2) (assigned l41 num4))
            (or (not (assigned l41 num2)) (even l41))
            (or (not (assigned l41 num4)) (even l41))
            (or (even l41) (assigned l41 num1) (assigned l41 num3))
            (or (not (assigned l41 num1)) (not (even l41)))
            (or (not (assigned l41 num3)) (not (even l41)))

            (or (not (even l12)) (assigned l12 num2) (assigned l12 num4))
            (or (not (assigned l12 num2)) (even l12))
            (or (not (assigned l12 num4)) (even l12))
            (or (even l12) (assigned l12 num1) (assigned l12 num3))
            (or (not (assigned l12 num1)) (not (even l12)))
            (or (not (assigned l12 num3)) (not (even l12)))

            (or (not (even l22)) (assigned l22 num2) (assigned l22 num4))
            (or (not (assigned l22 num2)) (even l22))
            (or (not (assigned l22 num4)) (even l22))
            (or (even l22) (assigned l22 num1) (assigned l22 num3))
            (or (not (assigned l22 num1)) (not (even l22)))
            (or (not (assigned l22 num3)) (not (even l22)))

            (or (not (even l32)) (assigned l32 num2) (assigned l32 num4))
            (or (not (assigned l32 num2)) (even l32))
            (or (not (assigned l32 num4)) (even l32))
            (or (even l32) (assigned l32 num1) (assigned l32 num3))
            (or (not (assigned l32 num1)) (not (even l32)))
            (or (not (assigned l32 num3)) (not (even l32)))

            (or (not (even l42)) (assigned l42 num2) (assigned l42 num4))
            (or (not (assigned l42 num2)) (even l42))
            (or (not (assigned l42 num4)) (even l42))
            (or (even l42) (assigned l42 num1) (assigned l42 num3))
            (or (not (assigned l42 num1)) (not (even l42)))
            (or (not (assigned l42 num3)) (not (even l42)))

            (or (not (even l13)) (assigned l13 num2) (assigned l13 num4))
            (or (not (assigned l13 num2)) (even l13))
            (or (not (assigned l13 num4)) (even l13))
            (or (even l13) (assigned l13 num1) (assigned l13 num3))
            (or (not (assigned l13 num1)) (not (even l13)))
            (or (not (assigned l13 num3)) (not (even l13)))

            (or (not (even l23)) (assigned l23 num2) (assigned l23 num4))
            (or (not (assigned l23 num2)) (even l23))
            (or (not (assigned l23 num4)) (even l23))
            (or (even l23) (assigned l23 num1) (assigned l23 num3))
            (or (not (assigned l23 num1)) (not (even l23)))
            (or (not (assigned l23 num3)) (not (even l23)))

            (or (not (even l33)) (assigned l33 num2) (assigned l33 num4))
            (or (not (assigned l33 num2)) (even l33))
            (or (not (assigned l33 num4)) (even l33))
            (or (even l33) (assigned l33 num1) (assigned l33 num3))
            (or (not (assigned l33 num1)) (not (even l33)))
            (or (not (assigned l33 num3)) (not (even l33)))

            (or (not (even l43)) (assigned l43 num2) (assigned l43 num4))
            (or (not (assigned l43 num2)) (even l43))
            (or (not (assigned l43 num4)) (even l43))
            (or (even l43) (assigned l43 num1) (assigned l43 num3))
            (or (not (assigned l43 num1)) (not (even l43)))
            (or (not (assigned l43 num3)) (not (even l43)))

            (or (not (even l14)) (assigned l14 num2) (assigned l14 num4))
            (or (not (assigned l14 num2)) (even l14))
            (or (not (assigned l14 num4)) (even l14))
            (or (even l14) (assigned l14 num1) (assigned l14 num3))
            (or (not (assigned l14 num1)) (not (even l14)))
            (or (not (assigned l14 num3)) (not (even l14)))

            (or (not (even l24)) (assigned l24 num2) (assigned l24 num4))
            (or (not (assigned l24 num2)) (even l24))
            (or (not (assigned l24 num4)) (even l24))
            (or (even l24) (assigned l24 num1) (assigned l24 num3))
            (or (not (assigned l24 num1)) (not (even l24)))
            (or (not (assigned l24 num3)) (not (even l24)))

            (or (not (even l34)) (assigned l34 num2) (assigned l34 num4))
            (or (not (assigned l34 num2)) (even l34))
            (or (not (assigned l34 num4)) (even l34))
            (or (even l34) (assigned l34 num1) (assigned l34 num3))
            (or (not (assigned l34 num1)) (not (even l34)))
            (or (not (assigned l34 num3)) (not (even l34)))

            (or (not (even l44)) (assigned l44 num2) (assigned l44 num4))
            (or (not (assigned l44 num2)) (even l44))
            (or (not (assigned l44 num4)) (even l44))
            (or (even l44) (assigned l44 num1) (assigned l44 num3))
            (or (not (assigned l44 num1)) (not (even l44)))
            (or (not (assigned l44 num3)) (not (even l44)))



            ; Initialize counts
            (teleport-count num0)
            (check-count num0)

            (oneof (teleport-count num0) (teleport-count num1) (teleport-count num2) (teleport-count num3) (teleport-count num4) (teleport-count num5) (teleport-count num6) (teleport-count num7) (teleport-count num8) (teleport-count num9) (teleport-count num10) (teleport-count num11) (teleport-count num12) (teleport-count num13) (teleport-count num14) (teleport-count num15) (teleport-count num16))
            (oneof (check-count num0) (check-count num1) (check-count num2) (check-count num3) (check-count num4) (check-count num5) (check-count num6) (check-count num7) (check-count num8) (check-count num9) (check-count num10) (check-count num11) (check-count num12) (check-count num13) (check-count num14) (check-count num15) (check-count num16))

            (assigned l11 num1)
            (assigned l32 num1)
            (assigned l23 num1)
            (assigned l44 num1)


        )
    )


    (:goal
        (and
            (solved l11) (solved l21) ;(solved l31) (solved l41)
            (solved l12) (solved l22) ;(solved l32) (solved l42)
            (solved l13) (solved l23) ;(solved l33) (solved l43)
            (solved l14) (solved l24) ;(solved l34) (solved l44)
        )
    )

)
