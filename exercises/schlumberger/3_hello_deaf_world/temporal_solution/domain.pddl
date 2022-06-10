;Hello deaf world domain
(define (domain hello-deaf-world)

     ; add the :fluents requirement
     (:requirements :strips :negative-preconditions :fluents :durative-actions :timed-initial-literals)
     (:predicates
          (busy)
     )

     ; define hello counter 
     (:functions
          (counter)
     )

     (:durative-action hello-world
          :parameters ()
          :duration (= ?duration 3)
          :condition (and
               (at start (not (busy)))
               (over all (busy))
          )
          ; increase the hello counter
          :effect (and
               (at start (busy))
               (at end (not (busy)))
               (at end (increase (counter) 1))
          )
     )
)