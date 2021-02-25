

serves(R,S,P,T) :- position(R,C,T), carries(R,S,T), position(P,C).

processed(O) :- ordered(O,A), target(O,P), shelved(S,A), serves(R,S,P,T).

:- ordered(O,_), not processed(O).

:- position(_,C,horizon), position(_,C).
:- not position(S,C,horizon), position(S,C,0), isShelf(S).
:- carries(_,_,horizon).
