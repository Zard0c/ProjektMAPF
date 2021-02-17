%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid size X: 7
%Grid size Y: 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

%init
init(object(node, 2), value(at, (2, 1))).
init(object(node, 1), value(at, (1, 1))).
init(object(node, 9), value(at, (2, 2))).
init(object(node, 16), value(at, (2, 3))).
init(object(node, 23), value(at, (2, 4))).
init(object(node, 15), value(at, (1, 3))).
init(object(node, 17), value(at, (3, 3))).
init(object(node, 10), value(at, (3, 2))).
init(object(node, 11), value(at, (4, 2))).
init(object(node, 12), value(at, (5, 2))).
init(object(node, 13), value(at, (6, 2))).
init(object(node, 14), value(at, (7, 2))).
init(object(node, 4), value(at, (4, 1))).
init(object(highway, 9), value(at, (2, 2))).
init(object(highway, 16), value(at, (2, 3))).
init(object(highway, 10), value(at, (3, 2))).
init(object(highway, 11), value(at, (4, 2))).
init(object(highway, 4), value(at, (4, 1))).
init(object(highway, 12), value(at, (5, 2))).
init(object(robot,2), value(at,(1,1))).
init(object(robot,2), value(max_energy,0)).
init(object(robot,2), value(energy,0)).
init(object(shelf,2), value(at,(7,2))).
init(object(product,2),value(on,(2,1))).
init(object(order,2),value(pickingStation,0)).
init(object(order,2),value(line,(2,1))).
