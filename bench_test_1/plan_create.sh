#!/bin/bash

clingo --out-atomf="%s." -c horizon=10 ./encoding_plan_create.lp ./robot1.lp | grep occurs > plan_r1.lp

clingo --out-atomf="%s." -c horizon=10 ./encoding_plan_create.lp ./robot2.lp | grep occurs > plan_r2.lp
