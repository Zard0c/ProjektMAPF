# WIP 
This is a folder of the latest merger attempt. 
The idea is simply to define a collision flag, which in turn gets reduced to a wait flag for whatever robot "triggered" the collision (for two bots that'll be the one who has the higher ID). With that wait flag we create an integrity constraint which is supposed to force a robot that triggered a wait flag to hold its position. Further, we create a new move order that is supposed to shift the movements of any robot that had to wait by one time step.
Current issues: The program ignores the wait command entirely, resulting in incorrect steps and robots ignoring the vertex collision.

