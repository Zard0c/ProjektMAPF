#!/bin/bash

clingo --out-atomf="%s." -c horizon=6 ./benchmarks/3-robots/M-domain_only/bench_test_11_mod/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_11_mod/robot_1.lp | grep occurs > ./lab/plans/plan_I11_2_r1_M.lp

clingo --out-atomf="%s." -c horizon=7 ./benchmarks/3-robots/M-domain_only/bench_test_11_mod/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_11_mod/robot_2.lp | grep occurs > ./lab/plans/plan_I11_2_r2_M.lp

clingo --out-atomf="%s." -c horizon=6 ./benchmarks/3-robots/M-domain_only/bench_test_11_mod/encoding_plan_create.lp ./benchmarks/3-robots/M-domain_only/bench_test_11_mod/robot_3.lp | grep occurs > ./lab/plans/plan_I11_2_r3_M.lp
