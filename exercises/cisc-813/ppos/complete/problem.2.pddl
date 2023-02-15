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

            (started)

        )
    )


    (:goal
        (and
            (solved l11) (solved l21) (solved l31) (solved l41)
            (solved l12) (solved l22) (solved l32) (solved l42)
            (solved l13) (solved l23) (solved l33) (solved l43)
            (solved l14) (solved l24) (solved l34) (solved l44)
        )
    )

)
