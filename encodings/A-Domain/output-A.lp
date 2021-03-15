#show.
#show init/2.

%next lines for testing purpouses of specific code constraints

%#show pickup/3.
%#show putdown/3.
%#show carries/3.
%#show s_end/2.
%#show s_coll/2.
%#show s_str_dodge/2.
%#show s_corn_dodge/2.
%#show s_wait/2.
%#show move/3.
%#show prio1/3.
%#show prio2/3.
%#show nmc_dodge/2.
%#show step_move/4.

%the actuall output

#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
#show occurs(object(robot,R), action(pickup,object(shelf,S)),   T) :    pickup(robot(R),shelf(S),T).
#show occurs(object(robot,R), action(putdown,object(shelf,S)),  T) :    putdown(robot(R),shelf(S),T).
