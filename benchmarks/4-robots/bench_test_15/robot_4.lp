%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid size X: 6
%Grid size Y: 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

%init
init(object(node, 8), value(at, (2, 2))).
init(object(node, 9), value(at, (3, 2))).
init(object(node, 10), value(at, (4, 2))).
init(object(node, 5), value(at, (5, 1))).
init(object(node, 11), value(at, (5, 2))).
init(object(node, 17), value(at, (5, 3))).
init(object(node, 23), value(at, (5, 4))).
init(object(node, 12), value(at, (6, 2))).
init(object(node, 7), value(at, (1, 2))).
init(object(highway, 17), value(at, (5, 3))).
init(object(robot,4), value(at,(2,2))).
init(object(robot,4), value(max_energy,0)).
init(object(robot,4), value(energy,0)).
init(object(shelf,4), value(at,(5,2))).
init(object(product,4),value(on,(4,1))).
init(object(order,4),value(pickingStation,0)).
init(object(order,4),value(line,(4,1))).
