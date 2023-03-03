(define (domain shuttle1)

    (:requirements :equality :negative-preconditions :typing :adl :fluents)

    (:types
        circuit locateable - object
        shuttle person - locateable
    )

    (:constants
        c1 c2 - circuit
        s1 s2 - shuttle
    )

    (:predicates
        (going ?c - circuit)
        (at-intersection ?p - person)
        (on ?s - shuttle ?c - circuit)
        (done)
    )


    (:functions
        (at ?obj - locateable ?c - circuit)
        (speed ?s - shuttle)
    )



    ; Action to switch the ligts and reverse the circuits that are going
    (:action light-change
        :parameters (?c1 ?c2 - circuit)
        :precondition (and (going ?c1) (not (going ?c2)))
        :effect (and
            (not (going ?c1))
            (going ?c2)
        )
    )

    ; Process to move a shuttle on a circuit -- for now, it's an unbounded road!
    (:process drive
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (going ?c)
        )
        :effect (and
            (increase (at ?s ?c) (* #t (speed ?s)))
        )
    )

    (:action finish
        :parameters ()
        :precondition (and

            (>= (at s1 c1) 10)
            (>= (at s2 c2) 10)

        )
        :effect (done)
    )


)
