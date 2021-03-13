#!/bin/bash

clingo --out-atomf="%s." -c horizon=6 ./benchmarks/2-robots/M-domain_only/bench_test_18_mod1/encoding_plan_create_M.lp ./benchmarks/2-robots/M-domain_only/bench_test_18_mod1/robot_1.lp | grep occurs > ./lab/plans/plan_I18_2_r1_M.lp

clingo --out-atomf="%s." -c horizon=6 ./benchmarks/2-robots/M-domain_only/bench_test_18_mod1/encoding_plan_create_M.lp ./benchmarks/2-robots/M-domain_only/bench_test_18_mod1/robot_2.lp | grep occurs > ./lab/plans/plan_I18_2_r2_M.lp
