
(define (domain music-v3)

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
    )

    ; Ssshhhhh!
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
    )


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

    ; Play a chord, but only if we're currently changing chords.
    (:durative-action play-chord
        :parameters (?c - chord)
        :duration (= ?duration 4)
        :condition (and
            (at start (not-chording))
            (at start (< (chord-count) (max-chord-count)))



            ; NOTE: Check out this new condition!!
            (at start (changing))



        )
        :effect (and
            (at start (not (current-chord silence)))
            (at start (not (not-chording)))
            (at start (current-chord ?c))
            (at start (increase (chord-count) 1))
            (at end (not-chording))
            (at end (not (current-chord ?c)))
        )
    )

    ; Progress from one chord to another (short duration to envelope the chords)
    ;   Condition: currently playing the ?from chord (and end up playing the ?to chord) and able to change to the ?to chord.
    ;   Effect: start changing chords, and end changing chords.
    (:durative-action progress
        :parameters (?from ?to - chord)
        :duration (= ?duration 0.1) ; Super small duration to envelope two chords
        :condition ()  ; TODO: See above
        :effect ()  ; TODO: See above
    )

)
