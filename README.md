# README
This will be the place where I'll upload my progress for the MAPF project (further description pending)

Currently, there are 3 benchmarks in this repository. Each folder contains one "combined" instance with both robots and shelves placed, two "separate" instances, one per specific robot and intended shelf, in order to create their individual plans which are to be combined for the "combined" instance, as well as one already completed plan for each robot, with which I am currently trying to get the merging to work (WIP).
I am using the encodings which are provided in the potassco asprilo seminar (action-M.lp, goal-M.lp, output.lp etc.) and experimenting with modifying them to suit my needs. I will upload the modified encodings in a future update.

# Benchmark 1
bench_test_1 contains the most basic use case, it's not an actual benchmark for collision but rather being used to test whether or not the merging of plans works at all, and how it works exactly. Once I am done testing the basics it will be modified to also deal with a more interesting use case concerning collision detection, specifically a situation in which two robots wish to access the same square at the same time, forcing one to either wait or calculate a new route on the fly.

# Benchmark 2
bench_test_2 is supposed to deal with the case where two robots want to switch places, meaning in practice, one of them has to calculate a new route to their target and vacate their spot for the other. Specifically, Robot 1 is assigned to Shelf 1, and Robot 2 is assigned to Shelf 2, with Robot 1 getting higher priority, meaning Robot 2 will have to calculate a new route and vacate their square.

# Benchmark 3
bench_test_3 deals with the case where simply waiting a turn, like in future Benchmark 1, is not a valid solution anymore, and recalculation of the originally assigned plan is not merely an option but actually required. Robot 1 is meant to reach its goal early and stop moving, blocking the path of Robot 2, forcing it to adapt on the fly.

# Current Developments
Issue 1: Get the robots to actually stop at their assigned shelves at the end of the program, rather than any shelf available. Most likely solution will be to edit the goal-M.lp file, adding an integrity constraint that disallows any solution in which Robot n is not under Shelf n (with n being an arbitrary but fixed natural number).

Issue 2: Finding out whether the merged plans are actually the two separate plans for each individual robot, now merged. Currently, in part due to Issue 1, this is not obvious.
