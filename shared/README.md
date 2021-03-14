# README
# Benchmarks

This folder contains our 4 benchmarks for the comparison tests.
in each subfolder is an instance.lp, which has the whole instance and the needed robot_x.lp, which has the instance for one robot, which is only used for plan creation.

In each of those files is the max/expected horizon (based on our merger) already included.

bench 2,3 and 16 mod1 are in the M domain only, meaning they don't feature a packing station.

bench 17 is not solvable in the M domain, because there is only one shelf for 2 robots. Because of this, it is only solvable in C-Domain and above.


# Merger

will be added latter
