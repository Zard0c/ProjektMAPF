#show.

#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
#show occurs(object(robot,R), action(pickup,S),   T) :    pickup(robot(R),shelf(S),T).
#show occurs(object(robot,R), action(putdown,S),  T) :    putdown(robot(R),shelf(S),T).
