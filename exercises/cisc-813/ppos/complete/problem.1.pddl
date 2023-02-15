(define (problem secredoku-1)
    (:domain secredoku)

    (:init
        (and

            ; Each location has a number
            (oneof
                (assigned l11 num1)
                (assigned l11 num2)
                (assigned l11 num3)
                (assigned l11 num4)
            )
            (oneof
                (assigned l12 num1)
                (assigned l12 num2)
                (assigned l12 num3)
                (assigned l12 num4)
            )
            (oneof
                (assigned l21 num1)
                (assigned l21 num2)
                (assigned l21 num3)
                (assigned l21 num4)
            )
            (oneof
                (assigned l22 num1)
                (assigned l22 num2)
                (assigned l22 num3)
                (assigned l22 num4)
            )

            ; Number is in one of the four locations
            (oneof
                (assigned l11 num1)
                (assigned l12 num1)
                (assigned l21 num1)
                (assigned l22 num1)
            )
            (oneof
                (assigned l11 num2)
                (assigned l12 num2)
                (assigned l21 num2)
                (assigned l22 num2)
            )
            (oneof
                (assigned l11 num3)
                (assigned l12 num3)
                (assigned l21 num3)
                (assigned l22 num3)
            )
            (oneof
                (assigned l11 num4)
                (assigned l12 num4)
                (assigned l21 num4)
                (assigned l22 num4)
            )

            (assigned l11 num1)

            (not (solved l11))
            (not (solved l12))
            (not (solved l21))
            (not (solved l22))

        )
    )


    (:goal
        (and
            (solved l11)
            (solved l12)
            (solved l21)
            (solved l22)
        )
    )

)
