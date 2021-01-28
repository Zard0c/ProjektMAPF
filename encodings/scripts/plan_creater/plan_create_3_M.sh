#!/bin/bash

clingo --out-atomf="%s." -c horizon=2 ./benchmarks/2-robots/M-domain_only/bench_test_3/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_3/robot_1.lp | grep occurs > ./lab/plans/plan_I3_r1_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/2-robots/M-domain_only/bench_test_3/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_3/robot_2.lp | grep occurs > ./lab/plans/plan_I3_r2_M.lp
