#!/bin/bash

clingo --out-atomf="%s." -c horizon=5 ./benchmarks/2-robots/M-domain_only/bench_test_2/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_2/robot_1.lp | grep occurs > ./lab/plans/plan_I2_r1_M.lp

clingo --out-atomf="%s." -c horizon=5 ./benchmarks/2-robots/M-domain_only/bench_test_2/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_2/robot_2.lp | grep occurs > ./lab/plans/plan_I2_r2_M.lp
