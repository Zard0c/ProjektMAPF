#!/bin/bash

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/4-robots/bench_test_16_mod1/encoding_plan_create_M.lp ./benchmarks/4-robots/bench_test_16_mod1/robot_1.lp | grep occurs > ./lab/plans/plan_I16_2_r1_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/4-robots/bench_test_16_mod1/encoding_plan_create_M.lp ./benchmarks/4-robots/bench_test_16_mod1/robot_2.lp | grep occurs > ./lab/plans/plan_I16_2_r2_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/4-robots/bench_test_16_mod1/encoding_plan_create_M.lp ./benchmarks/4-robots/bench_test_16_mod1/robot_3.lp | grep occurs > ./lab/plans/plan_I16_2_r3_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/4-robots/bench_test_16_mod1/encoding_plan_create_M.lp ./benchmarks/4-robots/bench_test_16_mod1/robot_4.lp | grep occurs > ./lab/plans/plan_I16_2_r4_M.lp
