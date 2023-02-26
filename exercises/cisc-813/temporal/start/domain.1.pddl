
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
        (note-length ?l - length) ; Will map an object to a number
        (melody-count) ; Counts the number of notes in the melody
        (melody-length) ; Counts the total length of the melody
        (max-note-count) ; Maximum number of notes we can play
        (max-duration-count) ; Maximum number of times we'll see a certain note length
        (note-count ?p - pitch) ; Number of times we've seen a note
        (duration-count ?l - length) ; Number of times we've seen a duration
    )


    ; Action to play a note (pitch) for a specified duration (length)
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
        :parameters () ; TODO: note and duration
        :duration ()   ; TODO: set to be the note length (from parameter)
        :condition ()  ; TODO: See above
        :effect ()     ; TODO: See above
    )



)
