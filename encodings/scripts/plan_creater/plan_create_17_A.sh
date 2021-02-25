#!/bin/bash

clingo --out-atomf="%s." -c horizon=9 ./benchmarks/2-robots/A-domain_only/bench_test_17/encoding_plan_create_A.lp ./benchmarks/2-robots/A-domain_only/bench_test_17/robot_1.lp | grep occurs > ./lab/plans/plan_I17_r1_A.lp

clingo --out-atomf="%s." -c horizon=9 ./benchmarks/2-robots/A-domain_only/bench_test_17/encoding_plan_create_A.lp ./benchmarks/2-robots/A-domain_only/bench_test_17/robot_2.lp | grep occurs > ./lab/plans/plan_I17_r2_A.lp
