#!/bin/bash

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/3-robots/M-domain_only/bench_test_14_mod_2/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod_2/robot_1.lp | grep occurs > ./lab/plans/plan_I14_3_r1_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/3-robots/M-domain_only/bench_test_14_mod_2/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod_2/robot_2.lp | grep occurs > ./lab/plans/plan_I14_3_r2_M.lp

clingo --out-atomf="%s." -c horizon=4 ./benchmarks/3-robots/M-domain_only/bench_test_14_mod_2/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod_2/robot_3.lp | grep occurs > ./lab/plans/plan_I14_3_r3_M.lp
