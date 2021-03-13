#!/bin/bash

cp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod/instance.png ./lab/instances/instance_14_2.png

cp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod/instance.lp ./lab/instances/instance_14_2.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod/encoding.lp ./lab/instances/encoding_14_2_M.lp

./encodings/scripts/plan_creater/plan_create_14_2_M.sh

clingo --out-atomf="%s." -V0 -c horizon=8 ./lab/instances/encoding_14_2_M.lp ./lab/instances/instance_14_2.lp | grep object > ./lab/results/result_14_2_M.lp
