# README
This will be the place where I'll upload my progress for the MAPF project (further description pending)

Currently, there are 3 benchmarks in this repository. Each folder contains one "combined" instance with both robots and shelves placed, two "separate" instances, one per specific robot and intended shelf, in order to create their individual plans which are to be combined for the "combined" instance, as well one already completed plan for each robot, with which I am currently trying to get the merging to work (WIP).
I am using the encodings which are provided in the potassco asprilo seminar (action, goal, output etc) and experimenting with modifying them to suit my needs. I'll see if I'll upload them here in the future as well if the need arises.

# Benchmark 1
bench_test_1 contains the most basic use case, it's not an actual benchmark for collision but rather being used to test whether or not the merging of plans works at all, and how it works exactly. Once I am done testing the basics it will likely be modified to also deal with a more interesting use case concerning collision detection.

# Benchmark 2
bench_test_2 is supposed to deal with the case where one of two robots has to wait at least one whole cycle for the other to pass to continue its own journey. The idea is that Robot 1 is assigned to Shelf 1, and Robot 2 is assigned to Shelf 2, with Robot 1 being planned to have higher priority than Robot 2, meaning it ought to be Robot 2 which has to wait its turn.

# Benchmark 3
bench_test_3 deals with case where simply waiting a turn is not a valid solution anymore, and recalculation of the originally assigned plan is required. Robot 1 is meant to reach its goal early and stop moving, blocking the path of Robot 2, so that Robot 2 is forced to adapt.

# Current Developments
At the moment the biggest hurdle is to actually get merging of plans to work. I'm currently looking for a way for clingo to recognize the plans as valid input. Further, assignment of robots to specific shelves needs work as well. As it stands, robots simply travel to whichever shelf they "feel like".

