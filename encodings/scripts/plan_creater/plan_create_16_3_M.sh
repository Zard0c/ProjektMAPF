#!/bin/bash

clingo --out-atomf="%s." -c horizon=5 ./benchmarks/2-robots/M-domain_only/bench_test_16_mod2/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_16_mod2/robot_1.lp | grep occurs > ./lab/plans/plan_I16_3_r1_M.lp

clingo --out-atomf="%s." -c horizon=5 ./benchmarks/2-robots/M-domain_only/bench_test_16_mod2/encoding_plan_create.lp ./benchmarks/2-robots/M-domain_only/bench_test_16_mod2/robot_2.lp | grep occurs > ./lab/plans/plan_I16_3_r2_M.lp
