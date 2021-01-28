#!/bin/bash

clingo --out-atomf="%s." -c horizon=7 ./benchmarks/2-robots/M-domain_only/bench_test_8/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_8/robot_1.lp | grep occurs > ./lab/plans/plan_I8_r1_M.lp

clingo --out-atomf="%s." -c horizon=7 ./benchmarks/2-robots/M-domain_only/bench_test_8/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_8/robot_2.lp | grep occurs > ./lab/plans/plan_I8_r2_M.lp
