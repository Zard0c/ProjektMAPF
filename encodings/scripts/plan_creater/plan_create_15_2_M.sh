#!/bin/bash

clingo --out-atomf="%s." -c horizon=2 ./benchmarks/4-robots/bench_test_15_mod/encoding_plan_create.lp ./benchmarks/4-robots/bench_test_15_mod/robot_1.lp | grep occurs > ./lab/plans/plan_I15_2_r1_M.lp

clingo --out-atomf="%s." -c horizon=7 ./benchmarks/4-robots/bench_test_15_mod/encoding_plan_create.lp ./benchmarks/4-robots/bench_test_15_mod/robot_2.lp | grep occurs > ./lab/plans/plan_I15_2_r2_M.lp

clingo --out-atomf="%s." -c horizon=6 ./benchmarks/4-robots/bench_test_15_mod/encoding_plan_create.lp ./benchmarks/4-robots/bench_test_15_mod/robot_3.lp | grep occurs > ./lab/plans/plan_I15_2_r3_M.lp

clingo --out-atomf="%s." -c horizon=6 ./benchmarks/4-robots/bench_test_15_mod/encoding_plan_create.lp ./benchmarks/4-robots/bench_test_15_mod/robot_4.lp | grep occurs > ./lab/plans/plan_I15_2_r4_M.lp
