# Benchmark 10
This benchmark was designed to be a very simple test for our wait condition, to see how it works in a 3-way wait collision. Since it worked out exactly like a standard 2-way collision no specific solution was necessary for this problem.

Horizon: 7

# Benchmark 11
original: tbd

mod: This modification of bench_11 was designed to test the interactions of the wait and dodge commands. Specifically, a lone robot of middling priority and a column of two robots, led by a high priority robot, drive toward each other. Robot 2 is forced to dodge for robot 1, robot 3 is then forced to wait for robot 2 to return, and lastly robot 3 dodges for robot 2. This benchmark helped identify shortcomings of our wait flag.

Horizon: 9

# Benchmark 12
This benchmark presents a simple, staggered mix of wait and dodge collisions and is a sort of prototype for a later benchmark for simultaneous 3-way collisions. Since no errors ever occured, nothing more can be said about it.

Horizon: 6

# Benchmark 13
In this benchmark we wanted to test the limitations of the wait command by introducing another condition into the mix that would require a robot to wait. Before, wait merely checked whether two different robots wanted to move to the same space at the same time, but not whether the space a robot wanted to move to was currently occupied by another waiting robot.

Horizon: 4

# Benchmark 14
Benchmark 14, as well as its two modifications mod1 and mod2 create a 3-way collision of waits and dodges. The main difference between the three scenarios is only which priority the "outsider" (that is, the robot without another robot in its way) has. Both mod1 had the lowest, mod2 the highest priority robot as outsiders, and no issues arose. The original had a middling priority robot as outsider and caused an issue that forced robot 1 to both dodge and wait at the same time, stalling the program. This was caused by the original solution to benchmark 13, as it did not factor in where the other waiting robot would have to stand in order to trigger the 'waiting for other waiting robot" condition. 

Horizon: 8


