#include "./input.lp".

%TODO: fixing problem of 2 positions at T; 1. move iterations, 2. position excluding

%#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')),
                                 (X,Y)=(X'-DX,Y'-DY), (X',Y')=(X+DX,Y+DY).

step_move(R,D,T,0) :- plan(R,D,T). 
move(R,D,T) :- step_move(R,D,T,C), 
%{ move(R,D,T) : direction(D) } 1 :- isRobot(R), time(T).


% - move/3 ----------------------------------------------------------------------
position(R,C,T) :- move(R,D,T), position(R,C',T-1),     nextto(C',D,C).
                :- move(R,D,T), position(R,C ,T-1), not nextto(C ,D,_).

% - inertia ---------------------------------------------------------------------
position(R,C,T) :- position(R,C,T-1), not move(R,_,T), isRobot(R), time(T).
position(R,C,T) :- position(R,C,T-1), wait(R,T).

% - edge collision --------------------------------------------------------------
moveto(C',C,T) :- nextto(C',D,C), position(R,C',T-1), move(R,D,T), not wait(R,T).
moveto(C,C,T) :- position(R,C,T-1), wait(R,T).
 :- moveto(C',C,T), moveto(C,C',T), C < C'.

% - vertex collision ------------------------------------------------------------
 :- { position(R,C,T) : isRobot(R) }  > 1, position(C), time(T).

% - auxiliaries -----------------------------------------------------------------
 :- { position(R,C,T) } != 1, isRobot(R), time(T).    % REDUNDANT but PERFORMANT?
 
%collision because both want same space
wait(R2,T) :- position(R1,C,T-1), position(R2,C,T), R1<R2.
step_move(R,D,T2,C) :- wait(R,T1), time(T2), move(R,D,T2), T2>(T1-1).

%collision because need to swap places, with swap move in plan
%swap(R2,D,T) :- position(
 
 
 
