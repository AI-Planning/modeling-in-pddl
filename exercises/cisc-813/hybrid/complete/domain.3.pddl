(define (domain shuttle3)

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
    )



    ; Action to switch the ligts and reverse the circuits that are going
    ; (:action light-change
    ;     :parameters (?c1 ?c2 - circuit)
    ;     :precondition (and (going ?c1) (not (going ?c2)))
    ;     :effect (and
    ;         (not (going ?c1))
    ;         (going ?c2)
    ;     )
    ; )

    ; Process to move a shuttle on a circuit -- for now, it's an unbounded road!
    (:process drive
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (driving ?c)
        )
        :effect (and
            ; (increase (at ?s ?c) (* #t (speed ?s)))
            (increase (at ?s ?c) #t)
        )
    )

    (:action start-driving
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (not (driving ?s))
        )
        :effect (driving ?s)
    )

    (:action stop-driving
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (driving ?s)
        )
        :effect (not (driving ?s))
    )

    ; (:event crash
    ;     :parameters (?s1 ?s2 - shuttle ?c1 ?c2 - circuit)
    ;     :precondition (and
    ;         (on ?s1 ?c1)
    ;         (on ?s2 ?c2)
    ;         (not (= ?s1 ?s2))
    ;         (>= (at ?s1 ?c1) 0.5)
    ;         (<= (at ?s1 ?c1) 1.5)
    ;         (>= (at ?s2 ?c2) 0.5)
    ;         (<= (at ?s2 ?c2) 1.5)
    ;     )
    ;     :effect (crashed)
    ; )




    ; Event to reset the location of the shuttle's
    ; (:event loop
    ;     :parameters (?s - shuttle ?c - circuit)
    ;     :precondition (and
    ;         (>= (at ?s ?c) (circuit-length ?c))
    ;     )
    ;     :effect (and
    ;         (decrease (at ?s ?c) (circuit-length ?c))
    ;         ; (increase (loops) 1)
    ;     )
    ; )


    (:action finish
        :parameters (?s1 ?s2 - shuttle ?c1 ?c2 - circuit)
        :precondition (and

            ; (>= (at s2 c2) 10)
            ; (>= (loops) 10)
            ; (crashed)

            (driving ?s1)
            (driving ?s2)

            (not (= ?s1 ?s2))
            (on ?s1 ?c1)
            (on ?s2 ?c2)

            (>= (at ?s2 ?c2) 5)
            ; (>= (at ?s2 ?c2) 5)

            ; (<= (at ?s2 ?c2) 1.5)
            ; (>= (at ?s1 ?c1) 0.5)
            ; (<= (at ?s1 ?c1) 1.5)

        )
        :effect (done)
    )


)
