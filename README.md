# README
This will be the place where we will upload our progress for the MAPF project (further description pending)

Currently, there are 3 benchmarks in this repository. Each folder contains one "combined" instance with both robots and shelves placed, two "separate" instances, one per specific robot and intended shelf, in order to create their individual plans which are to be combined for the "combined" instance, as well as one already completed plan for each robot.

We are using the encodings available in the potassco asprilo seminar, and we are currently modifying them to specifically work for our benchmarks.

# Benchmark 1
bench_test_1 contains the most basic use case, it's not an actual benchmark for collision but rather being used to test whether or not the merging of plans works at all, and how it works exactly. Once I am done testing the basics it will be modified to also deal with a more interesting use case concerning collision detection, specifically a situation in which two robots wish to access the same square at the same time, forcing one to either wait or calculate a new route on the fly.

horizons: robot_1 - 3; robot_2 - 3, instance_1 - 3

REMINDER: THIS BENCHMARK WAS PURELY FOR TESTING WETHER OUR STRATEGY FOR MERGING PLANS WORKS, IT WAS NOT INTENDED TO BE A BENCHMARK FOR COLLISIONS. AN UPDATED 4th BENCHMARK WILL BE ADDED FOR THAT PURPOSE.

# Benchmark 2
bench_test_2 is supposed to deal with the case where two robots want to switch places, meaning in practice, one of them has to calculate a new route to their target and vacate their spot for the other. Specifically, Robot 1 is assigned to Shelf 1, and Robot 2 is assigned to Shelf 2, with Robot 1 getting higher priority, meaning Robot 2 will have to calculate a new route and vacate their square.

horizons: robot_1 - 5; robot_2 - 5; instance_2 (with predicted collision) - 5

# Benchmark 3
bench_test_3 deals with the case where simply waiting a turn, like in future Benchmark 1, is not a valid solution anymore, and recalculation of the originally assigned plan is not merely an option but actually required. Robot 1 is meant to reach its goal early and stop moving, blocking the path of Robot 2, forcing it to adapt on the fly.

horizons: robot_1 - 2; robot_2 - 4, instance_3 (with predicted collision) - at least 6

# Benchmark 4 and 5
These benchmarks are supposed to test the scenario where two robots want to access the same square at the same time. In 5 the solution will be to wait, in 4 one of the robots will have to find a new route.

horizons bench_4: robot_1 - 8, robot_2 - 8, instance_4 - 8
         bench_5: robot_1 - 4, robot_2 - 4, instance_5 - 5

# Encodings
Here our encodings can be found. Currently, we are mostly working with the action-M.lp file, action-M.lp is the unmodified version, and two WIP versions exist, trying to deal with the collision where two robots access the same spot at the same time.

# Current Developments

# Upcoming
Detailed instructions on how to run our benchmarks will be provided as soon as we are (reasonably) sure they work as we intend it. 
