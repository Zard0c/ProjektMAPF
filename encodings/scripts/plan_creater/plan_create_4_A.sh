#!/bin/bash

clingo --out-atomf="%s." -c horizon=12 ./benchmarks/2-robots/domain_independend/bench_test_4/encoding_plan_create_A.lp ./benchmarks/2-robots/domain_independend/bench_test_4/robot_1.lp | grep occurs > ./lab/plans/plan_I4_r1_A.lp

clingo --out-atomf="%s." -c horizon=12 ./benchmarks/2-robots/domain_independend/bench_test_4/encoding_plan_create_A.lp ./benchmarks/2-robots/domain_independend/bench_test_4/robot_2.lp | grep occurs > ./lab/plans/plan_I4_r2_A.lp
