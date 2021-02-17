#include "./input.lp".

time(1..horizon).
col(0..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')),
                                 (X,Y)=(X'-DX,Y'-DY), (X',Y')=(X+DX,Y+DY).

step_move(robot(R),D,T,0) :- plan_occurs(object(robot, R), action(move,D), T).

%transfer the step_move with the highest collision depth to move/4, trying to have one move/4 per Robot per Time
move(R,D,T,N) :- step_move(R,D,T,N), collision(R,T-1,N).

%define collision and collision depth N, increase col depth for every wait and different kind of dodge 
collision(R,T,N+1) :- wait(R,T), collision(R,T-1,N), horizon>T.
collision(R,T,N+1) :- dodge_who(R,_,T), collision(R,T-1,N), horizon>T.
collision(R,T,N+1) :- nmc_dodge(R,T), collision(R,T-1,N), horizon>T.
collision(R,T,N+1) :- frd_where(R,_,T), collision(R,T-1,N), horizon>T.
collision(R,T+1,N) :- collision(R,T,N), not collision(R,T+1,N+1), horizon>T.
collision(R,0,0) :- isRobot(R).



%COLLISION TYPE: 2 robots want to move to same field (vertex collision)
%SOLUTION: robot with highest ID needs to wait

%wait(R2,T) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1',T-1), R2>R1, nextto(C1',D1,C), position(R2,C2',T-1), nextto(C2',D2,C).


%the first flag checks for the robot's collision depth. The one with greater depth has higher priority. the second flag is a tiebreaker based on robot ID in case both have the same col depth.
%not dodge_who(R2) because wait is not allowed to take precedence over a dodge command
wait(R2,T) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1',T-1), N1>N2, nextto(C1',D1,C), position(R2,C2',T-1), nextto(C2',D2,C), not dodge_who(R2,_,T).

%the not dodge_who(R1) is to make sure they don't wait for someone who isn't coming anyway because they had to dodge rather than move
wait(R2,T) :- move(R1,D1,T,N), move(R2,D2,T,N), position(R1,C1',T-1), R2>R1, nextto(C1',D1,C), position(R2,C2',T-1), nextto(C2',D2,C), not dodge_who(R2,_,T), not dodge_who(R1,_,T).

%introduce a wait for a robot waiting for its spot to be vacated by another robot who also triggered a wait
wait(R2,T) :- move(R2,(DX,DY),T,N), position(R2,C2',T-1), nextto(C2',(DX,DY),C), position(R1,C,T-1), wait(R1,T), not move(R1,(-DX,-DY),T,_).

%wait Prototypes START
%the following line is a prototype for the case of a robot dodging and potentially being forced to wait and therefore unable to return to its spot due to lower prio because of another robot (can't currently be tested due to no benchmark for this scenario).
%currently causes odd behaviour
%wait(R1,T) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1',T-1), N1>=N2, R2>R1, nextto(C1',D1,C), position(R2,C2',T-1), nextto(C2',D2,C), dodge_who(R2,_,T-1).

%idea: robot with greater col dept waits if another robot with lower col dept wants to return to vacated spot
%wait(R1,T) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1',T-1), N1>N2, nextto(C1',D1,C), position(R2,C2',T-1), nextto(C2',D2,C), dodge_who(R2,_,T-1).


%idea: a robot with higher priority has to wait if a robot had to dodge in the direction the higher prio robot wants to go, in its path
%wait(R1,T) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1',T-1), position(R2,C2',T-1), N1>N2, nextto(C1',D1,C), nextto(C2',D2,C), dodge_who(R3,D1,T), position(R3,C,T-1), position(R3,C3',T), nextto(C,D1,C3').
%wait Prototypes END


%COLLISION TYPE: 2 robots want to swap places (edge collision)
%SOLUTION: robot with higher ID needs to vacate its spot, then return to it in the next step
%EXPECTED PROBLEMS: if robot with lower ID stops on the new field, needs to find a new path, solved via nmc_dodge

%definition of the collision type
dodge_coll(R1,R2,T) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1,T-1), R2>R1, nextto(C1,D1,C2), position(R2,C2,T-1), nextto(C2,D2,C1).

%calculate valid spots to dodge to
dodge_where(R1,D,T) :- dodge_coll(R1,R2,T), direction(D), nextto(C1,D,C1'), position(R1,C1,T-1), position(R2,C2,T-1), C1'!=C2, step_move(R2,D2,T+1,N2), D!=D2, collision(R2,T-1,N2).
dodge_where(R2,D,T) :- dodge_coll(R1,R2,T), direction(D), nextto(C2,D,C2'), position(R1,C1,T-1), position(R2,C2,T-1), C2'!=C1, step_move(R1,D2,T+1,N1), D!=D2, collision(R1,T-1,N1).

%in case the robot not dodging finishes before T+1
dodge_where(R1,D,T) :- dodge_coll(R1,R2,T), direction(D), nextto(C1,D,C1'), position(R1,C1,T-1), position(R2,C2,T-1), C1'!=C2, not step_move(R2,_,T+1,N2), collision(R2,T-1,N2).
dodge_where(R2,D,T) :- dodge_coll(R1,R2,T), direction(D), nextto(C2,D,C2'), position(R1,C1,T-1), position(R2,C2,T-1), C2'!=C1, not step_move(R1,_,T+1,N1), collision(R1,T-1,N1).

%EXPERIMENTAL, THIS DOESN'T BREAK ANYTHING BUT IT ALSO ISN'T WORKING ON THE BENCHMARK YET
%in case of collision in a 2 directional corridor (no up or down dodging possible)
%dodge_back(R1,D,T) :- dodge_coll(R1,R2,T,N1,N2), not dodge_where(R1,_,T), step_move(R2,D,T+1,N2), not dodge_where(R2,_,T).
%dodge_back(R2,D,T) :- dodge_coll(R1,R2,T,N1,N2), not dodge_where(R1,_,T), step_move(R1,D,T+1,N1), not dodge_where(R2,_,T).
%END

%if robot can't dodge
no_dodge(R1,T) :- not dodge_where(R1,_,T), dodge_coll(R1,R2,T), dodge_where(R2,_,T).
no_dodge(R2,T) :- not dodge_where(R2,_,T), dodge_coll(R1,R2,T), dodge_where(R1,_,T).
:- no_dodge(R,T), dodge_where(R,_,T).

%if found areas to dodge to are actually occupied by robot
occ_dodge(R1,T) :- dodge_where(R1,D,T), dodge_coll(R1,R2,T), position(R1,C1,T-1), position(R3,C3,T), nextto(C1,D,C3), R3!=R2, R3!=R1.
occ_dodge(R2,T) :- dodge_where(R2,D,T), dodge_coll(R1,R2,T), position(R2,C2,T-1), position(R3,C3,T), nextto(C2,D,C3), R3!=R2, R3!=R1.


%deciding who dodges, if no one dodged backwards in T-1
1{dodge_who(R1,D,T) : dodge_where(R1,D,T)}1 :- dodge_coll(R1,R2,T), N2>N1, collision(R1,T-1,N1), collision(R2,T-1,N2), not no_dodge(R1,T),not no_dodge(R2,T), not occ_dodge(R1,T).
1{dodge_who(R2,D,T) : dodge_where(R2,D,T)}1 :- dodge_coll(R1,R2,T), N1>=N2, collision(R1,T-1,N1), collision(R2,T-1,N2), not no_dodge(R1,T), not no_dodge(R2,T), not occ_dodge(R2,T).
1{dodge_who(R2,D,T) : dodge_where(R2,D,T)}1 :- dodge_coll(R1,R2,T), occ_dodge(R1,T).
1{dodge_who(R1,D,T) : dodge_where(R1,D,T)}1 :- dodge_coll(R1,R2,T), occ_dodge(R2,T).
1{dodge_who(R1,D,T) : dodge_where(R1,D,T)}1 :- dodge_coll(R1,R2,T), no_dodge(R2,T).
1{dodge_who(R2,D,T) : dodge_where(R2,D,T)}1 :- dodge_coll(R1,R2,T), no_dodge(R1,T).

%ALSO EXPERIMENTAL, SEE TWO ABOVE
%if one robot dodged backwards in T-1 and tunnel continues
%dodge_who(R1,D,T,N1) :- dodge_back(R1,D,T), dodge_back(R1,_,T-1), dodge_coll(R1,R2,T,N1,N2).
%dodge_who(R2,D,T,N2) :- dodge_back(R2,D,T), dodge_back(R2,_,T-1), dodge_coll(R1,R2,T,N1,N2).

%if robot dodged backwards in T-1 and tunnel ended
%1{dodge_who(R1,D,T,N1) : dodge_where(R1,D,T), dodge_back(R1,D,T)}1 :- dodge_back(R1,_,T-1), dodge_coll(R1,R2,T,N1,N2).
%1{dodge_who(R2,D,T,N2) : dodge_where(R2,D,T), dodge_back(R2,D,T)}1 :- dodge_back(R2,_,T-1), dodge_coll(R1,R2,T,N1,N2).
%END

%apply the dodge move to final move/3 in preparation of merge and insert a (step_)move back to the previously vacated spot from where to continue
move(R,D,T) :- dodge_who(R,D,T), collision(R,T-1,N).
step_move(R,(X1,Y1),T+1,N+1) :- dodge_who(R,(-X1,-Y1),T), collision(R,T-1,N), horizon>T.


%COLLISION TYPE: robot x finishes in path of robot y (m domain only)
%SOLUTION: letting the finished robot dodge
%FinishedRobot_dodge = fr_dodge

%define collision type

fr_dodge(R1,R2,T) :- move(R2,D2,T,N2), position(R1,C1,T-1), position(R2,C2,T-1), nextto(C2,D2,C1), not step_move(R1,_,T,_), not dodge_who(R2,_,T-1), collision(R1,T-1,N1).

fr_dodge(R2,R1,T) :- move(R1,D1,T,N1), position(R1,C1,T-1), position(R2,C2,T-1), nextto(C1,D1,C2), not step_move(R2,_,T,_), not dodge_who(R1,_,T-1), collision(R2,T-1,N2).

%NOTE: RD: Robot who dodges; RM: robot who moves normally; ND, NM their respective collision depth
%determine where to dodge to

1{frd_where(RD,D,T) : direction(D), nextto(C1,D,C1'), position(RD,C1,T-1), position(RM,C2,T-1), C1'!=C2, step_move(RM,D2,T+1,NM), D!=D2, collision(RM,T-1,NM)}1 :- fr_dodge(RD,RM,T).

%apply the dodge to move/3 for future merge, insert step_move to let previously finished robot return to its spot
move(R,D,T) :- frd_where(R,D,T), collision(R,T-1,N).
step_move(R,(X1,Y1),T+1,N+1) :- frd_where(R,(-X1,-Y1),T), collision(R,T-1,N), horizon>T.


%COLLISION TYPE: robot can't return to the spot it dodged from (m domain only)
%SOLUTION: reshuffling of 2 moves in the dodging robot
%NoMoveCollision_dodge = nmc_dodge

%define collsion type
nmc_dodge(R,T) :- dodge_who(R,_,T-1), position(R,C,T-1), move(R,D,T,N), collision(R,T-2,N-1), nextto(C,D,C'), position(R',C',T-1), not step_move(R',_,T,_).

%shifting of the moves, apply step_move that would have happened in T+1 to move in T, then apply the move that was supposed to return robot to vacated spot after

move(R,D,T) :- step_move(R,D,T+1,N), nmc_dodge(R,T), collision(R,T-1,N).
step_move(R,D,T+1,N+1):- step_move(R,D,T,N), nmc_dodge(R,T), collision(R,T-1,N).


%adjusting the plan in case of collisions(needing to include that T1 smaller horizon?)
step_move(R,D,T1+1,N+1) :- step_move(R,D,T1,N), wait(R,T), collision(R,T-1,N),(T1+1)>T, horizon>T1.
step_move(R,D,T1+2,N+1) :- step_move(R,D,T1,N), dodge_who(R,_,T), (T1+1)>T, collision(R,T-1,N), horizon>(T1-1).
step_move(R,D,T1,N+1) :- step_move(R,D,T1,N), nmc_dodge(R,T), collision(R,T-1,N), T1>(T+1), horizon>T1.


%defining move/3
move(R,D,T) :- move(R,D,T,N), not wait(R,T), not dodge_who(R,_,T), not frd_where(R,D,T), not nmc_dodge(R,T).



% - move/3 ----------------------------------------------------------------------
position(R,C,T) :- move(R,D,T), position(R,C',T-1), nextto(C',D,C), not wait(R,T).
                :- move(R,D,T), position(R,C ,T-1), not nextto(C ,D,_).

% - inertia ---------------------------------------------------------------------
position(R,C,T) :- position(R,C,T-1), not move(R,_,T), isRobot(R), time(T).

% - edge collision --------------------------------------------------------------
moveto(C',C,T) :- nextto(C',D,C), position(R,C',T-1), move(R,D,T).
:- moveto(C',C,T), moveto(C,C',T), C < C'.

% - vertex collision ------------------------------------------------------------
:- { position(R,C,T) : isRobot(R) }  > 1, position(C), time(T).

% - auxiliaries -----------------------------------------------------------------
:- { position(R,C,T) } != 1, isRobot(R), time(T).    % REDUNDANT but PERFORMANT?
