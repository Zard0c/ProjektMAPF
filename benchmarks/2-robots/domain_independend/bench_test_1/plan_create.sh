#!/bin/bash

clingo --out-atomf="%s." -c horizon=3 ./encoding_plan_create_M.lp ./robot_1.lp | grep occurs > plan_r1.lp

clingo --out-atomf="%s." -c horizon=3 ./encoding_plan_create_M.lp ./robot_2.lp | grep occurs > plan_r2.lp
