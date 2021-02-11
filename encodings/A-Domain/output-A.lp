#show.
#show init/2.

%next lines for testing purpouses of specific code constraints

%#show pickup/3.
%#show putdown/3.
%#show carries/3.

#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
#show occurs(object(robot,R), action(pickup,object(shelf,S)),   T) :    pickup(robot(R),shelf(S),T).
#show occurs(object(robot,R), action(putdown,object(shelf,S)),  T) :    putdown(robot(R),shelf(S),T).
