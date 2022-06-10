; deliver cup of tea to granpa
(define (problem cup-of-tea-for-grandpa-in-livingroom)
	(:domain cup-delivery)
	(:objects
		cup-of-tea - cup
		grandpa - person
		kitchen - room
		living-room - room
	)
	(:init
		(ontable cup-of-tea kitchen)
		(handempty)
		(in kitchen)
		(inperson grandpa living-room)
	)

	(:goal
		(delivered cup-of-tea grandpa)
	)
)