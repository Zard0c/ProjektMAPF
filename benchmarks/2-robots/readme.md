# Benchmark 1
This benchmark exists merely for testing purposes, in the sense that we use it to test whether current changes to our code negatively affect a benchmark that should run perfectly fine without any changes needed. In essence, it's here for us to see whether we broke something fundamental.

lowest possible horizons (lph): As there exists no collision in this file, there is only one minimal horizon, namely 3.

# Benchmark 2
This second file deals with the problem of two neighbouring robots colliding due to wanting to switch their positions, also known as edge collision.

Our solution to this problem is to let a lower priority robot dodge in a direction perpendicular to its intended path to let the higher priority robot continue its move, then move back to the position it vacated and resume its own.
EDIT: redo this part, somewhat inaccurate description.
lph: 5 originially for each robot, 7 in the merged plan.

# Benchmark 3
The third of our benchmarks concerns itself with the issue of one robot stopping for good in the path of another robot, having finished working through its instructions.

In order to solve this problem, we simply let the finished robot dodge out of the way rather than have the moving robot calculate a path around the obstacle. In the following step, the dodging robot returns to its final position, while the moving robot continues on to its destination.

lph: 2 and 4 for the robots, respectively, 4 in the merged plan.

# Benchmark 4 
Here we encounter a two-step problem. First, the robots trigger a vertex collision, after whose solution leads directly to the second part, namely an edge collision.

The vertex collision is solved by simply making the lower priority robot wait a step. The following edge collision is then solved by making the robot that previously moved dodge out of the way, letting the previously waiting robot move ahead. The dodging robot them resumes its position in the following step and continues on.

lph: 8 for both robots, 10 in the merged plan.

# Benchmark 5
The last of the original benchmarks deals with yet another vertex collision.

As before, the solution is for the lower priority robot to wait a turn, then continue onwards.

lph: 4 for both robots, 5 in the merged plan.

# Benchmarks 6 to 8
All relevant information on these imported benchmarks can be found on the respective githubs of their owners 

6  : https://github.com/tzschmidt/PlanMerger 

7,8: https://github.com/tramadan-up/asprilo-project

# Benchmark 9
This is a smaller version of benchmark 4, which takes too long to calculate for our liking with our current code.
  
lph: 3 for both robots, 5 in the merged plan.
