#!/bin/bash

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/3-robots/M-domain_only/bench_test_14_mod/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod/robot_1.lp | grep occurs > ./lab/plans/plan_I14_2_r1_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/3-robots/M-domain_only/bench_test_14_mod/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod/robot_2.lp | grep occurs > ./lab/plans/plan_I14_2_r2_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/3-robots/M-domain_only/bench_test_14_mod/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod/robot_3.lp | grep occurs > ./lab/plans/plan_I14_2_r3_M.lp
