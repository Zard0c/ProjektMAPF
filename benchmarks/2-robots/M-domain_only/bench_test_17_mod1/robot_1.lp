%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid size X: 8
%Grid size Y: 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

%init
init(object(node, 2), value(at, (2, 1))).
init(object(node, 10), value(at, (2, 2))).
init(object(node, 12), value(at, (4, 2))).
init(object(node, 13), value(at, (5, 2))).
init(object(node, 14), value(at, (6, 2))).
init(object(node, 7), value(at, (7, 1))).
init(object(node, 15), value(at, (7, 2))).
init(object(node, 16), value(at, (8, 2))).
init(object(node, 9), value(at, (1, 2))).
init(object(node, 11), value(at, (3, 2))).
init(object(highway, 2), value(at, (2, 1))).
init(object(highway, 10), value(at, (2, 2))).
init(object(highway, 11), value(at, (3, 2))).
init(object(highway, 12), value(at, (4, 2))).
init(object(highway, 13), value(at, (5, 2))).
init(object(highway, 14), value(at, (6, 2))).
init(object(highway, 15), value(at, (7, 2))).
init(object(highway, 7), value(at, (7, 1))).
init(object(shelf,1), value(at,(8,2))).
init(object(product,1),value(on,(1,1))).
init(object(robot,1), value(at,(2,2))).
init(object(robot,1), value(max_energy,0)).
init(object(robot,1), value(energy,0)).
init(object(order,1),value(pickingStation,0)).
init(object(order,1),value(line,(1,1))).
