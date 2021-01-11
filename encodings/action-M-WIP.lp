#include "./input.lp".

%#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')),
                                 (X,Y)=(X'-DX,Y'-DY), (X',Y')=(X+DX,Y+DY).

step_move(robot(R),D,T,0) :- occurs(object(robot, R), action(move,D), T).

%transfering the step_move with highest col dept to move/4, trying to only having one move/4 per R per T

move(R,D,T,N) :- step_move(R,D,T,N), N1 == #sum{1,M:step_move(R,_,T,M)}, N == N1 - 1.
:-move(R,_,T,N), N+1 != #sum{1,M:step_move(R,_,T,M)}. 


%prioritising the robot with the lowest ID, so others have to wait in case of colision
%won't work?

wait(R2,T,N2) :- move(R1,D1,T,N1), move(R2,D2,T,N2), position(R1,C1',T-1), R2>R1, nextto(C1',D1,C), position(R2,C2',T-1), nextto(C2',D2,C).


%adjusting the plan(needing to include that T1 smaller horizon?

step_move(R,D,T1+1,N+1) :- step_move(R,D,T1,N), wait(R,T,N), T1>=T.


%defining move/3

move(R,D,T) :- move(R,D,T,N), not wait(R,T,N).

%max one move and one position per T (doesn't work yet, BP)

%:-position(R,C,T), position(R,C',T-1), wait(R,T,_), C'!=C.



%wait(robot(2),2,0).


% - move/3 ----------------------------------------------------------------------
position(R,C,T,1) :- move(R,D,T), position(R,C',T-1),     nextto(C',D,C), not wait(R,T,_).
                :- move(R,D,T), position(R,C ,T-1), not nextto(C ,D,_).

% - inertia ---------------------------------------------------------------------
position(R,C,T,2) :- position(R,C,T-1), not move(R,_,T), isRobot(R), time(T).
position(R,C,T,3) :- position(R,C,T-1), wait(R,T,_).
position(R,C,T) :- 1{position(R,C,T,_)}1, isRobot(R), time(T), position(C).

% - edge collision --------------------------------------------------------------
moveto(C',C,T) :- nextto(C',D,C), position(R,C',T-1), move(R,D,T).
 :- moveto(C',C,T), moveto(C,C',T), C < C'.

% - vertex collision ------------------------------------------------------------
 :- { position(R,C,T) : isRobot(R) }  > 1, position(C), time(T).

% - auxiliaries -----------------------------------------------------------------
 :- { position(R,C,T) } != 1, isRobot(R), time(T).    % REDUNDANT but PERFORMANT?
 
