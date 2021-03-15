#include "./input.lp".

time(1..horizon).
col(0..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')),
                                 (X,Y)=(X'-DX,Y'-DY), (X',Y')=(X+DX,Y+DY).

step_move(robot(R),D,T,0) :- plan_occurs(object(robot, R), action(move,D), T).
step_pickup(robot(R),shelf(S),T,0) :- plan_occurs(object(robot, R), action(pickup,object(shelf,S)), T).
step_putdown(robot(R),shelf(S),T,0) :- plan_occurs(object(robot, R), action(putdown,object(shelf,S)), T).

%transfer the step_move with the highest collision depth to move/4, trying to have one move/4 per Robot per Time
move(R,D,T,N) :- step_move(R,D,T,N), collision(R,T-1,N).

%define collision and collision depth N, increase col depth for every wait and different kind of dodge 
collision(R,T,N+1) :- wait(R,T), collision(R,T-1,N), horizon>T.
collision(R,T,N+1) :- dodge_who(R,_,T), collision(R,T-1,N), horizon>T.
collision(R,T,N+1) :- s_coll(R,T), collision(R,T-1,N), horizon>T.
collision(R,T+1,N) :- collision(R,T,N), not collision(R,T+1,N+1), horizon>T.
collision(R,0,0) :- isRobot(R).



%COLLISION TYPE: 2 robots want to move to same field (vertex collision)
%SOLUTION: robot with highest ID needs to wait

wait(R1,T) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1',T-1), N2>N1, R2>R1, nextto(C1',D1,C), position(R2,C2',T-1), nextto(C2',D2,C), not wait(R2,T).

wait(R2,T) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1',T-1), N1>=N2, R2>R1, nextto(C1',D1,C), position(R2,C2',T-1), nextto(C2',D2,C), not wait(R1,T).

wait(R2,T) :- move(R2,D,T,N1), pickup(R1,_,T), position(R1,C1,T-1), position(R2,C2,T-1), nextto(C2,D,C1).

wait(R2,T) :- move(R2,D,T,N1), putdown(R1,_,T), position(R1,C1,T-1), position(R2,C2,T-1), nextto(C2,D,C1).


%COLLISION TYPE: 2 robots want to swap places (edge collision)


%definition of the collision type
dodge_coll(R1,R2,T) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1,T-1), R2>R1, nextto(C1,D1,C2), position(R2,C2,T-1), nextto(C2,D2,C1).

%calculate valid spots to dodge to
dodge_where(R1,D,T) :- dodge_coll(R1,R2,T), direction(D), nextto(C1,D,C1'), position(R1,C1,T-1), position(R2,C2,T-1), C1'!=C2, step_move(R2,D2,T+1,N2), D!=D2, collision(R2,T-1,N2).
dodge_where(R2,D,T) :- dodge_coll(R1,R2,T), direction(D), nextto(C2,D,C2'), position(R1,C1,T-1), position(R2,C2,T-1), C2'!=C1, step_move(R1,D2,T+1,N1), D!=D2, collision(R1,T-1,N1).

%in case the robot not dodging finishes before T+1
dodge_where(R1,D,T) :- dodge_coll(R1,R2,T), direction(D), nextto(C1,D,C1'), position(R1,C1,T-1), position(R2,C2,T-1), C1'!=C2, not step_move(R2,_,T+1,N2), collision(R2,T-1,N2).
dodge_where(R2,D,T) :- dodge_coll(R1,R2,T), direction(D), nextto(C2,D,C2'), position(R1,C1,T-1), position(R2,C2,T-1), C2'!=C1, not step_move(R1,_,T+1,N1), collision(R1,T-1,N1).

% robot can't dodge

no_dodge(R1,T) :- not dodge_where(R1,_,T), dodge_coll(R1,R2,T), dodge_where(R2,_,T).
no_dodge(R2,T) :- not dodge_where(R2,_,T), dodge_coll(R1,R2,T), dodge_where(R1,_,T).

:- no_dodge(R,T), dodge_where(R,_,T).


%deciding who dodges, if no one dodged backwards in T-1
1{dodge_who(R1,D,T) : dodge_where(R1,D,T)}1 :- dodge_coll(R1,R2,T), N2>N1, collision(R1,T-1,N1), collision(R2,T-1,N2), not no_dodge(R1,T),not no_dodge(R2,T).
1{dodge_who(R2,D,T) : dodge_where(R2,D,T)}1 :- dodge_coll(R1,R2,T), N1>=N2, collision(R1,T-1,N1), collision(R2,T-1,N2), not no_dodge(R1,T), not no_dodge(R2,T).
1{dodge_who(R1,D,T) : dodge_where(R1,D,T)}1 :- dodge_coll(R1,R2,T), no_dodge(R2,T).
1{dodge_who(R2,D,T) : dodge_where(R2,D,T)}1 :- dodge_coll(R1,R2,T), no_dodge(R1,T).

%apply the dodge move to final move/3 in preparation of merge and insert a (step_)move back to the previously vacated spot from where to continue
move(R,D,T) :- dodge_who(R,D,T), collision(R,T-1,N).
step_move(R,(X1,Y1),T+1,N+1) :- dodge_who(R,(-X1,-Y1),T), collision(R,T-1,N), horizon>T.



%adjusting the plan in case of collisions(needing to include that T1 smaller horizon?)

%case wait
step_move(R,D,T1+1,N+1) :- step_move(R,D,T1,N), wait(R,T), collision(R,T-1,N),(T1+1)>T, horizon>T1.

step_pickup(R,S,T1+1,N+1) :- step_pickup(R,S,T1,N), wait(R,T), collision(R,T-1,N),(T1+1)>T, horizon>T1.

step_putdown(R,S,T1+1,N+1) :- step_putdown(R,S,T1,N), wait(R,T), collision(R,T-1,N),(T1+1)>T, horizon>T1.

%case dodge
step_move(R,D,T1+2,N+1) :- step_move(R,D,T1,N), dodge_who(R,_,T), (T1+1)>T, collision(R,T-1,N), horizon>(T1-1).

step_pickup(R,S,T1+2,N+1) :- step_pickup(R,S,T1,N), dodge_who(R,_,T), collision(R,T-1,N),(T1+1)>T, horizon>(T1-1).

step_putdown(R,S,T1+2,N+1) :- step_putdown(R,S,T1,N), dodge_who(R,_,T), collision(R,T-1,N),(T1+1)>T, horizon>(T1-1).


%wait for shelf to come back

wait(R1,T) :- move(R1,D,T,N), step_pickup(R1,S,T+1,N), carries(_,S,T), collision(R1,T-1,N).






%shelf collision

s_coll(R,T) :- move(R,D,T,N), position(S',C',T-1), position(R,C,T-1), nextto(C,D,C'), carries(R,S,T-1), isShelf(S'), not carries(_,S',T), not nmc_dodge(R,T), collision(R,T-1,N).

s_wait(R,T) :- s_coll(R,T), step_move(R,(-X,-Y),T+1,N), move(R,(X,Y),T,N), collision(R,T-1,N).
 s_str_dodge(R,T) :- s_coll(R,T), step_move(R,(X,Y),T+1,N), move(R,(X,Y),T,N), collision(R,T-1,N).
s_corn_dodge(R,T) :- s_coll(R,T), step_move(R,D1,T+1,N), move(R,D,T,N), D1 != D, collision(R,T-1,N).

%s_wait/2 still wip, but can only happen during a dodge


%adjusting the move for the shelf collision with corn dodge

move(R,D,T) :- step_move(R,D,T+1,N), collision(R,T-1,N), s_corn_dodge(R,T).
step_move(R,D,T+1,N+1) :- move(R,D,T,N), s_corn_dodge(R,T).

step_move(R,D,T1,N+1) :- step_move(R,D,T1,N), s_corn_dodge(R,T), T1>(T+1), collision(R,T-1,N), horizon>(T1-1).


step_pickup(R,S,T1,N+1) :- step_pickup(R,S,T1,N), s_corn_dodge(R,T), collision(R,T-1,N),T1>(T+1), horizon>(T1-1).

step_putdown(R,S,T1,N+1) :- step_putdown(R,S,T1,N), s_corn_dodge(R,T), collision(R,T-1,N),T1>(T+1), horizon>(T1-1).


%adjusting the move for the shelf collision with str dodge

%move(R,(X1,Y1),T) :- direction((X1,Y1)), move(R,(X,Y),T,N), s_str_dodge(R,T), (X1,Y1) != (X,Y), (X1,Y1) != (-X,-Y).

%step_move(R,D,T1+1,N+1) :- step_move(R,D,T1,N), move(R,D,T,N), collision(R,T-1,N), T1>(T-1), (T+2)>T1, s_str_dodge(R,T).
step_move(R,(-X,-Y),T+3,N+1) :- move(R,(X,Y),T), move(R,_,T,N), s_str_dodge(R,T).

%pushing the plan back

%step_move(R,D,T1+2,N+1) :- step_move(R,D,T1,N), s_str_dodge(R,T), T1>(T+1), collision(R,T-1,N), horizon>(T1-1).

%step_pickup(R,S,T1+2,N+1) :- step_pickup(R,S,T1,N), s_str_dodge(R,T), collision(R,T-1,N),T1>(T+1), horizon>(T1-1).

%step_putdown(R,S,T1+2,N+1) :- step_putdown(R,S,T1,N), s_str_dodge(R,T), collision(R,T-1,N),T1>(T+1), horizon>(T1-1).

%shelf stands at putdown square redudant, since shelfs have unique squares to be putdowned

s_end(R,T) :- s_coll(R,T), not step_move(R,_,T+1,N), collision(R,T-1,N).

1{move(R,D,T) : direction(D), D!=D'}1 :- s_end(R,T), move(R,D',T,N), collision(R,T-1,N).




pickup(R,S,T) :- step_pickup(R,S,T,N), collision(R,T-1,N).
putdown(R,S,T) :- step_putdown(R,S,T,N), collision(R,T-1,N).

%M domain

%COLLISION TYPE 4: robot can't return to the spot it dodged from (M domain only)
%SOLUTION: reshuffling of 2 moves in the dodging robot, no move collision(nmc_dodge)

%define collsion type
%nmc_dodge(R,T) :- dodge_who(R,_,T-1), position(R,C,T-1), move(R,D,T,N), collision(R,T-2,N-1), nextto(C,D,C'), position(R',C',T-1), not step_move(R',_,T,_).

%shifting of the moves, apply step_move that would have happened in T+1 to move in T, then apply the move that was supposed to return robot to vacated spot after
move(R,D,T) :- step_move(R,D,T+1,N), nmc_dodge(R,T), collision(R,T-1,N).
step_move(R,D,T+1,N+1):- step_move(R,D,T,N), nmc_dodge(R,T), collision(R,T-1,N).

step_move(R,D,T1,N+1) :- step_move(R,D,T1,N), nmc_dodge(R,T), collision(R,T-1,N), T1>(T+1), horizon>T1.
step_pickup(R,S,T1,N+1) :- step_pickup(R,S,T1,N), nmc_dodge(R,T), collision(R,T-1,N), T1>(T+1), horizon>T1.
step_putdown(R,S,T1,N+1) :- step_putdown(R,S,T1,N), nmc_dodge(R,T), collision(R,T-1,N), T1>(T+1), horizon>T1.




%defining move/3
move(R,D,T) :- move(R,D,T,N), not wait(R,T), not dodge_who(R,_,T), not s_coll(R,T), not nmc_dodge(R,T).





{  move(R,D,T,N) : direction(D);
   pickup(R,S,T) :   isShelf(S);
  putdown(R,S,T) :   isShelf(S)} 1 :- isRobot(R), time(T), not step_move(R,_,T,N), not step_pickup(R,_,T,N), not step_putdown(R,_,T,N), collision(R,T-1,N).



% - move/3 ----------------------------------------------------------------------
position(R,C,T) :- move(R,D,T), position(R,C',T-1),     nextto(C',D,C), time(T).
                :- move(R,D,T), position(R,C ,T-1), not nextto(C ,D,_).

% - pickup/3
carries(R,S,T)  :- pickup(R,S,T), time(T), position(R,C,T-1), position(S,C,T-1).

                :- pickup(R,S,T), carries(R,_,T-1).
                :- pickup(R,S,T), carries(_,S,T-1).
                :- pickup(R,S,T),  position(R,C,T-1), not position(S,C,T-1).
                :- pickup(R,S,T),  position(S,C,T-1), not position(R,C,T-1).
                
% - putdown/3
:- putdown(R,S,T), not carries(R,S,T-1).
:- putdown(R,S,T), position(R,C,T-1), position(_,C).
:- putdown(R,S,T), position(R,C,T-1), highway(C).

% - inertia ---------------------------------------------------------------------
position(R,C,T) :- position(R,C,T-1), not move(R,_,T), isRobot(R), time(T).
carries(R,S,T)  :- carries(R,S,T-1), not putdown(R,S,T), isRobot(R), isShelf(S), time(T).

% - (in)direct effects ----------------------------------------------------------
position(S,C,T) :- position(R,C,T  ),     carries(R,S,T), isShelf(S), time(T).
position(S,C,T) :- position(S,C,T-1), not carries(_,S,T), isShelf(S), time(T).

% - edge collision --------------------------------------------------------------
moveto(C',C,T) :- nextto(C',D,C), position(R,C',T-1), move(R,D,T).
 :- moveto(C',C,T), moveto(C,C',T), C < C'.

% - vertex collision ------------------------------------------------------------
% :- { position(R,C,T) : isRobot(R) }  > 1, position(C), time(T).
% :- { position(S,C,T) : isShelf(S) }  > 1, position(C), time(T).

% - auxiliaries -----------------------------------------------------------------
% :- { position(R,C,T) } != 1, isRobot(R), time(T).
% :- { position(S,C,T) } != 1, isShelf(S), time(T).

% :- { carries(R,S,T) } > 1, isRobot(R), time(T).
% :- { carries(R,S,T) } > 1, isShelf(S), time(T).
 
