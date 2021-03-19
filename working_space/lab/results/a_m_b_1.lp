clingo version 5.4.0
Reading from merger/Marcus/merge.lp ...
Solving...
Answer: 1
init(object(order,1),value(pickingStation,1)). init(object(order,2),value(pickingStation,1)). init(object(node,1),value(at,(1,1))). init(object(node,2),value(at,(2,1))). init(object(node,3),value(at,(3,1))). init(object(node,4),value(at,(4,1))). init(object(node,5),value(at,(5,1))). init(object(node,6),value(at,(1,2))). init(object(node,7),value(at,(2,2))). init(object(node,8),value(at,(3,2))). init(object(node,9),value(at,(4,2))). init(object(node,10),value(at,(5,2))). init(object(node,11),value(at,(1,3))). init(object(node,12),value(at,(2,3))). init(object(node,13),value(at,(3,3))). init(object(node,14),value(at,(4,3))). init(object(node,15),value(at,(5,3))). init(object(robot,1),value(at,(4,3))). init(object(shelf,1),value(at,(1,3))). init(object(product,1),value(on,(1,1))). init(object(order,1),value(line,(1,2))). init(object(robot,2),value(at,(2,3))). init(object(shelf,2),value(at,(5,3))). init(object(product,2),value(on,(2,1))). init(object(order,2),value(line,(2,2))). init(object(pickingStation,1),value(at,(1,1))). occurs(object(robot,1),action(move,(-1,0)),1). occurs(object(robot,2),action(move,(1,0)),2). occurs(object(robot,2),action(move,(1,0)),3). occurs(object(robot,1),action(move,(0,-1)),2). occurs(object(robot,1),action(move,(0,1)),3). occurs(object(robot,1),action(move,(-1,0)),4). occurs(object(robot,2),action(move,(1,0)),4). occurs(object(robot,1),action(move,(-1,0)),5).
SATISFIABLE

Models       : 1
Calls        : 1
Time         : 0.458s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
CPU Time     : 0.457s
