(define (problem v1)

    (:domain music)

    ; Our notes and durations
    (:objects
        z_eighth z_quarter z_half z_whole - length
        c csh d dsh e f fsh g gsh a ash b - pitch
    )

    (:init

        (= (note-length z_eighth) 0.5)
        (= (note-length z_quarter) 1)
        (= (note-length z_half) 2)
        (= (note-length z_whole) 4)

        (= (melody-count) 0)
        (= (melody-length) 0)

        (= (note-count c) 0)
        (= (note-count csh) 0)
        (= (note-count d) 0)
        (= (note-count dsh) 0)
        (= (note-count e) 0)
        (= (note-count f) 0)
        (= (note-count fsh) 0)
        (= (note-count g) 0)
        (= (note-count gsh) 0)
        (= (note-count a) 0)
        (= (note-count ash) 0)
        (= (note-count b) 0)

        (= (duration-count z_eighth) 0)
        (= (duration-count z_quarter) 0)
        (= (duration-count z_half) 0)
        (= (duration-count z_whole) 0)

        ; Settings for keeping things interesting
        (= (max-duration-count) 5)
        (= (max-note-count) 2)

        (not-playing)
    )

    (:goal (and

        (not-playing)

        ; Play something good!
        (<= (melody-count) 24)
        (>= (melody-count) 12)
        (>= (melody-length) 8)
        (<= (melody-length) 16)

    ))

)
