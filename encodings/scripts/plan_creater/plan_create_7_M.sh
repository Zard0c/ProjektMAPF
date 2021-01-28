#!/bin/bash

clingo --out-atomf="%s." -c horizon=7 ./benchmarks/2-robots/domain_independend/bench_test_7/encoding_plan_create.lp ./benchmarks/2-robots/domain_independend/bench_test_7/robot_1.lp | grep occurs > ./lab/plans/plan_I7_r1_M.lp

clingo --out-atomf="%s." -c horizon=7 ./benchmarks/2-robots/domain_independend/bench_test_7/encoding_plan_create.lp ./benchmarks/2-robots/domain_independend/bench_test_7/robot_2.lp | grep occurs > ./lab/plans/plan_I7_r2_M.lp
