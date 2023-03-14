(define (domain shuttle3)

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
    )


    (:functions
        (at ?obj - locateable ?c - circuit)
        (speed ?s - shuttle)
        (circuit-length ?c - circuit)
        (loops ?c - circuit)
    )


    ; Process to move a shuttle on a circuit -- for now, it's an unbounded road!
    (:process drive
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)


            ; TODO: Should be driving and not crashed


        )
        :effect (and
            (increase (at ?s ?c) (* #t (speed ?s)))
        )
    )

    ; Action to start driving a shuttle on a circuit
    ;   Precondition: on the circuit and not already driving
    ;   Effect: driving
    (:action start-driving
        :parameters (?s - shuttle ?c - circuit)
        :precondition (); TODO
        :effect (); TODO
    )

    ; Action to stop driving a shuttle on a circuit
    ;   Precondition: on the circuit and driving
    ;   Effect: not driving
    (:action stop-driving
        :parameters (?s - shuttle ?c - circuit)
        :precondition () ; TODO
        :effect () ; TODO
    )

    ; Event for the shuttles to crash if they are both within 4 - 6 on their circuits
    ;  I.e., they are both close to the intersecting mid-point of 5.
    ;    Precondition: both shuttles are within 4 - 6, and not already crashed
    ;    Effect: crashed
    (:event crash
        :parameters ()
        :precondition () ; TODO
        :effect () ; TODO
    )

    ; Event to reset the location of the shuttle's
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

    ; Our generic goal-achieving "finish" action.
    ;  For now, let's try to crash after 3 loops on each circuit.
    (:action finish
        :parameters ()
        :precondition (and

            (crashed)
            (>= (loops c1) 3)
            (>= (loops c2) 3)

        )
        :effect (done)
    )


)
