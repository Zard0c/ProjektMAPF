#!/bin/bash

clingo --out-atomf="%s." -c horizon=3 ./benchmarks/3-robots/M-domain_only/bench_test_13/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_13/robot_1.lp | grep occurs > ./lab/plans/plan_I13_r1_M.lp

clingo --out-atomf="%s." -c horizon=3 ./benchmarks/3-robots/M-domain_only/bench_test_13/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_13/robot_2.lp | grep occurs > ./lab/plans/plan_I13_r2_M.lp

clingo --out-atomf="%s." -c horizon=3 ./benchmarks/3-robots/M-domain_only/bench_test_13/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_13/robot_3.lp | grep occurs > ./lab/plans/plan_I13_r3_M.lp
