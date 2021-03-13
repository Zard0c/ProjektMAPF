#!/bin/bash

clingo --out-atomf="%s." -c horizon=6 ./benchmarks/3-robots/M-domain_only/bench_test_11/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_11/robot_1.lp | grep occurs > ./lab/plans/plan_I11_1_r1_M.lp

clingo --out-atomf="%s." -c horizon=6 ./benchmarks/3-robots/M-domain_only/bench_test_11/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_11/robot_2.lp | grep occurs > ./lab/plans/plan_I11_1_r2_M.lp

clingo --out-atomf="%s." -c horizon=7 ./benchmarks/3-robots/M-domain_only/bench_test_11/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_11/robot_3.lp | grep occurs > ./lab/plans/plan_I11_1_r3_M.lp
