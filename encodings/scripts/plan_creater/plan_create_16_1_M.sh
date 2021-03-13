#!/bin/bash

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/4-robots/bench_test_16/encoding_plan_create_M.lp ./benchmarks/4-robots/bench_test_16/robot_1.lp | grep occurs > ./lab/plans/plan_I16_1_r1_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/4-robots/bench_test_16/encoding_plan_create_M.lp ./benchmarks/4-robots/bench_test_16/robot_2.lp | grep occurs > ./lab/plans/plan_I16_1_r2_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/4-robots/bench_test_16/encoding_plan_create_M.lp ./benchmarks/4-robots/bench_test_16/robot_3.lp | grep occurs > ./lab/plans/plan_I16_1_r3_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/4-robots/bench_test_16/encoding_plan_create_M.lp ./benchmarks/4-robots/bench_test_16/robot_4.lp | grep occurs > ./lab/plans/plan_I16_1_r4_M.lp
