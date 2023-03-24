
(define (domain music-v5)

    (:requirements
        :durative-actions
        :timed-initial-literals
        :typing
        :conditional-effects
        :negative-preconditions
        :duration-inequalities
        :equality
        :fluents
    )

    (:types
        pitch
        length
        chord
    )

    (:predicates
        (not-playing)
        (not-chording)
        (note-in ?p - pitch ?c - chord)
        (current-chord ?c - chord)
        (chord-change ?from ?to - chord)
        (changing)
        (started)

        ; Tonic notes -- the first note of a chord
        (tonic ?p - pitch ?c - chord)
        (playing-tonic)
    )

    (:constants silence - chord)

    (:functions
        (note-length ?l - length)
        (melody-count)
        (melody-length)
        (max-note-count)
        (max-duration-count)
        (note-count ?p - pitch)
        (duration-count ?l - length)
        (max-chord-count)
        (chord-count)
        (max-cheats-per-chord)
        (cheats)
    )

    ; Usual play-note action
    (:durative-action play-note
        :parameters (?p - pitch ?l - length ?c - chord)
        :duration (= ?duration (note-length ?l))
        :condition (and
            (at start (not-playing))
            (at start (note-in ?p ?c))
            (over all (current-chord ?c))
            (at start (< (note-count ?p) (max-note-count)))
            (at start (< (duration-count ?l) (max-duration-count)))
        )
        :effect (and
            (at start (not (not-playing)))
            (at start (increase (melody-count) 1))
            (at start (increase (note-count ?p) 1))
            (at start (increase (duration-count ?l) 1))
            (at end (not-playing))
            (at end  (increase (melody-length) (note-length ?l)))
        )
    )

    ; Special version of the play-note action that only plays the tonic note
    (:durative-action play-tonic-note
        :parameters (?p - pitch ?l - length ?c - chord)
        :duration (= ?duration (note-length ?l))
        :condition (and
            (at start (not-playing))
            (at start (note-in ?p ?c))
            (over all (current-chord ?c))
            (at start (< (note-count ?p) (max-note-count)))
            (at start (< (duration-count ?l) (max-duration-count)))
            (at start (tonic ?p ?c))
        )
        :effect (and
            (at start (not (not-playing)))
            (at start (playing-tonic))
            (at end (not (playing-tonic)))
            (at start (increase (melody-count) 1))
            (at start (increase (note-count ?p) 1))
            (at start (increase (duration-count ?l) 1))
            (at end (not-playing))
            (at end  (increase (melody-length) (note-length ?l)))
        )
    )

    ; Third play-note action that does a cheat note
    (:durative-action play-cheat-note
        :parameters (?p - pitch ?l - length)
        :duration (= ?duration (note-length ?l))
        :condition (and
            (at start (not-playing))
            (at start (started))
            (at start (< (cheats) (max-cheats-per-chord)))
            (at start (< (note-count ?p) (max-note-count)))
            (at start (< (duration-count ?l) (max-duration-count)))
        )
        :effect (and
            (at start (not (not-playing)))
            (at start (increase (melody-count) 1))
            (at start (increase (note-count ?p) 1))
            (at start (increase (duration-count ?l) 1))
            (at end (not-playing))
            (at end  (increase (melody-length) (note-length ?l)))
            (at end (increase (cheats) 1))
        )
    )

    ; Usual play-chord action
    (:durative-action play-chord
        :parameters (?c - chord)
        :duration (= ?duration 4)
        :condition (and
            (at start (not-chording))
            (at start (< (chord-count) (max-chord-count)))
            (at start (changing))
        )
        :effect (and
            (at start (not (current-chord silence)))
            (at start (not (not-chording)))
            (at start (current-chord ?c))
            (at start (increase (chord-count) 1))
            (at start (assign (cheats) 0))
            (at end (not-chording))
            (at end (not (current-chord ?c)))
        )
    )

    ; A special progression that insists on playing the tonic note of the new chord
    (:durative-action progress
        :parameters (?from ?to - chord)
        :duration (= ?duration 0.1)
        :condition (and
            (at start (chord-change ?from ?to))
            (at start (current-chord ?from))
            (at end (current-chord ?to))
            (at end (playing-tonic))
        )
        :effect (and
            (at start (changing))
            (at start (started))
            (at end (not (changing)))
        )
    )

)
