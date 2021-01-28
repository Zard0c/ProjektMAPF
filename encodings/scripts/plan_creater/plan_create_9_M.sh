#!/bin/bash

clingo --out-atomf="%s." -c horizon=3 ./benchmarks/2-robots/M-domain_only/bench_test_9/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_9/robot_1.lp | grep occurs > ./lab/plans/plan_I9_r1_M.lp

clingo --out-atomf="%s." -c horizon=3 ./benchmarks/2-robots/M-domain_only/bench_test_9/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_9/robot_2.lp | grep occurs > ./lab/plans/plan_I9_r2_M.lp
