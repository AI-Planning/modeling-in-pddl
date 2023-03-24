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
        ; (going ?c - circuit)
        ; (at-intersection ?p - person)
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
        (light-duration)
        (light-countdown)
    )


    ; Light change event when the timer counts down
    (:event light-change
        :parameters (?c1 ?c2 - circuit)
        :precondition (and
            (<= (light-countdown) 0)
            (going ?c1)
            (not (going ?c2))
        )
        :effect (and
            (increase (light-countdown) (light-duration))
            (driving s1)
            (driving s2)
            (not (going ?c1))
            (going ?c2)
        )
    )

    ; Timer process for the street light
    (:process light-timer
        :parameters ()
        :precondition (>= (light-countdown) 0)
        :effect (decrease (light-countdown) #t)
    )

    ; Event that stops a car when it gets close to the intersection and
    ;  the circuit doesn't have the rightaway.
    (:event stop-for-red
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (>= (at ?s ?c) 4)
            (<= (at ?s ?c) 5)
            (driving ?s)
            (not (going ?c))
        )
        :effect (and
            (not (driving ?s))
        )
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
