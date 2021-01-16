#include "./input.lp".

time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')),
                                 (X,Y)=(X'-DX,Y'-DY), (X',Y')=(X+DX,Y+DY).

step_move(robot(R),D,T,0) :- plan_occurs(object(robot, R), action(move,D), T).

%transfering the step_move with highest col dept to move/4, trying to only having one move/4 per R per T

move(R,D,T1,N) :- step_move(R,D,T1,N), collision(N,T2), T1>T2.
 
collision(N+1,T) :- wait(_,T,N).
collision(N+1,T) :- dodge_who(_,_,T,N).
collision(0,0).



%COLLISION TYPE: 2 robots want to move to same field
%SOLVING: robot with highest ID needs to wait

wait(R2,T,N2) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1',T-1), R2>R1, nextto(C1',D1,C), position(R2,C2',T-1), nextto(C2',D2,C).


%COLLISION TYPE: 2 robots want to swap places
%SOLVING: robot with highest ID needs to dodge, moving it onto the same field in the next timestep
%EXPECTED PROBLEMS: if robot with lower ID stops on the new field, needs to find a new path


dodge_coll(R1,R2,T,N1,N2) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1,T-1), R2>R1, nextto(C1,D1,C2), position(R2,C2,T-1), nextto(C2,D2,C1), collision(N,T2), T>T2.

dodge_where(R1,T,D) :- dodge_coll(R1,R2,T,N1,N2), direction(D), nextto(C1,D,C1'), position(R1,C1,T-1), position(R2,C2,T-1), C1'!=C2.

dodge_where(R2,T,D) :- dodge_coll(R1,R2,T,N1,N2), direction(D), nextto(C2,D,C2'), position(R1,C1,T-1), position(R2,C2,T-1), C2'!=C1.

%dodge_who(R1,D1,T,N1) :- dodge_coll(R1,R2,T,N1,N2), N2>N1, 1{dodge_where(R1,T,D)}1.
%dodge_who(R2,D2,T,N2) :- dodge_coll(R1,R2,T,N1,N2), N1>=N2, 1{dodge_where(R2,T,D)}1.

move(R,D,T) :- dodge_who(R,D,T,N).
step_move(R,-D,T+1,N+1) :- dodge_who(R,D,T,N).

%adjusting the plan(needing to include that T1 smaller horizon?

step_move(R,D,T1+1,N+1) :- step_move(R,D,T1,N), wait(R,T,N), (T1+1)>T, horizon>T1.
step_move(R,D,T1+2,N+1) :- step_move(R,D,T1,N), dodge_who(R,_,T,N), (T1+1)>T, horizon>(T1-1).


%defining move/3

move(R,D,T) :- move(R,D,T,N), not wait(R,T,N), not dodge_who(R,_,T,N).



% - move/3 ----------------------------------------------------------------------
position(R,C,T) :- move(R,D,T), position(R,C',T-1), nextto(C',D,C), not wait(R,T,_).
                :- move(R,D,T), position(R,C ,T-1), not nextto(C ,D,_).

% - inertia ---------------------------------------------------------------------
position(R,C,T) :- position(R,C,T-1), not move(R,_,T), isRobot(R), time(T).

% - edge collision --------------------------------------------------------------
moveto(C',C,T) :- nextto(C',D,C), position(R,C',T-1), move(R,D,T).
% :- moveto(C',C,T), moveto(C,C',T), C < C'.

% - vertex collision ------------------------------------------------------------
% :- { position(R,C,T) : isRobot(R) }  > 1, position(C), time(T).

% - auxiliaries -----------------------------------------------------------------
% :- { position(R,C,T) } != 1, isRobot(R), time(T).    % REDUNDANT but PERFORMANT?
 
