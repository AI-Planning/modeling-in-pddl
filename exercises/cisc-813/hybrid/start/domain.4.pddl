(define (domain shuttle4)

    (:requirements :equality :negative-preconditions :typing :adl :fluents)

    (:types
        circuit locateable - object
        shuttle - locateable
    )

    (:constants
        c1 c2 - circuit
        s1 s2 - shuttle
    )

    (:predicates
        (on ?s - shuttle ?c - circuit)
        (driving ?s - shuttle)
        (crashed)
        (done)
        (going ?c - circuit)
    )


    (:functions
        (at ?obj - locateable ?c - circuit)
        (speed ?s - shuttle)
        (circuit-length ?c - circuit)
        (loops ?c - circuit)

        ; Two new functions for a timer!
        (light-duration)
        (light-countdown)
    )


    ; Light change event when the timer counts down
    ;   Precondition:
    ;       - The light countdown is 0 or less
    ;       - The circuit that has the rightaway is going
    ;       - The circuit that doesn't have the rightaway is not going
    ;   Effect:
    ;       - Reset the light countdown to the light duration (use 'increase')
    ;       - Set the circuit that has the rightaway to not going
    ;       - Set the circuit that doesn't have the rightaway to going
    ;       - Set both of the shuttles to driving
    (:event light-change
        :parameters (?c1 ?c2 - circuit)
        :precondition () ; TODO
        :effect () ; TODO
    )

    ; Timer process for the street light
    ;   Precondition: Light countdown is greater than or equal to 0
    ;   Effect: Decrease the light countdown by #t
    (:process light-timer
        :parameters ()
        :precondition () ; TODO
        :effect () ; TODO
    )

    ; Event that stops a car when it gets close to the intersection and
    ;  the circuit doesn't have the rightaway.
    ;      Precondition:
    ;          - The shuttle is on the circuit that doesn't have the rightaway (i.e., circuit is not going)
    ;          - The shuttle is between 4 and 5 (so, close)
    ;          - The shuttle is driving
    ;      Effect:
    ;          - The shuttle is no longer driving
    (:event stop-for-red
        :parameters (?s - shuttle ?c - circuit)
        :precondition () ; TODO
        :effect () ; TODO
    )



    ; Process to move a shuttle on a circuit -- for now, it's an unbounded road!
    (:process drive
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (driving ?s)
            (not (crashed))
        )
        :effect (and
            (increase (at ?s ?c) (* #t (speed ?s)))
        )
    )

    ; Shuttles crash if they are too close
    (:event crash
        :parameters ()
        :precondition (and
            (>= (at s1 c1) 4.5)
            (<= (at s1 c1) 5.5)
            (>= (at s2 c2) 4.5)
            (<= (at s2 c2) 5.5)
            (not (crashed))
        )
        :effect (crashed)
    )

    ; Event to reset the location of the shuttles
    (:event loop
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (>= (at ?s ?c) (circuit-length ?c))
        )
        :effect (and
            (decrease (at ?s ?c) (circuit-length ?c))
            (increase (loops ?c) 1)
        )
    )

    ; Goal-achieving action that makes sure 3 loops happen on each circuit without crashing
    (:action finish
        :parameters ()
        :precondition (and

            (not (crashed))
            (>= (loops c1) 3)
            (>= (loops c2) 3)
            ; (crashed)

        )
        :effect (done)
    )


)
