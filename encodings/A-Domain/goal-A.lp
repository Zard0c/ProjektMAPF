
%prio1(R,S,T) :- carries(R,S,T-1), shelved(S,A), not process(O,A), ordered(O,A), horizon>T.

%prio2(R,S,T) :- carries(R,S,T-1), not prio1(R,S,T), horizon>T.

%:- prio1(R,S,T), shelved(S,A), process(O,A).
%:- prio1(R,S,T), prio2(R,S,T).

serves(S,P) :- position(R,C,T), carries(R,S,T), position(P,C).

process(O,A) :- ordered(O,A), target(O,P), shelved(S,A), serves(S,P).
processed(O) :- process(O,_).

:- ordered(O,_), not processed(O).

:- position(_,C,horizon), position(_,C).
:- not position(S,C,horizon), position(S,C,0), isShelf(S).
:- carries(_,_,horizon).
