#show.
#show init/2.

%next lines for testing purpouses of specific code constraints
%#show wait/2.
%#show step_move/4.
%#show move/4.
%#show move/3.
%#show collision/3.
%#show dodge_coll/3.
%#show position/3.
%#show dodge_where/3.
%#show dodge_who/3.
%#show nmc_dodge/2.
%#show fr_dodge/3.
%#show frd_where/3.

#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
