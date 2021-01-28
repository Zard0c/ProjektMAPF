#!/bin/bash

clingo --out-atomf="%s." -c horizon=8 ./benchmarks/2-robots/domain_independend/bench_test_4/encoding_plan_create.lp ./benchmarks/2-robots/domain_independend/bench_test_4/robot_1.lp | grep occurs > ./lab/plans/plan_I4_r1_M.lp

clingo --out-atomf="%s." -c horizon=8 ./benchmarks/2-robots/domain_independend/bench_test_4/encoding_plan_create.lp ./benchmarks/2-robots/domain_independend/bench_test_4/robot_2.lp | grep occurs > ./lab/plans/plan_I4_r2_M.lp
