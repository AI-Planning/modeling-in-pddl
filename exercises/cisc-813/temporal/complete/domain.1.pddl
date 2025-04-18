
(define (domain music-v1)

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
    )

    (:predicates
        (not-playing)
    )

    (:functions
        (note-length ?l - length)
        (melody-count)
        (melody-length)
        (max-note-count)
        (max-duration-count)
        (note-count ?p - pitch) ; Number of times we've seen a note
        (duration-count ?l - length) ; Number of times we've seen a duration
    )


    ; Action to play a note for a specified duration
    ;   Conditions:
    ;       - Not currently playing a note
    ;       - We haven't played this note too many times
    ;       - We haven't played this duration too many times
    ;   Effects:
    ;       - Start playing the note
    ;       - Increase the melody count
    ;       - Increase the note count
    ;       - Increase the duration count
    ;       - End playing the note
    ;       - Increase the total melody length
    (:durative-action play-note
        :parameters (?p - pitch ?l - length)
        :duration (= ?duration (note-length ?l))
        :condition (and
            (at start (not-playing))
            (at start (< (note-count ?p) (max-note-count)))
            (at start (< (duration-count ?l) (max-duration-count)))
        )
        :effect (and
            (at start (not (not-playing)))
            (at start (increase (melody-count) 1))
            (at start (increase (note-count ?p) 1))
            (at start (increase (duration-count ?l) 1))
            (at end (not-playing))
            (at start  (increase (melody-length) (note-length ?l)))
        )
    )



)
