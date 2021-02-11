#show.

#show plan_occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
#show plan_occurs(object(robot,R), action(pickup,object(shelf,S)),   T) :    pickup(robot(R),shelf(S),T).
#show plan_occurs(object(robot,R), action(putdown,object(shelf,S)),  T) :    putdown(robot(R),shelf(S),T).
