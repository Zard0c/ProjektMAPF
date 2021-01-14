#include "./input.lp".

time(0..horizon).

%copy from action-M.lp direction and nextto
direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')),
                                 (X,Y)=(X'-DX,Y'-DY), (X',Y')=(X+DX,Y+DY).

%define our move orders and moveto
move(R,(DX,DY),T) :- plan_occurs(object(robot,R),action(move,(DX,DY)),T).
moveto((X',Y'),(X,Y),T) :- nextto((X',Y'),(DX,DY),(X,Y)), position(R,(X',Y'),T-1), move(R,(DX,DY),T),robot(R),time(T).


%define the new position of a robot after a move order occurred
position(R,(X+DX,Y+DY),T+1) :- move(R,(DX,DY),T), position(R,(X,Y),T),robot(R), time(T).
%and if no move occurred
position(R,(X,Y),T) :- position(R,(X,Y),T-1), not move(R,_,T), robot(R),time(T).


%collision detection
collision(R1,R2,T) :-	position(R1,(X1,Y1),T), position(R2,(X2,Y2),T), moveto((X1,Y1),(X,Y),T), moveto((X2,Y2),(X,Y),T), 				R1>R2,robot(R1),robot(R2),time(T).

%define wait (essentially, wait is true for a robot if collision is true for it) (might be superfluous)
wait(R1,T) :- collision(R1,R2,T), robot(R1), robot(R2), time(T).

%if wait is true for a robot at time T, do not allow its position to be changed in the following step.
:- position(R,(X2,Y2),T+1), position(R,(X1,Y1),T), (X2,Y2)!=(X1,Y1), wait(R,T),robot(R),time(T).

%delay the moves of a robot that would occur after the collision


new_move(R,(DX,DY),T) :- move(R,(DX,DY),T-1), wait(R,T2), T2<T, time(T),robot(R).
new_move(R,(DX,DY),T) :- move(R,(DX,DY),T), not wait(R,_).

%define new position


occurs(object(robot,R),action(move,(DX,DY),T)) :- new_move(R,(DX,DY),T).
%#show new_move/3.
#show init/2.
#show occurs/3.
