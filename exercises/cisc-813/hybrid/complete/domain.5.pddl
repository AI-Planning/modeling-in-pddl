(define (domain shuttle5)

    (:requirements :equality :negative-preconditions :typing :adl :fluents)

    (:types
        circuit locateable - object
        shuttle person - locateable
    )

    (:constants
        c1 c2 - circuit
        s1 s2 - shuttle
        p1 p2 p3 p4 p5 - person
    )

    (:predicates
        ; The shuttle is on the circuit
        (on ?o - locateable ?c - circuit)

        ; The shuttle is driving
        (driving ?s - shuttle)

        ; The shuttles have crashed (and goal can no longer be acheived)
        (crashed)

        ; Special goal fluent
        (done)

        ; The light is green for the circuit
        (going ?c - circuit)

        ; The person is in the shuttle
        (in ?p - person ?s - shuttle)

        ; The person has been served
        (served ?p - person)
    )


    (:functions
        ; The location of the shuttle or person on the circuit
        (at ?obj - locateable)

        ; The destination of the person on the circuit
        (destination ?p - person ?c - circuit)

        ; The speed of the shuttle (static)
        (speed ?s - shuttle)

        ; The length of the circuit (static)
        (circuit-length ?c - circuit)

        ; The number of loops a shuttle has made on a circuit
        (loops ?c - circuit)

        ; The duration of the light cycle (static)
        (light-duration)

        ; The time remaining in the light cycle
        (light-countdown)

        ; The time a shuttle will still idle at a stop
        (idle-countdown ?s - shuttle)

        ; The total time a shuttle will idle at a stop (static)
        (idle-time)
    )


    ; Switch the light to the other circuit
    ;  - shuttles drive again (in case they were stopped)
    ;  - light countdown is reset
    ;  - the circuit going switches
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


    ; Process to count down the light timer
    (:process light-timer
        :parameters ()
        :precondition (>= (light-countdown) 0)
        :effect (decrease (light-countdown) #t)
    )

    ; Process to count down the idle timer for a shuttle
    (:process idle-timer
        :parameters (?s - shuttle)
        :precondition (>= (idle-countdown ?s) 0)
        :effect (decrease (idle-countdown ?s) #t)
    )


    ; Event to stop a shuttle for a red light if it's close enough
    (:event stop-for-red
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (>= (at ?s) 9)
            (<= (at ?s) 10)
            (driving ?s)
            (on ?s ?c)
            (not (going ?c))
        )
        :effect (and
            (not (driving ?s))
        )
    )

    ; Process to move a shuttle on a circuit
    (:process drive
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (driving ?s)
            (<= (idle-countdown ?s) 0)
            (not (crashed))
        )
        :effect (and
            (increase (at ?s) (* #t (speed ?s)))
        )
    )

    ; The crash event (if both are too close around the 5.0 mark)
    (:event crash
        :parameters ()
        :precondition (and
            (>= (at s1) 9)
            (<= (at s1) 11)
            (>= (at s2) 9)
            (<= (at s2) 11)
            (not (crashed))
        )
        :effect (crashed)
    )

    ; Event to reset the location of the shuttles on a circuit loop
    (:event loop
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (>= (at ?s) (circuit-length ?c))
        )
        :effect (and
            (decrease (at ?s) (circuit-length ?c))
            (increase (loops ?c) 1)
        )
    )

    ; Stop the shuttle for a certain amount of time (driven by a timer)
    (:action stop
        :parameters (?s - shuttle ?c - circuit)
        :precondition (and
            (on ?s ?c)
            (driving ?s)
            (not (crashed))
            (<= (idle-countdown ?s) 0)
        )
        :effect (and
            (increase (idle-countdown ?s) (idle-time))
        )
    )

    ; Let a pedestian board the shuttle
    (:action board
        :parameters (?s - shuttle ?c - circuit ?p - person)
        :precondition (and
            (<= (at ?p) (at ?s))
            (<= (- (at ?s) (at ?p)) 2)
            (>= (idle-countdown ?s) 1)
            (on ?p ?c)
            (on ?s ?c)
            (not (in ?p ?s))
        )
        :effect (and
            (assign (at ?p) -100)
            (in ?p ?s)
        )
    )

    ; Let a pedestrian unboard the shuttle
    (:action unboard
        :parameters (?s - shuttle ?c - circuit ?p - person)
        :precondition (and
            (on ?s ?c)
            (on ?p ?c)
            (in ?p ?s)
            (>= (idle-countdown ?s) 1)
        )
        :effect (and
            (not (in ?p ?s))
            (assign (at ?p) (at ?s))
        )
    )

    ; Mark a person as served if they're at their destination
    (:action serve
        :parameters (?p - person ?c - circuit)
        :precondition (and
            (not (served ?p))
            (on ?p ?c)
            (>= (at ?p) (destination ?p ?c))
            (<= (- (at ?p) (destination ?p ?c)) 2)
        )
        :effect (and
            (served ?p)
        )
    )

    ; Pedestrians can switch circuits at the loop mark
    (:action switch-circuit
        :parameters (?p - person ?c1 ?c2 - circuit)
        :precondition (and
            (on ?p ?c1)
            (not (on ?p ?c2))
            (<= (at ?p) 11)
            (>= (at ?p) 9)
        )
        :effect (and
            (not (on ?p ?c1))
            (on ?p ?c2)
        )
    )


    ; Special goal-achieving action
    (:action finish
        :parameters ()
        :precondition (and

            ; (not (crashed))
            ; (crashed)

            ; Everyone is within 0.1 of their destination

            ; the forall seemed to make it worse, so we move the people to constants instead of objects
            ; (forall (?p - person) (served ?p))

            ; Works to uncomment just p1 or just p5, but not both
            ; (served p1) ; works on its own
            ; (served p2)
            ; (served p3)
            ; (served p4) ; works on its own
            (served p5)

        )
        :effect (done)
    )

)
