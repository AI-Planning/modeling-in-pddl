(define (domain shuttle5)

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
        (at-intersection ?p - person)
        (on ?o - locateable ?c - circuit)
        (driving ?s - shuttle)
        (crashed)
        (done)
        (going ?c - circuit)
        (in ?p - person ?s - shuttle)
        (served ?p - person)
    )


    (:functions
        (at ?obj - locateable ?c - circuit)
        (destination ?p - person ?c - circuit)
        (speed ?s - shuttle)
        (circuit-length ?c - circuit)
        (loops ?c - circuit)
        (light-duration)
        (light-countdown)
        (idle-countdown ?s - shuttle)
        (idle-time)
    )



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


    (:process light-timer
        :parameters ()
        :precondition (>= (light-countdown) 0)
        :effect (decrease (light-countdown) #t)
    )

    (:process idle-timer
        :parameters (?s - shuttle)
        :precondition (>= (idle-countdown ?s) 0)
        :effect (decrease (idle-countdown ?s) #t)
    )


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
            (<= (idle-countdown ?s) 0)
            (not (crashed))
        )
        :effect (and
            (increase (at ?s ?c) (* #t (speed ?s)))
        )
    )

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

    (:action finish
        :parameters (?p - person)
        :precondition (and

            (not (crashed))
            ; (>= (loops c1) 3)
            ; (>= (loops c2) 3)
            ; (crashed)

            ; Everyone is within 0.1 of their destination
            ; (forall (?p - person) (served ?p))
            (served ?p)

        )
        :effect (done)
    )

    ; Stop the shuttle for a certain amount of time
    (:action stop
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (driving ?s)
            (not (crashed))
        )
        :effect (and
            (assign (idle-countdown ?s) (idle-time))
        )
    )

    (:action board
        :parameters (?s - shuttle ?c - circuit ?p - person)
        :precondition (and
            (<= (at ?p ?c) (at ?s ?c))
            (<= (- (at ?s ?c) (at ?p ?c)) 1)
            (>= (idle-countdown ?s) 0.1)
            (on ?p ?c)
        )
        :effect (and
            (assign (at ?p ?c) -100)
            (in ?p ?s)
        )
    )

    (:action unboard
        :parameters (?s - shuttle ?c - circuit ?p - person)
        :precondition (and
            (in ?p ?s)
            (>= (idle-countdown ?s) 0.1)
        )
        :effect (and
            (not (in ?p ?s))
            (assign (at ?p ?c) (at ?s ?c))
        )
    )

    (:action serve
        :parameters (?p - person ?c - circuit)
        :precondition (and
            (not (served ?p))
            (>= (at ?p ?c) (destination ?p ?c))
            (<= (- (at ?p ?c) (destination ?p ?c)) 0.1)
        )
        :effect (and
            (served ?p)
        )
    )

    (:action switch-circuit
        :parameters (?p - person ?c1 ?c2 - circuit)
        :precondition (and
            (on ?p ?c1)
            (not (on ?p ?c2))
            (<= (at ?p ?c1) 5.1)
            (>= (at ?p ?c1) 4.9)
        )
        :effect (and
            (not (on ?p ?c1))
            (on ?p ?c2)
            (assign (at ?p ?c2) (at ?p ?c1))
            (assign (at ?p ?c1) -100)
        )
    )



)
