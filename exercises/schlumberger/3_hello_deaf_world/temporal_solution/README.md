# Temporal solution

As the presenter got bit carried away, while recording the video, here is the final solution
which showcases a temporal solution, where the `:durative-action` needs to be _locked_
with a `busy` predicate. It also shows a simple non-self-overlapping lock first, which is not
water-tight, if the `busy` predicate could be changed by another action, or timed-initial-literal.
