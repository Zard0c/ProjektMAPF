%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid size X: 4
%Grid size Y: 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

%init
init(object(node, 6), value(at, (2, 2))).
init(object(node, 10), value(at, (2, 3))).
init(object(node, 3), value(at, (3, 1))).
init(object(node, 7), value(at, (3, 2))).
init(object(node, 11), value(at, (3, 3))).
init(object(node, 15), value(at, (3, 4))).
init(object(node, 8), value(at, (4, 2))).
init(object(node, 5), value(at, (1, 2))).
init(object(highway, 6), value(at, (2, 2))).
init(object(highway, 7), value(at, (3, 2))).
init(object(highway, 11), value(at, (3, 3))).
init(object(highway, 10), value(at, (2, 3))).
init(object(robot,3), value(at,(3,4))).
init(object(robot,3), value(max_energy,0)).
init(object(robot,3), value(energy,0)).
init(object(shelf,3), value(at,(3,1))).
init(object(product,3),value(on,(3,1))).
init(object(order,3),value(pickingStation,0)).
init(object(order,3),value(line,(3,1))).
