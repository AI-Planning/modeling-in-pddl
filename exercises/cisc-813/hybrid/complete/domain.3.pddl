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
        ; (going ?c - circuit)
        ; (at-intersection ?p - person)
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
            (driving ?s)
            (not (crashed))
        )
        :effect (and
            (increase (at ?s ?c) (* #t (speed ?s)))
        )
    )

    ; Action to start driving a shuttle on a circuit
    (:action start-driving
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (not (driving ?s))
        )
        :effect (driving ?s)
    )

    ; Action to stop driving a shuttle on a circuit
    (:action stop-driving
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (driving ?s)
        )
        :effect (not (driving ?s))
    )

    ; Event for the shuttles to crash if they are both within 4 - 6
    (:event crash
        :parameters ()
        :precondition (and
            (>= (at s1 c1) 4)
            (<= (at s1 c1) 6)
            (>= (at s2 c2) 4)
            (<= (at s2 c2) 6)
            (not (crashed))
        )
        :effect (crashed)
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
