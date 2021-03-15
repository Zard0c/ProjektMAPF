#!/bin/bash

clingo --out-atomf="%s." -c horizon=12 ./benchmarks/2-robots/domain_independend/bench_test_6/encoding_plan_create_A.lp ./benchmarks/2-robots/domain_independend/bench_test_6/robot_1.lp | grep occurs > ./lab/plans/plan_I6_r1_A.lp

clingo --out-atomf="%s." -c horizon=6 ./benchmarks/2-robots/domain_independend/bench_test_6/encoding_plan_create_A.lp ./benchmarks/2-robots/domain_independend/bench_test_6/robot_2.lp | grep occurs > ./lab/plans/plan_I6_r2_A.lp
