#include "./input.lp".

%#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')),
                                 (X,Y)=(X'-DX,Y'-DY), (X',Y')=(X+DX,Y+DY).



move(R,D,T) :- plan(R,D,T).

%attempt at solving the issue of two robots wanting to access the same square at the same time

%define a wait statement for a robot at time T, if 2 robots want to move to the same field at the same time and the robot in question is lower priority than the other
wait(R',T) :- moveto(C',C,T), moveto(C'',C,T), nextto(C',D,C), nextto(C'',D,C), position(R,C',T), position(R',C'',T), R<R'.

%disallow a robot to move if wait is true for that robot
:- move(R',D,T), wait(R',T).

%extend the ability of a robot to stay on its spot to include a situation where wait was true last turn
position(R',C,T) :- position(R',C,T-1), wait(R',T-1), not move(R',_,T), isRobot(R), time(T).

%extend move to also allow a modified plan if wait was true for a robot
%issue: we want the robot who waited to keep following the instructions in the plan except on time step later than in the plan, for all remaining moves in the plan; idea:
move(R,D,T) :- plan(R,D,T-1), wait(R,T-1).



% - move/3 ----------------------------------------------------------------------
position(R,C,T) :- move(R,D,T), position(R,C',T-1),     nextto(C',D,C).
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
