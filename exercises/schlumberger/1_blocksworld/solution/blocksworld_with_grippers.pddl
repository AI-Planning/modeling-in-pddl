
;; This is the 4-action blocks world domain with explicit gripper model 
;; which does not refer to a table object and distinguishes actions
;; for moving blocks to-from blocks and moving blocks to-from table

(define (domain blocksworld)

    (:requirements :typing :fluents :negative-preconditions)

    (:types
        block gripper
        ; we do not need a `table` type as we use a special ontable predicate
        )

    (:predicates
        (on ?a ?b - block) ; block `?a` is top of block `?b`
        (clear ?a - block) ; there is nothing on top of block `?a`
        (ontable ?a - block) ; block `?a` is on table
        (holding ?a - block ?g - gripper) ; gripper `?g` is holding block `?a`
        (handempty ?g - gripper) ; gripper `?g` is not holding any block
    )

    (:action pickup ; this action is only for picking from table
        :parameters (?a - block ?g - gripper)
        :precondition (and
            (ontable ?a)
            (handempty ?g)
            (clear ?a)
        )
        :effect (and
            (holding ?a ?g)
            (not (handempty ?g))
            (not (clear ?a))
            (not (ontable ?a))
        )
    )
    (:action unstack ; only suitable for picking from block
        :parameters (?a ?b - block ?g - gripper)
        :precondition (and
            (on ?a ?b)
            (handempty ?g)
            (clear ?a)
        )
        :effect (and
            (holding ?a ?g)
            (not (handempty ?g))
            (not (clear ?a))
            (clear ?b)
            (not (on ?a ?b))
        )
    )

    (:action putdown
        :parameters (?a - block ?g - gripper)
        :precondition (and
            (holding ?a ?g)
        )
        :effect (and
            (ontable ?a)
            (not (holding ?a ?g))
            (handempty ?g)
            (clear ?a)
        )
    )

    (:action stack
        :parameters (?a ?b - block ?g - gripper)
        :precondition (and
            (holding ?a ?g)
            (clear ?b)
        )
        :effect (and
            (on ?a ?b)
            (not (holding ?a ?g))
            (handempty ?g)
            (not (clear ?b))
            (clear ?a)
        )
    )
)