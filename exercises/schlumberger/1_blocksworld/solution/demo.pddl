;; Solution: Blocksworld problem with explicit grippers

(define (problem blocks)(:domain blocksworld)

(:objects
    red green blue yellow brown pink - block
    gripper1 gripper2 - gripper
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

    (handempty gripper1)
    (handempty gripper2)
)

(:goal (and
    (on red brown)
    (on green red)
    (holding yellow gripper1)
))

(:metric minimize (total-time))
)