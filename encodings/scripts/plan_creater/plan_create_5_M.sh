#!/bin/bash

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/2-robots/M-domain_only/bench_test_5/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_5/robot_1.lp | grep occurs > ./lab/plans/plan_I5_r1_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/2-robots/M-domain_only/bench_test_5/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_5/robot_2.lp | grep occurs > ./lab/plans/plan_I5_r2_M.lp
