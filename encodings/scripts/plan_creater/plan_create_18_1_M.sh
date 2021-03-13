#!/bin/bash

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/2-robots/M-domain_only/bench_test_18/encoding_plan_create_M.lp ./benchmarks/2-robots/M-domain_only/bench_test_18/robot_1.lp | grep occurs > ./lab/plans/plan_I18_1_r1_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/2-robots/M-domain_only/bench_test_18/encoding_plan_create_M.lp ./benchmarks/2-robots/M-domain_only/bench_test_18/robot_2.lp | grep occurs > ./lab/plans/plan_I18_1_r2_M.lp
