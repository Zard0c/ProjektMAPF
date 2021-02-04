#!/bin/bash

clingo --out-atomf="%s." -c horizon=7 ./benchmarks/2-robots/domain_independend/bench_test_1/encoding_plan_create_A.lp ./benchmarks/2-robots/domain_independend/bench_test_1/robot_1.lp | grep occurs > ./lab/plans/plan_I1_r1_A.lp

clingo --out-atomf="%s." -c horizon=7 ./benchmarks/2-robots/domain_independend/bench_test_1/encoding_plan_create_A.lp ./benchmarks/2-robots/domain_independend/bench_test_1/robot_2.lp | grep occurs > ./lab/plans/plan_I1_r2_A.lp
