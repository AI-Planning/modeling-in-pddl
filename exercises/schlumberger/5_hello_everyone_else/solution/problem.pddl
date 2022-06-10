; Schlumberger Public

(define (problem greet_three_people_and_everyone)
    (:domain _5_hello_everyone_else)

    (:objects
        Spock Uhuru Captain Scotty Zulka Jan - person
    )

    (:init
        (present Spock)
        (present Uhuru)
        (present Captain)
        (present Scotty)
        (present Zulka)
        (= (colleague_count) 5)
        (= (max_hellos) 3)
        (= (number_of_hellos) 0)
    )

    (:goal
        (>= (number_of_hellos) (colleague_count))
    )
)