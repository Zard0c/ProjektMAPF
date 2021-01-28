#!/bin/bash

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/3-robots/M-domain_only/bench_test_11/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_11/robot_1.lp | grep occurs > ./lab/plans/plan_I11_r1_M.lp

clingo --out-atomf="%s." -c horizon=7 ./benchmarks/3-robots/M-domain_only/bench_test_11/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_11/robot_2.lp | grep occurs > ./lab/plans/plan_I11_r2_M.lp

clingo --out-atomf="%s." -c horizon=8 ./benchmarks/3-robots/M-domain_only/bench_test_11/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_11/robot_3.lp | grep occurs > ./lab/plans/plan_I11_r3_M.lp
