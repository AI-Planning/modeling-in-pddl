(define (domain shuttle1)

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
        ; Circuit is going (shuttle can move)
        (going ?c - circuit)

        ; Shuttle is on a circuit
        (on ?s - shuttle ?c - circuit)

        ; Special fluent to signify we're done
        (done)
    )


    (:functions
        ; How far along a circuit a shuttle is on a circuit
        (at ?obj - locateable ?c - circuit)

        ; Speed of a shuttle (static)
        (speed ?s - shuttle)
    )



    ; Action to switch the ligts and reverse the circuits that are going
    ;   Precondition: one circuit is going, the other is not
    ;   Effect: the circuit that was going is not going, the other is going
    (:action light-change
        :parameters (?c1 ?c2 - circuit)
        :precondition () ; TODO
        :effect () ; TODO
    )

    ; Process to move a shuttle on a circuit -- for now, it's an unbounded road!
    ;   Precondition: shuttle is on circuit and circuit is going
    ;   Effect: shuttle moves along circuit based on its speed
    (:process drive
        :parameters (?s - shuttle ?c - circuit)
        :precondition () ; TODO
        :effect () ; TODO
    )

    ; Finish action that can happen only when both shuttles are beyond 10 on their circuit
    (:action finish
        :parameters ()
        :precondition (and

            ; TODO

        )
        :effect (done)
    )


)
