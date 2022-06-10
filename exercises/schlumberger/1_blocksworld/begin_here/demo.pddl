; Schlumberger Public

(define (problem blocks)(:domain blocksworld)

(:objects
    red green blue yellow brown pink - block
    )

(:init
    ;tower
    (ontable red) ; Block red
    (on green red) ; Block green
    (on blue green)(clear blue) ; Block blue
    ;tower
    (ontable yellow) ; Block yellow
    (on brown yellow) ; Block brown
    (on pink brown)(clear pink) ; Block pink

    (handempty)
)

(:goal (and
    (on red brown)
    (on green red)
    (holding yellow)
))
)