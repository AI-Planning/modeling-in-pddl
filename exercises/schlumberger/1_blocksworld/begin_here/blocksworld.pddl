
;; This is the 4-action blocks world domain which does not refer to a table object and distinguishes actions for moving blocks to-from blocks and moving blocks to-from table

(define (domain blocksworld)

	(:requirements :typing :fluents :negative-preconditions)

	(:types
		block
		; we do not need a table type as we use a special ontable predicate
	)

	(:predicates
		(on ?a ?b - block) ; block `?a` is top of block `?b`
		(clear ?a - block) ; there is nothing on top of block `?a`
		(ontable ?a - block) ; block `?a` is on table
		(holding ?a - block) ; gripper is holding block `?a`
		(handempty) ; gripper is not holding any block
	)

	(:action pickup ; this action is only for picking from table
		:parameters (?a - block)
		:precondition (and
			(ontable ?a)
			(handempty)
			(clear ?a)
		)
		:effect (and
			(holding ?a)
			(not (handempty))
			(not (clear ?a))
			(not (ontable ?a))
		)
	)
	(:action unstack ; only suitable for picking from block
		:parameters (?a ?b - block)
		:precondition (and
			(on ?a ?b)
			(handempty)
			(clear ?a)
		)
		:effect (and
			(holding ?a)
			(not (handempty))
			(not (clear ?a))
			(clear ?b)
			(not (on ?a ?b))
		)
	)

	(:action putdown
		:parameters (?a - block)
		:precondition (and
			(holding ?a)
		)
		:effect (and
			(ontable ?a)
			(not (holding ?a))
			(handempty)
			(clear ?a)
		)
	)

	(:action stack
		:parameters (?a ?b - block)
		:precondition (and
			(holding ?a)
			(clear ?b)
		)
		:effect (and
			(on ?a ?b)
			(not (holding ?a))
			(handempty)
			(not (clear ?b))
			(clear ?a)
		)
	)
)