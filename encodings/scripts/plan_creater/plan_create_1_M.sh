#!/bin/bash

clingo --out-atomf="%s." -c horizon=3 ./benchmarks/2-robots/domain_independend/bench_test_1/encoding_plan_create_M.lp ./benchmarks/2-robots/domain_independend/bench_test_1/robot_1.lp | grep occurs > ./lab/plans/plan_I1_r1_M.lp

clingo --out-atomf="%s." -c horizon=3 ./benchmarks/2-robots/domain_independend/bench_test_1/encoding_plan_create_M.lp ./benchmarks/2-robots/domain_independend/bench_test_1/robot_2.lp | grep occurs > ./lab/plans/plan_I1_r2_M.lp
