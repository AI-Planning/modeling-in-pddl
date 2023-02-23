
(define (domain music)

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
        (note-count ?p - pitch)
        (duration-count ?l - length)
    )


    (:durative-action play
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
            (at end  (increase (melody-length) (note-length ?l)))
        )
    )



)
